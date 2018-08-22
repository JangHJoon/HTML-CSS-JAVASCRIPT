package kr.ac.green;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SearchCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		String sel = request.getParameter("select");
		String menu = request.getParameter("menu");
		String find = request.getParameter("search").trim();
		
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		
		MyList list = (MyList)application.getAttribute("list");
		if(list == null){
			list = new MyList();
			application.setAttribute("list", list);
		}
		
		Student[] result = null;
		if(sel.equals("id")){
			System.out.println("in id");
			try{
				Integer index = Integer.parseInt(find);
				
				System.out.println("index" + index);
				Student s = list.getById(index);
				if(s != null){
					System.out.println("if in2");
					result = new Student[]{s};
				}
			}catch(Exception e){}
		} else if(sel.equals("name")){
			
			result = list.getByName(find);
			
		} else if(sel.equals("class")){
			result = list.getByClass(find);
		}
		
		if(result == null){
			result = new Student[0];
		}
		
		
		if(menu == null){
			menu = "list";
		}
		
		request.setAttribute("nextPage", "main.jsp?menu="+menu);
		request.setAttribute("search", result);
	}
	

}
