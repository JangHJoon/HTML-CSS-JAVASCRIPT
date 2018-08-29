package kr.ac.green.cmd;

import javax.servlet.http.HttpServletRequest;

public class NullCmd implements ICmd {

	@Override
	public String action(HttpServletRequest request) {
		
		
		
		return "insert.jsp";
	}
	
	

}
