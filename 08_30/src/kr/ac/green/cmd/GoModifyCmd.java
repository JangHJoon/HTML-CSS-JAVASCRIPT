package kr.ac.green.cmd;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Post;

public class GoModifyCmd implements ICmd {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) {
		
		int id = Integer.parseInt(request.getParameter("p_id"));
		IDao dao = DaoFactory.getDao();
		Connection con = dao.connect();
		Post post = dao.getPost(con, id);
		dao.close(con);
		
		request.setAttribute("post", post);				
		
		return "modify.jsp?p_id=" + id;
	}
	

}
