<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Out 내장객체</title>
</head>
<body>
	<div align="center">
		<h2>out 내장객체의 활용 </h2>
		<hr />
		1. 설정된 버퍼크기 : <%= out.getBufferSize() %> <br>
		2. 남아있는 버퍼크기 : <%= out.getRemaining() %> <br>
		
		<%out.println("버퍼클리어중... (로딩중...으로도 쓰임)"); %> <br>
		 <% out.flush(); %> <br> <!-- 버퍼 비우기 -->
		
		3. 남아있는 버퍼크기 : <%= out.getRemaining() %> <br>
		
		<% out.clear(); %> <!-- 버퍼 싹 다 비우기. 안보임...?  -->
		4. clear 후 남아있는 버퍼크기 : <%= out.getRemaining() %> 
		
		<% out.close(); %>
		5. close 후 남아있는 버퍼크기 : <%= out.getRemaining() %>
	</div>
</body>
</html>