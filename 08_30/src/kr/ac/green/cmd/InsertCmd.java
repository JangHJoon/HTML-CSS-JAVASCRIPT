package kr.ac.green.cmd;


import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Post;


public class InsertCmd implements ICmd {

	@Override
	public String action(HttpServletRequest request) {
		
		String title = request.getParameter("p_title");
		String password = request.getParameter("p_password");
		String content = request.getParameter("p_content");
		String ip = request.getRemoteAddr();		
		
		System.out.println(11);
		IDao dao = DaoFactory.getDao();
		Connection con = dao.connect();
		int resultRow = dao.insert(con, new Post(ip, password, title, content));		
		dao.close(con);
		
		if(resultRow == 0){
			return "list.jsp";
		} else {
			return "list.jsp";
		}
	}

}
