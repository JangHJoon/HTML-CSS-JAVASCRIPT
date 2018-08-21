package kr.ac.green;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class logoutCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		request.setAttribute("nextPage", "loginForm.jsp");
		
	}
	

}
