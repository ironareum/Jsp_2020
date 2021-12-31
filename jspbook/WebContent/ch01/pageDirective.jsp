<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
에러페이지 입니다. <br/>

<% 
int res=10/0;
//500 클라이언트 오류. 
// 젤 위에 에러 페이지 정보 줌: errorPage="Error2.jsp"
// 에러 발생시 위에서 지정한 새로운 jsp 파일 페이지로 넘어감.  
%>

<a href="Error2.jsp"> 이곳을 클릭하세요 (관리자 문의) </a>

<!-- isErrorPage="true" 로 -->

</body>
</html>