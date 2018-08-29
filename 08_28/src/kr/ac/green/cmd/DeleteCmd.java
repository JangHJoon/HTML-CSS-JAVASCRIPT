package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;

public class DeleteCmd implements ICmd{

	@Override
	public String action(HttpServletRequest request) {
		
		int number = Integer.parseInt(request.getParameter("number"));
		
		IDao dao = DaoFactory.getDao();
		Connection con = dao.connect();
		int result = dao.delete(con, number);
		dao.close(con);
		
		request.setAttribute("isRedirect", true);
		return request.getContextPath();
	}
	

}
