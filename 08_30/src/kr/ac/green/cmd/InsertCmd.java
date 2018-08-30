package kr.ac.green.cmd;


import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Post;


public class InsertCmd implements ICmd {

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) {
		
		String strBNum = request.getParameter("b_num");
		int b_num = 1;
		if(strBNum != null){
			b_num = Integer.parseInt(strBNum);
		}
		
		String title = request.getParameter("p_title");
		String password = request.getParameter("p_password");
		String content = request.getParameter("p_content");
		String ip = request.getRemoteAddr();		
		
		IDao dao = DaoFactory.getDao();
		Connection con = dao.connect();
		int resultRow = dao.insert(con, new Post(ip, password, title, content));		
		Post[] posts = dao.getList(con, 1, 3);
		dao.close(con);
		System.out.println("resultRow : " +resultRow);
		
		request.setAttribute("posts", posts);
		
		if(resultRow == 0){
			return "list.jsp";
		} else {
			return "list.jsp";
		}
	}

}
