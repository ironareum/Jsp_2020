<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Count</title>
</head>
<body>
<h2> 1-10까지의 숫자를 입력하세요 </h2>
<%
//실행부(=구현부)  
//여기서 부터는 자바세상 
for(int i=0; i<10; i++){
	//System.out.println();

%>

<%= i %>
<% 
} // for문 끝 
// <%= : println 과 동일. 웹 화면에 뿌려줌. 
// <% : 실행부에서 하면 콘솔에 뿌려줌. 
%> 


</body>
</html>