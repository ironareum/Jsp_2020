<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>forward action</title>
</head>
<body>
	<div align="center">
		<h2>forward_action 및 send_Redirect</h2>
		<hr />
		지금 보시는 화면은 forward_action_end.jsp에서 출력되는 결과입니다.
		<hr />
		이름: <%= request.getParameter("username") %>
		
		전화번호 :
		<%= request.getParameter("tel") %>
	</div>
</body>
</html>