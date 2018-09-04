package ac.green.kr;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class DeleteCmd implements ICmd {

	@Override
	public void doAction(HttpServletRequest request) {
		ServletContext application = request.getSession().getServletContext();
		Vector<Stock> list = (Vector<Stock>)application.getAttribute("stockList");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String sort = request.getParameter("sort");
		int amount = Integer.parseInt(request.getParameter("amonut"));
		String exp = request.getParameter("exp");
		
		Stock temp = null;
		for(Stock s : list) {
			if(s.getNo() == no) {
				temp = s;
			}
		}
		if(temp != null) {
			list.remove(temp);
		}
		request.setAttribute("isRedirect", true);
	}

}
