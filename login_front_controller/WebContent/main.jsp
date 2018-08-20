<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.ac.green.*" %>

<%! // �����
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
	// post �϶� ���ڵ� ����

	String cmd = request.getParameter("cmd");
	if(cmd == null) cmd = "start";
	
	String msg = null;
	String nextPage = null;
	boolean isRedirect = false;
	if(cmd.equals("start")) {
		msg = "�������";
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
				msg = savedUser.getNick() + "�� �ݰ����ϴ�.";
				session.setAttribute("loginUser", savedUser);
			} else {
				msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
			}
		} else {
			msg = "���Ե��� ���� ����� �Դϴ�.";
		}
		
	} else if(cmd.equals("goJoin")) {
		msg = "����׸��� �ʼ��Է��Դϴ�.";
		nextPage = "join.jsp";
	} else if(cmd.equals("cancelJoin")) {
		msg = "������ ��ҵǾ����ϴ�.";
		nextPage = "login.jsp";
	} else if(cmd.equals("doJoin")){
		Vector<User> list = getList(request);
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String nick = request.getParameter("nick");
		User user = new User(uid, upw, nick);
		
		if(list.contains(user)) {
			msg = "�̹� �����ϴ� ���̵��Դϴ�.";
			nextPage = "join.jsp";
			request.setAttribute("user", user);
		} else {
			list.add(user);
			nextPage = "main.jsp?cmd=joinOk";
			isRedirect = true;
		}
	} else if(cmd.equals("joinOk")) {
		msg = "������ ���������� �̷�� �����ϴ�.";
		nextPage = "login.jsp";
	} else if(cmd.equals("goModify")) {
		nextPage = "modify.jsp";
		msg = "�н������ �г��� ������ �����մϴ�.";
	} else if(cmd.equals("logout")) {
		nextPage = "login.jsp";
		User user = (User)session.getAttribute("loginUser");
		msg = user.getNick() + "�� �ȳ��� ������.";
		session.invalidate();
	} else if(cmd.equals("goWithdraw")) {
		nextPage = "withdraw.jsp";
		msg = "�̵����� ����� �� �����ϴ�.";
	} else if(cmd.equals("accessDenied")) {
		msg = "��ȿ���� ���� �����Դϴ�.";
		nextPage = "login.jsp";
	} else if(cmd.equals("cancelModify")) {
		nextPage = "loginSuccess.jsp";
		msg = "�������������� ��ҵǾ����ϴ�.";
	} else if(cmd.equals("doModify")) {
		msg = "���������� ������Ʈ �Ǿ����ϴ�.";
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
		msg = "Ż�� öȸ�Ǿ����ϴ�.";
		nextPage = "loginSuccess.jsp";
	} else if(cmd.equals("doWithdraw")) {
		nextPage = "main.jsp?cmd=afterWithdraw";
		isRedirect = false;
		User user = (User)session.getAttribute("loginUser");
		Vector<User> list = getList(request);
		list.remove(user);
		session.invalidate();
	} else if(cmd.equals("afterWithdraw")) {
		msg = "�׵��� �̿����ּż� ����帳�ϴ�.";
		nextPage = "login.jsp";
	}
	
	if(isRedirect) {
		response.sendRedirect(nextPage);
	} else {
		request.setAttribute("msg", msg);
		request.getRequestDispatcher(nextPage).forward(request, response);
		
	}
%>