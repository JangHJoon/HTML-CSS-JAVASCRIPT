/**
 * 
 */


	
	function login(){
		if(checkValid()){
			
			var formObj = document.loginForm;
			formObj.method = "post";
			formObj.action = "/quiz/loginForm.jsp";
			formObj.submit();
			
		}		
	}
	
	function goJoin(){
		location.href="join.jsp";
	}
	
	
	function checkValid(){
		
		var id = document.getElementsByName("u_id")[0];
		var pw = document.getElementsByName("u_pw")[0];			
		var msgBox = document.getElementsByClassName("msgBox")[0];
		
		if(!id.value.trim()){
			msgBox.innerHTML="아이디를 입력해주세요";
			id.focus();
			return false;
		} 
		if(!pw.value.trim()){
			msgBox.innerHTML="패스워드를 입력해주세요";			
			pw.focus();
			return false;
		}
		return true;
		
			
				
	}
	function init(){
		document.getElementById("u_id").value=arguments[0];
		document.getElementById("u_id").disabled=true;
		document.getElementById("u_name").value=arguments[1];
		document.getElementById("u_name").disabled=true;
		document.getElementById("u_nick").value=arguments[2];	
	}

	function modify(){
		if(chkBlank() && chkPw()){
		
			var formObj = document.infoForm;
			formObj.method="post";
			formObj.action="/quiz/info.jsp";
			formObj.submit();
			
		}
	}	

	function goSuccess(){		
		location.href="/quiz/loginSuccess.jsp";
	}
	
	function withdraw(){
		
	    var r = prompt("비밀번호를 입력해주세요" , "");
	    if (r != null ) {    	
			location.href="/quiz/info.jsp?withdraw="+r;
	    } else {
	    	// 취소	
	    }	
	}
	
	function chkPw(){
		var pw = document.getElementById("u_pw");
		var re = document.getElementById("u_re");
		var msgBox = document.getElementById("msg");
		
		if(pw.value.trim() != "" && re.value.trim() != "" && pw.value != re.value){
			msgBox.innerHTML = "비밀번호가 일치하지 않습니다.";	
			return false;
		} else {
			msgBox.innerHTML = "";
			return true;
		}		
	}

	
	function info(){
		location.href="/quiz/info.jsp";
	}
	function logout(){
		location.href="/quiz/loginSuccess.jsp?logout=1";	
	}
	
	
	function goLogin(){			
		location.href="/quiz/loginForm.jsp";	
	}	
	function join(){		
		if(chkBlank() && chkPw()){			
			var formObj = document.joinForm;
			formObj.method = "post";
			formObj.action = "/quiz/join.jsp";
			formObj.submit();		
		}
	}	
	function chkBlank(){		
		var formObj = document.joinForm;
		if(formObj == null){
			formObj = document.infoForm;
		}
		var msg = "";
		var msgBox = document.getElementById("msg");
		for(var i=0 ; i<formObj.length ; i++){
			if(formObj[i].type != "button"){
				if(!formObj[i].value.trim()){
					var what = formObj[i].previousSibling.previousSibling.innerHTML.replace(" :","");
					msg = what + "(을)를 입력하세요";
					msgBox.innerHTML=msg;
					formObj[i].focus();
					return false;
				}				
			}			
		}		
		return true;		
	}	
	function chkId(){		
		var id = document.getElementById("u_id").value;
		if(id.trim()){		
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("msg").innerHTML = this.responseText;
				}
			};
			xhttp.open("POST", "/quiz/check.jsp", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("checkId="+id);		
		}
	}	
