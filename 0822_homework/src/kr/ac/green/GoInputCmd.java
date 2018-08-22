package kr.ac.green;

import javax.servlet.http.HttpServletRequest;

public class GoInputCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		request.setAttribute("nextPage", "main.jsp?menu=input");
	}
	
	

}
