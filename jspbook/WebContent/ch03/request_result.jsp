<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<!-- 위의 코드. 한글꺠짐 방지  -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request_result</title>
</head>
<body>
	<div align="center">
		<h2>request Result</h2>
		<hr>
		<table width="400" cellpadding="10" cellspacing="10" border="1">
			<tr>
				<td width="50"> 이름 </td>
				<td width="100"> <%= request.getParameter("username") %></td> <!-- username에 있는 값이 들어옴  -->
			</tr>
			<tr>
				<td width="50"> 직업 </td>
				<td width="100"> <%= request.getParameter("job") %></td>
			</tr>
			<tr>
				<td width="50"> 관심분야 </td> 
				<td width="100"> <!-- 체크박스는 여러개의 값을 가지고 올수 있어야함 == 배열방에 담아야함  -->
					<% String[] favorites = request.getParameterValues("favorite"); %>
					<% for(String s :favorites){ 
						out.println(s + "<br>"); //System.out.println : 콘솔에 표시. System 없이 치면 화면에 뜸 
					} %>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>