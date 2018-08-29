package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Dummy;

public class ShowDummyCmd implements ICmd {
	@Override
	public String action(HttpServletRequest request) {
		int number = 
			Integer.parseInt(request.getParameter("number"));
		IDao dao = DaoFactory.getDao();
		Connection con = dao.connect();
		Dummy dummy = dao.getByNumber(con, number);
		request.setAttribute("dummy", dummy);		
		return "dummy.jsp";
	}	
}












