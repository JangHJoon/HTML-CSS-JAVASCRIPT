package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Dummy;

public class InsertCmd implements ICmd {

	@Override
	public String action(HttpServletRequest request) {
		
		String first = request.getParameter("first");
		String second = request.getParameter("second");
		Dummy dummy = new Dummy(first, second);
		
		IDao dao = DaoFactory.getDao();
		Connection con = dao.connect();
		
		dao.insert(con, dummy);
		dao.close(con);
		request.setAttribute("isRedirect", true);		
		
		return request.getContextPath();
	}
	

}
