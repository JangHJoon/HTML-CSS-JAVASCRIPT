package kr.ac.green;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dto.Item;

public class ModifyCmd implements ICmd {

	@Override
	public void exec(HttpServletRequest request) {
		
		String str_id = request.getParameter("item_id");
		String name = request.getParameter("item_name");
		String str_price = request.getParameter("item_price");
		
		int id = 0;
		int price = 0;
		try{
			id = Integer.parseInt(str_id);
			price = Integer.parseInt(str_price);
		} catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		Item item = new Item(name, price);
		
		ItemDao dao = ItemDao.getInstance();
		Connection con = null;
		int resultRow = 0;
		try {
			con = dao.connect();
		
			resultRow = dao.updateItem(con, id, item);
			
		
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
