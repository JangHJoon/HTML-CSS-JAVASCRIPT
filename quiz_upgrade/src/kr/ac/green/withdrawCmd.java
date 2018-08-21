package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class withdrawCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
		String pw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if(id == null){
			//error
		}
		
		/// 데이터베이스
		ServletContext application = session.getServletContext();
		Hashtable<String, User> userList = (Hashtable<String, User>)application.getAttribute("userData");
		
		if(userList == null){
			//error			
		}
		
		if(!userList.containsKey(id)){
			//error
		}
		
		if(userList.get(id).getPw().equals(pw)){
			//비밀번호 일치
			userList.remove(id);
			session.invalidate();
			request.setAttribute("isRedirect", true);
			request.setAttribute("nextPage", "loginForm.jsp");
			
		} else {
			request.setAttribute("nextPage", "info.jsp?fail=pw");
			//비밀번호 불일치			
		}
		
		
	
	
	}
}
