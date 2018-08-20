<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.ac.green.*" %>

<%! // 선언부
	private Vector<User> getList(HttpServletRequest request) {		
		
		//The application object in JSP is called the ServletContext object in a servlet
		ServletContext application = request.getSession().getServletContext();	
		/*
			ServletContext application1 = request.getSession().getServletContext();
			ServletContext application2 = getServletConfig().getServletContext();
			ServletContext application3 = getServletContext();
			ServletContext application4 = pageContext.getServletContext();
	    */
		
		Vector<User> list = (Vector<User>)application.getAttribute("list");		 
		if(list == null) {
			list = new Vector<User>();
			application.setAttribute("list", list);
		}
		return list;
	}
%>

<%
	
	if(request.getMethod().equalsIgnoreCase("post")) {
		request.setCharacterEncoding("euc_kr");
	}
	// post 일때 인코딩 설정

	String cmd = request.getParameter("cmd");
	if(cmd == null) cmd = "start";
	
	String msg = null;
	String nextPage = null;
	boolean isRedirect = false;
	if(cmd.equals("start")) {
		msg = "어서오세요";
		nextPage = "login.jsp";
	
	} else if(cmd.equals("login")) {
		nextPage = "loginSuccess.jsp";
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		
		User user = new User();
		user.setUid(uid);
		user.setUpw(upw);
		
		Vector<User> list = getList(request);
		int idx = list.indexOf(user); // Override - equals
		nextPage = "login.jsp";
		if(idx != -1) {
			User savedUser = list.get(idx);
			if(savedUser.getUpw().equals(upw)) {
				nextPage = "loginSuccess.jsp";
				msg = savedUser.getNick() + "님 반갑습니다.";
				session.setAttribute("loginUser", savedUser);
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		} else {
			msg = "가입되지 않은 사용자 입니다.";
		}
		
	} else if(cmd.equals("goJoin")) {
		msg = "모든항목은 필수입력입니다.";
		nextPage = "join.jsp";
	} else if(cmd.equals("cancelJoin")) {
		msg = "가입이 취소되었습니다.";
		nextPage = "login.jsp";
	} else if(cmd.equals("doJoin")){
		Vector<User> list = getList(request);
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String nick = request.getParameter("nick");
		User user = new User(uid, upw, nick);
		
		if(list.contains(user)) {
			msg = "이미 존재하는 아이디입니다.";
			nextPage = "join.jsp";
			request.setAttribute("user", user);
		} else {
			list.add(user);
			nextPage = "main.jsp?cmd=joinOk";
			isRedirect = true;
		}
	} else if(cmd.equals("joinOk")) {
		msg = "가입이 성공적으로 이루어 졌습니다.";
		nextPage = "login.jsp";
	} else if(cmd.equals("goModify")) {
		nextPage = "modify.jsp";
		msg = "패스워드와 닉네임 수정이 가능합니다.";
	} else if(cmd.equals("logout")) {
		nextPage = "login.jsp";
		User user = (User)session.getAttribute("loginUser");
		msg = user.getNick() + "님 안녕히 가세요.";
		session.invalidate();
	} else if(cmd.equals("goWithdraw")) {
		nextPage = "withdraw.jsp";
		msg = "이동작은 취소할 수 없습니다.";
	} else if(cmd.equals("accessDenied")) {
		msg = "유효하지 않은 접근입니다.";
		nextPage = "login.jsp";
	} else if(cmd.equals("cancelModify")) {
		nextPage = "loginSuccess.jsp";
		msg = "개인정보수정이 취소되었습니다.";
	} else if(cmd.equals("doModify")) {
		msg = "개인정보가 업데이트 되었습니다.";
		nextPage = "loginSuccess.jsp";
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String nick = request.getParameter("nick");
		
		User user = (User)session.getAttribute("loginUser");
		user.setUpw(upw);
		user.setNick(nick);
		
		Vector<User> list = getList(request);
		int idx = list.indexOf(user);
		list.set(idx, user);
	} else if(cmd.equals("cancelWithdraw")) {
		msg = "탈퇴가 철회되었습니다.";
		nextPage = "loginSuccess.jsp";
	} else if(cmd.equals("doWithdraw")) {
		nextPage = "main.jsp?cmd=afterWithdraw";
		isRedirect = false;
		User user = (User)session.getAttribute("loginUser");
		Vector<User> list = getList(request);
		list.remove(user);
		session.invalidate();
	} else if(cmd.equals("afterWithdraw")) {
		msg = "그동안 이용해주셔서 감사드립니다.";
		nextPage = "login.jsp";
	}
	
	if(isRedirect) {
		response.sendRedirect(nextPage);
	} else {
		request.setAttribute("msg", msg);
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
%>