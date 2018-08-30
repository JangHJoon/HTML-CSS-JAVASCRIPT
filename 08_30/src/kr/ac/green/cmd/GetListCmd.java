package kr.ac.green.cmd;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Post;

public class GetListCmd implements ICmd {

	@Override
	public String action(HttpServletRequest request,
			HttpServletResponse response) {
		// 페이당 표시할 게시물의 수
		int perPage = 3;
		String strNum = request.getParameter("pageNum");
		int pageNum = 1;
		if(strNum != null){
			pageNum = Integer.parseInt(strNum);
		}
						
		IDao dao = DaoFactory.getDao();
		
		// 연결후 필요한 질의만 다하고 close 한다.
		Connection con = dao.connect();		
		int totalCount = dao.getTotalCount(con);
		Post[] posts = dao.getList(con, pageNum, perPage);
		dao.close(con);
		
		// 페이징 수 계산
		int pageCount = totalCount / perPage;
		if(totalCount % perPage != 0){
			pageCount++;
		}
		
		request.setAttribute("posts", posts);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNum", pageNum);	
		
		
		return "list.jsp";
	}

	

}
