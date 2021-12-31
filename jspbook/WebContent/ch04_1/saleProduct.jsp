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
// 한글 깨짐 방지 
request.setCharacterEncoding("UTF-8"); 
//session을 통해서 username 값을 저장 ( setAttribute("변수명", "값"); )
session.setAttribute("username", request.getParameter("username")); //session에는 username이라는 변수방이 존재한다...? 
%>

<div align="center">
<h2>상품선택</h2>
<hr />
<%= session.getAttribute("username") %>님 환영합니다. <!-- session에 저장한 값 불러오기 (변수이름) -->

<form name="form1" action="add.jsp" method="post">
	<select name="product"><!-- 값이 여러개이므로 배열을 만들어야함. 예) 어레이리스트  -->
		<option > Apple</option>
		<option > Banana</option>
		<option > Orange</option>
		<option > Mango</option>
	</select>
	<input type="submit" value="장바구니에 추가" />
</form>
<p/>
<a href="checkOut.jsp"> 결제하기 </a>

</div>
</body>
</html>