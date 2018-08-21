package kr.ac.green;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class ListCmd implements ICmd {

	@Override
	public void doAction(HttpServletRequest request) {
		ServletContext application = 
				request.getSession().getServletContext();
		
		Vector<Product> list = 
			(Vector<Product>)application.getAttribute("productList");
		
		if(list == null) {
			list = new Vector<Product>();
			application.setAttribute("productList", list);
		}
		
		request.setAttribute("nextPage", "list.jsp");
		request.setAttribute("list", list);
		
	}	
}










