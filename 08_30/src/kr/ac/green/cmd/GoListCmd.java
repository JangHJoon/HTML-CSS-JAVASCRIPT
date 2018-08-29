package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Post;

public class GoListCmd implements ICmd{

	@Override
	public String action(HttpServletRequest request) {
		
		
		IDao dao = DaoFactory.getDao();
		Connection con = dao.connect();
		Post[] posts = dao.getList(con, 1, 3);		
		dao.close(con);
		
		request.setAttribute("posts", posts);
		return "list.jsp";
		
	}
	

}
