<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<form name=form1 method=post> 
	<input type="text" name="num1" width="200" size="5" />
	<select name="operator"> 
		<option selected> + </option>
		<option> - </option>
		<option> * </option>
		<option> / </option>
		<option> % </option>
	</select>
	
	<input type="text" name="num2" width="200" size="5" />
	<input type="submit" value="계산" name="B1">
	<input type="reset" value="다시입력" name="B2">
</form>

<% 
int result=0;
if(request.getMethod().equals("POST")){ //"operator"
	//연산자를 가져옴 
	String op= request.getParameter("operator");
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	if(op.equals("+")){
		result = num1 + num2;
	}
	else if(op.equals("-")){
		result = num1 - num2;
	}
	else if(op.equals("*")){
		result = num1 * num2;
	}
	else if(op.equals("/")){
		result = num1 / num2;
	}
	else if(op.equals("%")){
		result = num1 % num2;
	}
}

%>

<br>
연산 결과 : <%= result %>
</div>

</body>
</html>