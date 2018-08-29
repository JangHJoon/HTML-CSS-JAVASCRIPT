package kr.ac.green;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import kr.ac.green.dto.Item;

public class InsertCmd implements ICmd {

	@Override
	public void exec(HttpServletRequest request) {
		
		String name = request.getParameter("item_name");
		String str_price = request.getParameter("item_price");
		int price = 0;
		try{
			price = Integer.parseInt(str_price);
		} catch(NumberFormatException e){
			e.printStackTrace();
		}
		
		ItemDao dao = ItemDao.getInstance();
		Connection con = null;
		
		Item item = new Item(name, price);
		int resultRow = 0;
		try {
			con = dao.connect();
			resultRow = dao.insertItem(con, item);
		} catch (ConnectionFailException e) {
			e.printStackTrace();
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
