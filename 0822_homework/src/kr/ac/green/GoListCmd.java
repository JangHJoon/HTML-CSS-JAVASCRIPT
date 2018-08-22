package kr.ac.green;

import javax.servlet.http.HttpServletRequest;

public class GoListCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		request.setAttribute("nextPage", "main.jsp");
		
	}
	

}
