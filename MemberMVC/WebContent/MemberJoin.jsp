
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<center>
		<h2>회원 가입</h2>
		<form action="proc1.do" method="post">
			<table width="400" border="1">
				<tr height="40">
					<td width="200" align="center">아이디</td>
					<td width="400" align="center">
					<input type="text" name="id"size="40" placeholder="id를 입력하세요." />
						</td>
				</tr>
				<tr height="40">
					<td width="200" align="center">패스워드</td>
					<td width="400" align="center">
					<input type="password" name="pass1" size="40" placeholder="password를 입력하세요." /></td>
				</tr>
				<tr height="40">
					<td width="200" align="center">패스워드확인</td>
					<td width="400" align="center"><input type="password" name="pass2" size="40" placeholder="password를 입력하세요." /></td>
				</tr>
				<tr height="40">
					<td width="200" align="center">이메일</td>
					<td width="400" align="center"><input type="email"
						name="email" size="40" /></td>
				</tr>
				<tr height="40">
					<td width="200" align="center">성별</td>
					<td width="400" align="center"><input type="radio"
						name="gender" value="남" /> 남 &nbsp;&nbsp; <input type="radio"
						name="gender" value="여" /> 여</td>
				</tr>
				<tr height="40">
					<td width="200" align="center">주소</td>
					<td width="400" align="center"><input type="text"
						name="address" size="40" /></td>
				</tr>
				<tr height="40">
					<td width="200" align="center">전화번호</td>
					<td width="400" align="center"><input type="phone"
						name="phone" size="40" /></td>
				</tr>
				<tr height="40">
					<td width="200" align="center">취미</td>
					<td width="400" align="center"><input type="checkbox"
						name="hobby" value="여행" />여행 &nbsp;&nbsp; <input type="checkbox"
						name="hobby" value="영화보기" /> 영화보기 &nbsp;&nbsp; <input
						type="checkbox" name="hobby" value="등산" />등산 &nbsp;&nbsp; <input
						type="checkbox" name="hobby" value="음악" />음악 &nbsp;&nbsp;</td>
				</tr>
				<tr height="40">
					<td width="200" align="center">직업</td>
					<td width="400" align="center"><select width="200" name="job">
							<option value="교사">교사</option>
							<option value="유튜버">유튜버</option>
							<option value="기술사">기술사</option>
							<option value="의사">의사</option>
					</select></td>
				</tr>

				<tr height="40">
					<td width="200" align="center">나이</td>
					<td width="400" align="center"><input type="radio" name="age"
						value="~10" /> ~10 &nbsp;&nbsp; <input type="radio" name="age"
						value="~20" /> ~20 &nbsp;&nbsp; <input type="radio" name="age"
						value="~30" /> ~30 &nbsp;&nbsp; <input type="radio" name="age"
						value="~40" /> ~40 &nbsp;&nbsp;</td>
				</tr>
				<tr height="40">
					<td width="200" align="center">하고 싶은 말</td>
					<td width="400" align="left"><textarea name="info" cols="40"
							rows="5"></textarea></td>
				</tr>
				<tr height="40">
					<td align="center" colspan="2"><input type="submit"
						value="회원가입"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>