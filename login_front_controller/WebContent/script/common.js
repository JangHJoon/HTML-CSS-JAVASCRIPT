/*
 * @param
 * - arguments[0] : current form
 * - arguments[1] : command what to do
 * - arguments[2] : need check or not 
 */
function doWhat() {
	var formObj = arguments[0];	
	formObj.action = "main.jsp";
	// 액션처리는 모두 main.jsp(front controller)에서 
	
	var pass = true;
	if(arguments[2]) {		
		formObj.method = "post";
		pass = hasBlank(formObj);
	}
	
	if(pass) {
		formObj.cmd.value = arguments[1];	
		// 자바스크립트로 넘길 값들을 추가 할 때 *****
		formObj.submit();
	}	
}

function hasBlank() {
	var formObj = arguments[0];
	var checkList = ["text", "password"];	
	//var checkList = new Array("text", "password", "textarea");
	 
	var pass = true;
	for(var i=0; pass && i<formObj.length; i++) {
		var field = formObj[i];
		if(checkList.indexOf(field.type) != -1) { // 해당 type 확인
			if(field.value.trim() == "") { // type 빈칸 검사
				pass = false;
				alert("필수입력사항누락.(" + field.title + ")");
				field.focus();
			}
		}		
	}
	return pass;
}