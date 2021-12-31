<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>application</title>
</head>
<body>
<div align="center">
	<h2>Application 기본 정보 속성 활용 </h2>
	<hr />
	1. 서버정보 : <%= application.getServerInfo() %> <br>
	2. 서블릿 API(request, response 등) 버전정보: <%= application.getMajorVersion()+ "."+application.getMinorVersion() %> <br>
	3. application.jsp 파일의 실제경로 : <%= application.getRealPath("application.jsp") %>
	<hr />
	
	setAttribute로 username 변수에 "홍길동" 설정 <p>
	<% application.setAttribute("username", "홍길동"); // username 변수방에, 값 홍길동 세팅. 
	application.log("username=홍길동"); //콘솔 출력 
	application.setAttribute("count",0); //로그기록 출력 //count에 초기값을 0으로 셋팅 (예(자바):int count=0) . setAttribute는 기본적으로 타입이 OPbject 
	%> 
	
	<a href="application_result.jsp">확인하기 </a> <!--이 버튼을 누르면 로그기록카운트 올라감.   -->
	<!-- application: 버퍼에 계속 남아있음 / session: 일정기간동안 남아있음  -->
</div>
</body>
</html>