package kr.ac.green.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullCmd implements ICmd {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) {			
		return "insert.jsp";
	}	
}
