package kr.ac.green;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class goLoginSuccessCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") != null){
			request.setAttribute("nextPage", "loginSuccess.jsp");
		} else {
			request.setAttribute("nextPage", "loginForm.jsp");
		}
	}
	

}
