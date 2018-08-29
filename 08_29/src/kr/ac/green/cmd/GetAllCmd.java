package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Dummy;

public class GetAllCmd implements ICmd {

	@Override
	public String action(HttpServletRequest request) {
		IDao dao = DaoFactory.getDao();
		Connection con = dao.connect();
		Dummy[] list = dao.getAll(con);
		request.setAttribute("list", list);
		return "list.jsp";
	}	
}













