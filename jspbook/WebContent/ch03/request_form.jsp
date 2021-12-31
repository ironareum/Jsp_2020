<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request Form</title>
</head>
<body>
	<div align="center">
		<h2> request Form</h2>
		<hr>
		<form action="request_result.jsp" method="post" name="form1">
		<table width="400" cellpadding="10" cellspacing="10" border="1">
			<tr bgcolor="lightpink">
				<td>이름</td>			
				<td>
					<input type="text" width="10" name="username">
				</td>			
			</tr>
			<tr bgcolor="lightpink">
				<td>직업</td>			
				<td>
					<select name="job">
						<option selected>무직</option>
						<option>학생</option>
						<option>개발자</option>
					</select>
				</td>			
			</tr>
			<tr bgcolor="lightpink" >
				<td>관심분야</td>			
				<td>
					<input type="checkbox" name="favorite" value="스포츠"> 스포츠 
					<input type="checkbox" name="favorite" value="IT"> IT 
					<input type="checkbox" name="favorite" value="사회"> 사회 
					
				</td>			
			</tr>
			<tr bgcolor="lightpink" align="center">
				<td colspan="2">
					<input type="submit" value="확인">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>