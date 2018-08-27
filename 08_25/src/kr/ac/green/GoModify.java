package kr.ac.green;

import javax.servlet.http.HttpServletRequest;

public class GoModify implements ICmd {

	@Override
	public void exec(HttpServletRequest request) {
			
		String item_id = request.getParameter("item_id");
		request.setAttribute("nextPage", "modify.jsp?id=" + item_id);
		
	}
	

}
