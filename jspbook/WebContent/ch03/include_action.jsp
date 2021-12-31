<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>include Action</title>
</head>
<body>
<h2>include_action.jsp 에서 footer.jsp를 호출</h2>
<h2>include_action.jsp 에서 출력한 메세지 입니다. </h2>

<!-- action은 값을 담아서 넘어감. -->
	<!-- name이라는 변수방에 value값 담아서 넘어감  -->
<jsp:include page="footer.jsp">
	<jsp:param name="email" value="test@test.com"/> 
	<jsp:param name="tel" value="000-0000-0000"/> 
</jsp:include><br>

<h2>include_action.jsp 로 되돌아옴  </h2>

</body>
</html>

<%-- 
@ include:  원래페이지 안으로 include 지시어로 지정한 페이지를 복사하는 원리(URL 변동 없음)
<jsp:include> 액션태그 : 소스코드가 복사되어 들어오는 것이 아니라 제어권 자체가 include 액션으로 지정된 페이지로 넘어갔다가 다시 원래 페이지로 돌아옴 --%>