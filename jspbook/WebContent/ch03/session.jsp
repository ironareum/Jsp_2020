<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>session </title>
</head>
<body>
<div align="center">
	<h2> Session 활용 </h2>
	<hr />
	<% 
		if(session.isNew()){
		out.println("<script> alert('세션이 해제되어 다시 설정합니다.')</script>");
		session.setAttribute("login", "홍길동"); //홍길동 대신 id값 변수방 넣어서 만들수 있음 (추후)
	}
	%>
	# <%= session.getAttribute("login") %> 님 환영합니다. <br>
	1. 세션 ID: <%= session.getId() %> <br>
	<% session.setMaxInactiveInterval(5); %> <!-- session의 유지시간 설정. 초단위   -->
	2. 세션 최대 유지시간 : <%= session.getMaxInactiveInterval() %>
	
</div>
</body>
</html>