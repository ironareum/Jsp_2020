<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page Control</title>
</head>
<body>
<h2> forward, sendRedirect</h2>
<hr>
<form action="forward_action2.jsp" method="post"> 
	forward action : 
	<input type="text" name="username" />
	<input type="submit" value="Request" />
</form>
<p></p>
<form action="response_sendRedirect.jsp" method="post"> 
	response_sendRedirect : 
	<input type="text" name="username" />
	<input type="submit" value="Response" />
</form>

</body>
</html>

<%-- 
response_sendRedirect 액션태그: 처음 클라이언트에서 요청한 URL이 아닌 전혀다른 URL를 통해서 Response 된다. 

--%>