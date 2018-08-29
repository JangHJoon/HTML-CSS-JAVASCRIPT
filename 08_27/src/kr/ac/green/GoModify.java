package kr.ac.green;

import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dto.Item;

public class GoModify implements ICmd {

	@Override
	public void exec(HttpServletRequest request) {
			
		String item_id = request.getParameter("item_id");
		
		ItemDao dao = ItemDao.getInstance();
		
		Connection con = null;
		int resultRow = 0;
		try {
			con = dao.connect();
			Item item = dao.selectItem(con, item_id);
			
			
		} catch (ConnectionFailException e) {
			e.printStackTrace();
		} finally {
			dao.close(con);
		}
		
		
		
		
		
		request.setAttribute("nextPage", "modify.jsp?id=" + item_id);
		
	}
	

}
