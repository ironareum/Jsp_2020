<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
<% 
//한글로 넘어온 데이터 post방식 깨짐방지
request.setCharacterEncoding("UTF-8");
//파라미터명(name)을 통해서 가져옴  
String id= request.getParameter("id"); 
String pw = request.getParameter("pw"); 

//response.sendRedirect("ResponseProc.jsp");
%>
 --%>
<!-- sendRedirect로 페이지를 아예 전환하면 그 아래의 코드는 읽을수 없다. 또한 id값을 가져가지 않음  -->

<jsp:forward page ="ResponseProc.jsp" >
	<jsp:param value="Guest" name="id"/>
	<jsp:param value="1111" name="pw"/>
</jsp:forward>
<!-- value값을 바꿔줌  -->

<%-- 
당신의 아이디는 '<%= id%>' 이고 패스워드는 <%= pw %> 입니다. 
--%>
</body>
</html>