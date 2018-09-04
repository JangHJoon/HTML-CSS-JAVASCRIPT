package ac.green.kr;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		CmdFactory.initCmds();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		action(request, response);
	}
	
	private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = uri.substring(contextPath.length());
		
		CmdFactory.searchAndDo(request, cmd);
		
		if(request.getAttribute("isRedirect") != null) {
			response.sendRedirect(request.getContextPath());
		} else {
			String nextPage = request.getAttribute("nextPage").toString();
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
	}

}
