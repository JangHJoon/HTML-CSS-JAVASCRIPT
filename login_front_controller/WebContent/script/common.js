/*
 * @param
 * - arguments[0] : current form
 * - arguments[1] : command what to do
 * - arguments[2] : need check or not 
 */
function doWhat() {
	var formObj = arguments[0];	
	formObj.action = "main.jsp";
	var pass = true;
	if(arguments[2]) {		
		method = "post";
		pass = hasBlank(formObj);
	}
	if(pass) {
		formObj.cmd.value = arguments[1];	
		formObj.submit();
	}	
}

function hasBlank() {
	var formObj = arguments[0];
	var checkList = new Array("text", "password", "textarea");
	var pass = true;
	for(var i=0; pass && i<formObj.length; i++) {
		var field = formObj[i];
		if(checkList.indexOf(field.type) != -1) {
			if(field.value == "") {
				pass = false;
				alert("필수입력사항누락.(" + field.title + ")");
				field.focus();
			}
		}		
	}
	return pass;
}