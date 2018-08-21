package kr.ac.green;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyServlet
 */
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
	
	
	
		String uri = request.getRequestURI();		
		String contextPath = request.getContextPath();	
		
		String cmd = uri.substring(contextPath.length()+1).replace(".do", "");
		
		System.out.println("cmd : " + cmd);
		
		CmdFactory.searchAndDo(request, cmd);
		
		String nextPage = (String)request.getAttribute("nextPage");
		Object isRedirect = request.getAttribute("isRedirect");
		
		System.out.println("nextPage : " + nextPage);
		System.out.println("isRedirect : " + isRedirect);
		
		if(isRedirect != null){			
			response.sendRedirect(nextPage);
			
		} else {			
			request.getRequestDispatcher(nextPage).forward(request, response);
		}
	
	
	
	
	
	
	
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
