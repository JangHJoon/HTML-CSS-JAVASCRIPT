package ac.green.kr;

import javax.servlet.http.HttpServletRequest;

public class BadAccessCmd implements ICmd {

	@Override
	public void doAction(HttpServletRequest request) {
		request.setAttribute("nextPage", "badAccess.jsp");
	}
	
}
