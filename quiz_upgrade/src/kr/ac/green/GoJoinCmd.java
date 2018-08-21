package kr.ac.green;

import javax.servlet.http.HttpServletRequest;

public class GoJoinCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		request.setAttribute("nextPage", "join.jsp");		
	}

}
