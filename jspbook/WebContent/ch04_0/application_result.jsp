<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>application 예제 </title>
</head>
<body>
<div align="center">
	<h2>Application Log 확인하기 </h2>
	<hr />
	username에 설정된 값은 : <%= application.getAttribute("username") %> <p> <!--application은 로그아웃, 서버가 내려가기 전까지는 내용이 남아있음  -->
	<% Integer count = (Integer)application.getAttribute("count"); //형변환 
		int cnt =count.intValue()+1; //로그가 찍힐때마다 카운트 1씩 증가 //cnt=count+1;
		application.setAttribute("count", cnt); //count변수방에 cnt를 넣음 
	%>
	count : <%=	cnt %>
</div>
</body>
</html>