package kr.ac.green;

import java.util.Hashtable;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class loginCmd implements ICmd{

	@Override
	public void todo(HttpServletRequest request) {
	
		String id = request.getParameter("u_id");
		String pw = request.getParameter("u_pw");
		
		// 임시 데이터 베이스 
		HttpSession session = request.getSession();
		ServletContext application = session.getServletContext();
		Hashtable<String, User> userList = (Hashtable<String, User>)application.getAttribute("userData");
		if(userList == null){
			userList = new Hashtable<String, User>();
			application.setAttribute("userData", userList);
		}
		
		if(userList.containsKey(id)){
			if(userList.get(id).getPw().equals(pw)){
				//로그인 성공
				session.setAttribute("id", id);
				request.setAttribute("nextPage", "loginSuccess.jsp");				
			
			} else {
				// 비밀번호 틀림
				request.setAttribute("nextPage", "loginForm.jsp?fail=pw&id=" + id);
			}
			
		} else {
			// 아이디가 없음
			request.setAttribute("nextPage", "loginForm.jsp?fail=id");
		}	
		//				
	}	
}
