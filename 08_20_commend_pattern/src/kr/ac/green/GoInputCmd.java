package kr.ac.green;

import javax.servlet.http.HttpServletRequest;

public class GoInputCmd implements ICmd {

	@Override
	public void doAction(HttpServletRequest request) {
		request.setAttribute("nextPage", "input.jsp");
	}	
}
