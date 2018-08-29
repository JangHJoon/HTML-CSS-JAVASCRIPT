package kr.ac.green;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

public class DeleteCmd implements ICmd {

	@Override
	public void exec(HttpServletRequest request) {
		
		String str_id = request.getParameter("item_id");
		int id = 0;
		try{
			id = Integer.parseInt(str_id);
		} catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		ItemDao dao = ItemDao.getInstance();
		Connection con = null;
		int resultRow = 0;			
		try {
			con = dao.connect();
			resultRow = dao.deleteItem(con, id);			
			
		} catch (ConnectionFailException e) {
			e.printStackTrace();
		} finally {
			dao.close(con);
		}
		
		String nextPage = null;
		if(resultRow == 0){
			nextPage = "error.jsp";			
		} else {
			nextPage = "list.jsp";
			request.setAttribute("isRedirect", true);
		}
		
		request.setAttribute("nextPage", nextPage);
		
		
		
	}

}
