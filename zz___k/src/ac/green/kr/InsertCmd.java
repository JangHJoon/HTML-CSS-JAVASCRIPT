package ac.green.kr;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class InsertCmd implements ICmd {

	@Override
	public void doAction(HttpServletRequest request) {
		ServletContext application = request.getSession().getServletContext();
		Vector<Stock> list = (Vector<Stock>)application.getAttribute("stockList");
		
		Object temp = application.getAttribute("count");
		int count = 0;
		if(temp != null) {
			count = (Integer)temp;
		}
		if(list == null) {
			list = new Vector<Stock>();
			application.setAttribute("stockList", list);
			count = 0;
			application.setAttribute("count", count);
		}
		
		String name = request.getParameter("name");
		String sort = request.getParameter("sort");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String exp = request.getParameter("exp");
		count++;
		list.add(new Stock(count, name, sort, amount, exp));
		
		application.setAttribute("count", count);
		request.setAttribute("isRedirect", true);
				
	}
	
}
