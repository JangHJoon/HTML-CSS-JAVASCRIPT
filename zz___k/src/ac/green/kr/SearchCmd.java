package ac.green.kr;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class SearchCmd implements ICmd {

	@Override
	public void doAction(HttpServletRequest request) {
		String searchText = request.getParameter("search");
		String select = request.getParameter("select");
		String menu = request.getParameter("menu");
		
		ServletContext application = request.getSession().getServletContext();
		Vector<Stock> list = (Vector<Stock>)application.getAttribute("stockList");
		if(list == null) {
			list = new Vector<Stock>();
			application.setAttribute("stockList", list);
		}
		Vector<Stock> result = new Vector<Stock>();
		for(Stock s : list) {
			if(select.equals("no")) {
				try {
					if(s.getNo() == Integer.parseInt(searchText)) {
						result.add(s);
					}
				} catch(Exception e) {}
			} else if(select.equals("name")) {
				if(s.getName().equals(searchText)) {
					result.add(s);
				}
			} else if(select.equals("sort")) {
				if(s.getSort().equals(searchText)) {
					result.add(s);
				}
			} 
		}
		
		String nextPage = "main.jsp";
		if(menu != null && !menu.equals("")) {
			nextPage += "?menu=" + menu;
		}
		request.setAttribute("result", result);
		request.setAttribute("nextPage", nextPage);
	}
}
