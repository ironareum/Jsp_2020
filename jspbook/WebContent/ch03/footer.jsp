<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Footer</title>
</head>
<body>
footer.jsp 에서 출력하는 메세지 입니다. 
<hr>
<%= request.getParameter("email") %> <br>
<%= request.getParameter("tel") %> <br>
<p>
<% System.out.println(request.getParameter("email")); %>
</body>
</html>