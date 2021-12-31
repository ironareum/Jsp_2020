<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardUpdateForm.jsp</title>
<!-- Bootstrap -->
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./mycss.css" />

</head>
<body>

<div id="container">
	<div id="list">
      <b>게시글 수정하기</b>
    </div>

<p></p>
	<form action="BoardUpdateProcCon.do" method="post">
		 <table class="table table-striped table-bordered table-hover">
			<thead>
			
			<tr height="40">
				<th width="150" align="center">작성자</td>
				<td width="150" align="center">${bean.writer}</td>
				<th width="150" align="center">작성일</td>
				<td width="150" align="center">${bean.reg_date}</td>
			</tr>
			<tr height="40">
				<th width="150" align="center">제목</td>
				<td colspan="3" width="450" >&nbsp;<input type="text" name="subject" value="${bean.subject }" size="60" style="border: none; background: transparent"/></td> 
			</tr>
			<tr height="40">
				<th width="150" align="center">패스워드</td>
				<td colspan="3" width="450" >&nbsp;<input type="password" name="password" size="60" style="border: none; background: transparent"/></td>
			</tr>
			<tr height="40">
				<th width="150" align="center">글 내용</td>
				<td colspan="3" width="450" >&nbsp;<textarea rows="10" cols="60" name="contents" align="left">${bean.contents }</textarea></td> 
			</tr>
			<tr height="40">
				<td colspan="4" align="center">
					<input type="hidden" name="pass" value="${bean.password}" />
					<input type="hidden" name="num" value="${bean.num  }" />
					<input type="submit" value="수정하기">&nbsp;&nbsp;
				    <input type="reset" value="취소">&nbsp;&nbsp;
				    <input type="button" onclick="location.href='BoardListCon.do'" value="전체글보기">
				</td>
			</tr>
			</thead>
		</table>
	</form>
</div>
</body>
</html>