<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>
<!-- forward 할때 name 변수에 값 담아서 같이 넘어감  -->
<jsp:forward page="page_control_end.jsp">
	<jsp:param name="tel" value="000-000-0000"/> 
</jsp:forward>
