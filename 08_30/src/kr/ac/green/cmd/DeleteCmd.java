package kr.ac.green.cmd;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Post;

public class DeleteCmd implements ICmd{

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) {
			String pw = request.getParameter("p_password");
			int id = Integer.parseInt(request.getParameter("p_id"));
			
			IDao dao = DaoFactory.getDao();
			Connection con = dao.connect();
			if(dao.checkPw(con, id, pw)){
				System.out.println("pw valid");
				dao.delete(con, id);
				request.setAttribute("ajax", true);
				try {
					response.getWriter().write("valid");
				} catch (IOException e) {
					e.printStackTrace();
				}
				dao.close(con);			
				
			} else {
				
				System.out.println("pw invalid");
				try {
					request.setAttribute("ajax", true);
					response.getWriter().write("invalid");
				} catch (IOException e) {
					e.printStackTrace();
				}				
				dao.close(con);			
			}
				
			
				
			return "";
	}
	
}
