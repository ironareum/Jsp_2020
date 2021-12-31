<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session </title>
</head>
<body>
	<% String id= request.getParameter("id"); 
	//어느 페이지에서도 데이터를 공유할 수 있는 객체 = session
	session.setAttribute("id", id);
	//세션 유지시간 
	session.setMaxInactiveInterval(5);
	
	%>
	
	<h2>당신의 아이디는 <%= id %> 입니다. </h2>
	
	<<a href="SessionShopingMall.jsp"> 쇼핑몰 바로가기 </a>
	
</body>
</html>