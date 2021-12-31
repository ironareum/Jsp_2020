<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardInfo</title>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./mycss.css" />
</head>
<body>

<div id="container">

<div id="list">
      <b>게시글 보기</b>
      <p></p>
</div>

<table class="table table-striped table-bordered table-hover table-header">
<thead>
	<tr height="40">
		<th width="120" align="center"> 글번호 </td>
		<td width="180" align="left"> ${bean.num} </td>
		<th width="120" align="center"> 조회수 </td>
		<td width="180" align="left"> ${bean.readcount} </td>
	</tr><tr>
		<th width="120" align="center"> 작성자 </td>
		<td width="180" align="left"> ${bean.writer} </td>
		<th width="120" align="center"> 작성일 </td>
		<td width="180" align="left"> ${bean.reg_date} </td>
	</tr>
	<tr>
		<th width="120" align="center"> 이메일 </td>
		<td colspan="3" width="180" align="left"> ${bean.email} </td>
	</tr>
	<tr>
		<th width="120" align="center"> 제목 </td>
		<td colspan="3" width="180" align="left"> ${bean.subject} </td>
	</tr>
	<tr>
		<th width="120" align="center"> 글내용 </td>
		<td colspan="3" width="180" align="left"> ${bean.contents} </td>
	</tr>
	<tr height="40">
		<td colspan="4" align="center">  
			<input type="button" value="답글달기" onclick="location.href='BoardReWriteCon.do?num=${bean.num}&ref=${bean.ref}&re_step=${bean.re_step}&re_level=${bean.re_level}'"/>
			&nbsp;&nbsp;
			<input type="button" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${bean.num}'"/>
			&nbsp;&nbsp;
			<input type="button" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${bean.num}'"/>
			&nbsp;&nbsp;
			<input type="button" value="전체 글보기" onclick="location.href='BoardListCon.do'"/>
			
		</td>
	</tr>
</thead>
</table>
</div>
</body>
</html>