<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardReWriteForm.jsp</title>
</head>
<body>
<center>
<form action="BoardReWriteProcCon.do" method="post">
  		
    <table width="600" border="1" bordercolor="gray" bgcolor="ivory">
    <tr height="40">
     <td width="200" align="center">작성자</td>
     <td width="400"><input type="text" name="writer" size="30" style="border: none; background: transparent"></td>
    </tr>
     <tr height="40">
     <td width="200" align="center">제목</td>
     <td width="400"><input type="text" name="subject" size="60"
      value="[답변]" style="border: none; background: transparent"></td>
    </tr>
    <tr height="40">
     <td width="200" align="center">이메일</td>
     <td width="400"><input type="email" name="email" size="60" style="border: none; background: transparent"></td>
    </tr>
    <tr height="40">
     <td width="200" align="center" >패스워드</td>
     <td width="400"><input type="password" name="password" size="60" style="border: none; background: transparent"></td>
    </tr>
    <tr height="40">
     <td width="200" align="center">글내용</td>
     <td width="400"><textarea rows="10" cols="50" name="contents" style="border: none; background: transparent"></textarea>
     </td>
    </tr>
    <tr height="40">
     <td colspan="2" align="center">
     <input type="hidden" value="${ref }" name="ref">
     <input type="hidden" value="${re_step }" name="re_step">
     <input type="hidden" value="${re_level }" name="re_level">
     <input type="submit" value="답글작성"> &nbsp;&nbsp;
     <input type="reset" value="취소"> &nbsp;&nbsp;
     <input type="button" value="전체글보기" onclick="location.href='BoardList.jsp'"></td>
    </tr>   
     </table>
   </form>
</center>
</body>
</html>