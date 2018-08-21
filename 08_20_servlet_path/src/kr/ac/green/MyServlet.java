package kr.ac.green;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		action(request, response);
	}
	private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// application 구하기
		ServletContext application = 
			request.getSession().getServletContext();
		
		Vector<Product> list = 
			(Vector<Product>)application.getAttribute("productList");
		
		if(list == null) {
			list = new Vector<Product>();
			application.setAttribute("productList", list);
		}
		
		String uri = request.getRequestURI();
		
		String contextPath = request.getContextPath();
				
		String cmd = uri.substring(contextPath.length());
		
		System.out.println("cmd : " + cmd);
		if(cmd == null) {
			cmd = "/list.do";
		}
	
		String nextPage = "";
		boolean isRedirect = false;
		if(cmd.equals("/list.do") || cmd.equals("/cancelInput.do")) {
			nextPage = "list.jsp";
			request.setAttribute("list", list);
		} else if(cmd.equals("/goInput.do")) {
			nextPage = "input.jsp";
		} else if(cmd.equals("/input.do")) {
			String name = request.getParameter("name");
			int price = 
				Integer.parseInt(request.getParameter("price"));
			
			Product p = new Product(name, price);
			list.add(p);
			isRedirect = true;
		}
		
		
		if(isRedirect) {
			// root로~ redirect
			response.sendRedirect(request.getContextPath());
		} else {
			// forward
			RequestDispatcher rd = 
				request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
	}
}













