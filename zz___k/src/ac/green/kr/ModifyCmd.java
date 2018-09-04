package ac.green.kr;

import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class ModifyCmd implements ICmd {

	@Override
	public void doAction(HttpServletRequest request) {
		ServletContext application = request.getSession().getServletContext();
		Vector<Stock> list = (Vector<Stock>)application.getAttribute("stockList");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		String sort = request.getParameter("sort");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String exp = request.getParameter("exp");
		
		for(Stock s : list) {
			if(s.getNo() == no) {
				s.setSort(sort);
				s.setAmount(amount);
				s.setExp(exp);
			}
		}
		request.setAttribute("isRedirect", true);
	}

}
