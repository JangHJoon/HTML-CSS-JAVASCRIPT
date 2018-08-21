package kr.ac.green;

import javax.servlet.http.HttpServletRequest;

public class goLoginCmd implements ICmd {

	@Override
	public void todo(HttpServletRequest request) {		
		request.setAttribute("nextPage", "loginForm.jsp");
	}
	

}
