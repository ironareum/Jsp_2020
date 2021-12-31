<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
//한글로 넘어온 데이터 post방식 깨짐방지
request.setCharacterEncoding("UTF-8");
//파라미터명(name)을 통해서 가져옴  
String id= request.getParameter("id"); 
String pw = request.getParameter("pw"); 

%>

당신의 아이디는 '<%= id%>' 이고 패스워드는 <%= pw %> 입니다. 
</body>
</html>