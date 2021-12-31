<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error</title>
</head>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<body>

<div align=center>
	<H2> ch14:error.jsp[web.xml 지정]</H2>
	<hr>
	<table>
		<tr width=100% bgcolor="pink">
			<td>
				관리자에게 문의해 주세요.. <br>
				빠른시일내 복구 하겠습니다.  
			</td>
		</tr>
		<tr>
			<td>
			<!-- 원래는 아래 자바코드 쓸려면 <% %> 이 표시 해줘야하는데 이제 안하고 ${} 이 표시로 자바코드 대체함.  -->
			${now}<p>
			요청실패 URI : ${pageContext.errorData.requestURI }<br>
			상태코드 : ${pageContext.errorData.statusCode } <br>
			예외유형 : ${pageContext.errorData.throwable } <br>
			</td>
		</tr>
	</table>
</div>

</body>
</html>