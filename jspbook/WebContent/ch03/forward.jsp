<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>forward.jsp 에서 footer.jsp를 호출</h2>
	<hr>
	forward.jsp의 모든 내용은 출력되지 않습니다.
	2021.01.21 : 목요일(코로나 346명)
	
	<%-- <%! %> 는 선언부  --%>
	<%! int a=10; %>
	<p>
	
	<jsp:forward page="footer.jsp">
		<jsp:param name="email" value="test@test.com"/> 
		<jsp:param name="tel" value="000-0000-0000"/>
	</jsp:forward><br>
	<p> * 여기서 부터는 화면에 찍히지 않음. 왜냐면 forward로 페이지가 넘어갔기때문에 *  </p>
	<h2>감사합니다. </h2>
	
	<%= a %>
</body>
</html>

<%--
<jsp:forward> 액션태그 : 페이지가 넘어가서 되돌아오지 않음(URL 변경)
	--%>