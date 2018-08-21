package kr.ac.green;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class InputCmd implements ICmd {

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
		
		
		String name = request.getParameter("name");
		int price = 
			Integer.parseInt(request.getParameter("price"));
		
		Product p = new Product(name, price);
		list.add(p);
		request.setAttribute("isRedirect", true);
	}
}










