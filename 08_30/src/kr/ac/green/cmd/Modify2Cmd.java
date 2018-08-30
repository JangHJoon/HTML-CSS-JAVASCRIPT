package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Post;

public class Modify2Cmd implements ICmd{

	@Override
	public String action(HttpServletRequest request,HttpServletResponse response) {
		
		int id = Integer.parseInt(request.getParameter("p_id"));
		String title = request.getParameter("p_title");
		String pw = request.getParameter("p_password");
		System.out.println("modify pw : " + pw);
		String content = request.getParameter("p_content");
		String ip = request.getRemoteAddr();
		
		Post post = new Post(id, ip, pw, title, content, "");
		
		IDao dao = DaoFactory.getDao();
		Connection con = dao.connect();
		
		int resultRow = dao.update(con, post);
		
		dao.close(con);
		
		
		
		request.setAttribute("isRedirect", true);
		
		return request.getContextPath();
	}
	

}
