package ac.green.kr;

import javax.servlet.http.HttpServletRequest;

public class GoDeleteCmd implements ICmd {

	@Override
	public void doAction(HttpServletRequest request) {
		request.setAttribute("nextPage", "main.jsp?menu=delete");
	}
	
}
