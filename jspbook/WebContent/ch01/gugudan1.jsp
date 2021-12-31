<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gugudan</title>
</head>
<body>
	<!-- console에 출력  -->
	<%
	//이게 서블릿...? 

	for (int i = 2; i <= 9; i++) {
		for (int j = 1; j <= 9; j++) {
			System.out.println(i + "*" + j + "=" + (i * j));
		}
		System.out.println();
	}
	%>
	<!-- 웹 화면에 출력  -->
	<%
	//이게 서블릿...? 
	for (int i = 2; i <= 9; i++) {
		for (int j = 1; j <= 9; j++) {
	%>
	<%=i%>
	*
	<%=j%>
	=
	<%=i * j%>
	&nbsp; &nbsp;
	<%
	}
	%>
	</br>
	<%
	}
	%>

	<!--  선생님 코드 :홀수 짝수  -->
	<table border="1" width="1000px">
		<%
		for (int j = 1; j < 10; j++) {
			int i = 8;
			int m = 1;
		%>
		<tr>
			<%
			for (int s = 1; s < 10; s++) {
			%>
			<td><%=m%> * <%=j%> = <%=m * j%></td>
			<%
			if (s % 2 != 0) {
				m = m + i;
				i--;
			} else {
				m = m - i;
				i--;
			}
			}
			}
			%>
		</tr>
		<%
%>
	</table>


	<!--  내 코드 -->
	<table border="1" width="1000px">
		<%
		for (int j = 1; j <= 9; j++) {
		%>
		<tr>
			<%
			for (int i = 1; i <= 9; i++) {
			%>
			<td><%=i%> * <%=j%> = <%=i * j%></td>
			<%
			}
			%>
		</tr>
		<%
		}
		%>
	</table>

	<!-- 동훤님 코드  -->
	<table border="1" width="1000px">
		<th style="background-color: yellow; font-size: 26px;" colspan="9">Multiple</th>

		<%
		int t = 1;
		for (int x = 1; x < 10; x++) {
		%>
		<tr>
			<%
			for (int y = 1; y < 6; y++) {
			%>
			<td width="100" align="center" style="background-color: lightblue;">
				<%=y%>* <%=x%>= <%=x * y%>
			</td>

			<%
			t = 10 - y;
			if (t != y) {
			%>
			<td width="100" align="center" style="background-color: lightpink;">
				<%=t%>* <%=x%>= <%=x * t%>

			</td>
			<%
			}
			}
			%>
		</tr>
		<%
		}
		%>
	</table>


	<!-- <table border="1" width="1000px" >
<th >Multiple</th>

	int t=1;
	for(int x=1; x<10; x++){ //1~9
	<tr> 
		for(int y=1;y<6;y++){ //1~5
			<td > y * x =x * y </td>
				t=10-y;
				if(t!=y){
			<td > t *x = x*t</td>
			}
		}
	</tr>
	}
</table> -->


</body>
</html>