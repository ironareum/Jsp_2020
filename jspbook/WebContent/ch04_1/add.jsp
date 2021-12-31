<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); 
//saleProduct.jsp에서 선택된 상품 이름을 가져옴 
String productname = request.getParameter("product"); 

//세션으로부터 productlist라는 이름의 ArrayList객체를 끌어옴 
//Object이므로 ArrayList로 다운캐스팅 
ArrayList<String> list =(ArrayList)session.getAttribute("productList"); //getAttr할때 변수방을 만들어줄수도 있음. 대신 null로 바뀜. 왜냐 가져올 변수방이 없으니까   

if(list==null){ //초기값 생성 
	list =new ArrayList<String>();
	session.setAttribute("productList", list);
}
list.add(productname);
%>

<script>
	alert("<%= productname %>이(가) 추가되었습니다.");
	history.go(-1); /* 이전단계로 넘어감. saleProduct.jsp 페이지로 돌아감 */
</script>

</body>
</html>

<%-- 
history.go(-1); 바로 이전문서로 되돌아감(=history.back()
history.go(0) : 현재페이지가 다시 로드됨
history.go(-2) : 전전 단계. 2단계 전 문서로 돌아감 
--%>
