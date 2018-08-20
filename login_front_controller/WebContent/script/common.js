/*
 * @param
 * - arguments[0] : current form
 * - arguments[1] : command what to do
 * - arguments[2] : need check or not 
 */
function doWhat() {
	var formObj = arguments[0];	
	formObj.action = "main.jsp";
	// �׼�ó���� ��� main.jsp(front controller)���� 
	
	var pass = true;
	if(arguments[2]) {		
		formObj.method = "post";
		pass = hasBlank(formObj);
	}
	
	if(pass) {
		formObj.cmd.value = arguments[1];	
		// �ڹٽ�ũ��Ʈ�� �ѱ� ������ �߰� �� �� *****
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
		if(checkList.indexOf(field.type) != -1) { // �ش� type Ȯ��
			if(field.value.trim() == "") { // type ��ĭ �˻�
				pass = false;
				alert("�ʼ��Է»��״���.(" + field.title + ")");
				field.focus();
			}
		}		
	}
	return pass;
}