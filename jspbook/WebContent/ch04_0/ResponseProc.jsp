<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String id= request.getParameter("id"); 
String pw = request.getParameter("pw"); 
%>
	<h2>이 페이지는 LoginProc에서 ResponProc으로 넘어오는 페이지 입니다.</h2>
	당신의 아이디는 '<%= id%>' 이고 패스워드는 <%= pw %> 입니다. 
</body>
</html>