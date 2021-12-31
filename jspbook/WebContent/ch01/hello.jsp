<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date"  %> 
<%-- page: JSP지시어. 정보 알려줌 
Directives(3가지):  include, page, taglib --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>HELLO</title>
</head>
<body>
	<div align="center">
		<h2>HELLO WORLD</h2>
		<hr>
		현재 날짜와 시간 
		<p/>
		
		<%= new Date() %> <!--  println같은 명령어에 담기  -->
		
	</div>
</body>
</html>