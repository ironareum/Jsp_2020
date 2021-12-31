<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<center>
	<form action="LoginProc.jsp" method="post">
		<table border="1" width="400">
			<tr align="center" height="40">
				<td width="150">아이디</td>
				<td width="250"><input type="text" name="id"></td>
			</tr>
			<tr align="center" height="40">
				<td width="150">패스워드</td>
				<td width="250"><input type="text" name="pw"></td>
			</tr>
			<tr align=center bgcolor="yellow" height="40">
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>

		</table>
	</form>
	</center>


</body>
</html>