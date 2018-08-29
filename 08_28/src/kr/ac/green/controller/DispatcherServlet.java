package kr.ac.green.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.green.dao.DaoFactory;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DispatcherServlet() {
    }
    
    
    // <load-on-startup>0</load-on-startup>이므로 서버가 실행 될때 수행됨
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String db = config.getInitParameter("db");
		DaoFactory.init(db);
		CmdFactory.init();
	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1).replace(".html", "");
		
		
		System.out.println("cmd : " + cmd);
		String nextPage = CmdFactory.searchAndDo(request, cmd);
		if(request.getAttribute("isRedirect") != null){
			response.sendRedirect(nextPage);
		} else {
			request.getRequestDispatcher(nextPage).forward(request, response);
		}
		
		
		
		
		
		
		
		
	}

}
