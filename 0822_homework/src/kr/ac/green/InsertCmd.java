package kr.ac.green;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class InsertCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		
		
		
		
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String grade = request.getParameter("grade");
		String clazz = request.getParameter("class");
		
		// null check
		
		
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		MyList list=(MyList)application.getAttribute("list");
		if(list == null){
			list = new MyList();
			application.setAttribute("list", list);
		}
			
		list.add(name, tel, grade, clazz);
		
		
		request.setAttribute("nextPage", request.getContextPath());
		request.setAttribute("isRedirect", true);
				
		
		
		
		
	}
	

}
