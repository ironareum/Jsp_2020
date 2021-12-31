<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>include</title>
</head>
<body>
	<div align="center">
	<hr>
	<!-- include:  원래페이지 안으로 include 지시어로 지정한 페이지를 복사하는 원리(URL 변동 없음) -->
	<%@ include file="menu.jsp" %>
	<p>
	<!-- cellpadding: 셀 내부의 글자와 셀 사이의 간격. cellspacing: 셀(=칸)과 셀 사이의 간격  -->
	<table border=0 cellpadding="15" cellspacing="15"> 
		<tr>
			<td><font size="-1"><%@ include file="news.jsp" %></font></td>
			<td width="20"> &nbsp;</td>
			<td><%@ include file="shopping.jsp" %></td>
		</tr>
	</table>
	</div>
</body>
</html>