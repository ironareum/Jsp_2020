<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberList</title>
</head>
<body>
<center>
<h2> 전체 회원 보기 </h2>
<table width="600" border="1">
	 <c:forEach var="bean" items="${vec}">
		 <tr height="40">
		  <td width="120" align="center">${bean.id }</td>
		  <td width="120" align="center"><a href="MemberInfo.jsp?id=${bean.id }"> ${bean.email }</a></td>
		  <td width="120" align="center">${bean.phone }</td>
		  <td width="120" align="center">${bean.hobby }</td>
		  <td width="120" align="center">${bean.job }</td> 
		 </tr>
	 </c:forEach>
</table>
</center>
</body>
</html>