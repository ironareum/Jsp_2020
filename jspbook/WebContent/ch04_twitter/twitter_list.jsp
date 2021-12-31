<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
//한글깨짐 방지 
request.setCharacterEncoding("UTF-8"); 
//user id 받아오기
//1) API사용해서 request로 받기 
String username = request.getParameter("username");
//2) session으로 셋팅해서 담아서 써도 됨.
if(username!=null){
	session.setAttribute("user", request.getParameter("username"));
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Twitter List</title>
</head>
<body>
<div align="center">
			<h3>MY Simple Twitter</h3>
			<hr />
			<form action="tweet.jsp" method="post">
				<%= session.getAttribute("username") %> 님 : <!--id는 세션으로 받아오는게 원칙. 메세지는 어플리케이션으로 가져오는게 원칙   -->
				<input type="text" name="msg" /> 
				<input type="submit" value="Tweet" />
			</form>
	</div>
<div align="left">
<ul>
<%
//application.getAttribute : application 내장객체를 통해 ArrayList에 msgs라는 이름으로 객체생성하여 게시글 가져옴
//application : 어플리케이션은 서버 자체가 종료되기 전까지 유지 
ArrayList<String> msgs = (ArrayList<String>) application.getAttribute("msgs");
if(msgs!=null){
	for(String msg: msgs){
		out.println("<li>"+ msg+ "</li>");
	}
}
%>

</ul>

</div>

<%  %>
</body>
</html>