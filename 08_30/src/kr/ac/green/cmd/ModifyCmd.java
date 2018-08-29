package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Post;

public class ModifyCmd implements ICmd{

	@Override
	public String action(HttpServletRequest request) {
			String pw = request.getParameter("p_password");
			int id = Integer.parseInt(request.getParameter("p_id"));
			
			IDao dao = DaoFactory.getDao();
			Connection con = dao.connect();
			Post post = dao.getPost(con, id);			
			dao.close(con);
			
			
			if(post.getP_password().equals(pw)){
				request.setAttribute("post", post);
				return "modify.jsp";
			} else { 				
				return "invalidPw.jsp";
			}
	}
	

}
