package kr.ac.green;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MyServlet() {
        super();
    }
    
    

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		CmdFactory.init();
	
	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String contextpath = request.getContextPath();
//		System.out.println(contextpath);
		
		String url = request.getRequestURI();
//		System.out.println(url);
		
		String cmd = url.substring(contextpath.length()+1).replace(".do", "");
		
		System.out.println("get cmd : " + cmd);		
		
		CmdFactory.getAndAction(request, cmd);
		
		String nextPage = (String)request.getAttribute("nextPage");
		Object isRedirect = request.getAttribute("isRedirect");
		
		if(isRedirect == null){
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else {
			response.sendRedirect(nextPage);
		}
		
		
		
		
	}

}
