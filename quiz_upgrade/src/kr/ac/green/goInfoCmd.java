package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class goInfoCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			//error
		}
		
		
		ServletContext application = session.getServletContext();
		Hashtable<String, User> userList =(Hashtable<String, User>)application.getAttribute("userData");
		
		
		
		if(userList == null){
			//error
		}
	
		if(!userList.containsKey(id)){
			//error
		}
		
		
		
		if(session.getAttribute("id") != null){
			request.setAttribute("user", userList.get(id));
			request.setAttribute("nextPage", "info.jsp");
		} else {
			// 시간이 지나 로그인 풀린 상태 
			request.setAttribute("nextPage", "loginForm.jsp");
		}
		
	}
	

}
