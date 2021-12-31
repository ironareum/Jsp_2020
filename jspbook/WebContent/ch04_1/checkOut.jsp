<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CheckOut</title>
</head>
<body>
<div align="center">
	<h2>선택한 상품 목록과 계산</h2>
	선택한 상품 목록 
	<hr />
	<% 
	//선택된 상품이 없을경우 add.jsp를 호출하지 못한상태이므로 ArrayList객체를 생성하여 안내 멘트를 준다
	ArrayList list = (ArrayList)session.getAttribute("productList");
	//예외처리 
	if(list==null){
		out.println("선택한 상품이 없습니다.");
	}else {
		for(Object productname :list){ //String으로 담아도 됨 
			out.println( productname +"<br>");
		}
	}
	%>
	
</div>
</body>
</html>