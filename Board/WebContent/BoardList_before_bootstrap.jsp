<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BBS List</title>
<!-- Bootstrap -->
<link rel="bootstrap-3.3.7/css/bootstrap.min.css" href="stylesheet" />
<style>
	<style>
    #container {
      width: 70%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
      text-align: center;
    }
     
    .hit {
      animation-name: blink;/*애니메이션의 이름*/
      animation-duration: 1.5s;/*애니메이션의 동작 시간('1s','0.5s'와 같은 형식으로 지정)*/
      animation-timing-function: ease; /*애니메이션의 타이밍 : 시작과 종료를 부드럽게*/
      animation-iteration-count: infinite; /* 애니메이션의 동작 회수('infinite'를 지정하면 무한 반복)*/
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite;
      }
      
      /* 애니메이션 지점 설정하기 */
      /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
</style>
</head>
<body>

<c:if test="${msg==0}">
<script type="text/javascript">
alert("수정시 비밀번호가 일치하지 않습니다.")</script>
</c:if>

<c:if test="${msg==1}">
<script type="text/javascript">
alert("삭제시 비밀번호가 일치하지 않습니다.")</script>
</c:if>

<center>
<H2>전체 게시글 보기</H2>

		<table width="700" border="1" bordercolor="skyblue">
			<tr height="40">
				<td colspan="5" align="right">
					<button onclick="location.href='BoardWriteForm.jsp'">글쓰기</button>
				</td>
			</tr>
			<tr height="40">
				<td width="50" align="center">번호</td>
				<td width="320" align="center">제목</td>
				<td width="100" align="center">작성자</td>
				<td width="150" align="center">작성일</td>
				<td width="80" align="center">조회수</td>
			</tr>
			<c:set var="number" value="${number}" />
			<!-- Vector에 있는 모든 리스트 가져오기 -->
			<c:forEach var="bean" items="${v}">
			
			<tr height="40">
			<td width="50" align="left">${number }</td>
			<td width="320" align="left">
			<!-- 댓글중 처음글은 들여쓰기를 할필요가 없으므로 re_step 2부터 적용하기 위한 코드 -->
			  <c:if test="${bean.re_step >1 }">	
			  <c:forEach var="j" begin="1" end="${ (bean.re_step-1)*5}">
			  &nbsp;
			  </c:forEach>
			  </c:if>
			  <!-- 세부검색시 링크될 페이지 -->
			  <a href="BoardInfoControl.do?num=${bean.num }" style='text-decoration: none'>
			  ${bean.subject }</a></td>
			<td>${bean.writer }</td>
			<td>${bean.reg_date }</td>
			<td>${bean.readcount }</td>
			</tr>
			<!-- 글카운터 최신글로 인해서 하나씩 감소 -->
			<c:set var="number" value="${number-1 }"/>
			</c:forEach>
			</table>
			
<!--  ---------------------------------------------------------------- -->
     <p>
     <!--  페이지 카운터링 소스 구현 -->
     <!-- 1. 전체페이지 수  -->
     <c:if test="${count>0 }">
     <!--  전체글이 10일 경우 10/10=1
            전체글이   34 34/10=3+1  -->
         <c:set var="pageCount" value="${count/pageSize+(count%pageSize==0?0:1) }"/>
         
         <!-- 2.시작 페이지 숫자를 지정 -->
         <c:set var="startPage" value="${1 }"/>
         
         <!-- 3. 현재 페이지 숫자표시를 지정 -->
         <c:if test="${currentPage%10 != 0 }">
         <!--  전체페이지가 1 ~ 9개인경우 또는 11 12 22 32... -->
         <!-- IntegerOnly ="true" :정수부분만 파생 -->
         <!--  예)첫번째 글번호 그룹 1...10=1/10=0.1 ==> 0+1=1 
                                 두번째 글번호 그룹 11,12..19 19/10=>1.9 1+1=2 --> 
         <fmt:parseNumber var="result" value="${currentPage/10 }" integerOnly="true"/>
         <c:set var="startPage" value="${ result*10+1}"/>
         </c:if>
         
         <!-- 10 20 30페이지 -->
          <c:if test="${currentPage%10 ==0 }">
          <c:set var="startPage" value="${ (result-1)*10+1}"/>
          </c:if>
          
          <!-- 끝 페이지 처리 숫자를 표현 -->
          <c:set var="pageBlock" value="${10 }"/>
          <!--  1+10-1=10
                11+10-1=20 -->
          <c:set var="endPage" value="${startPage+pageBlock-1 }"/>
          
          
          <c:if test="${endPage>pageCount }">
          <c:set var="endPage" value="${pageCount }"/>
          </c:if>
          
          <!-- 이전 링크를 파악 -->
          <c:if test="${startPage>10 }">
          <a href="BoardListCon.do?pageNum=${ startPage-10}" style="text-decoration: none" >[이전]</a>
          </c:if>
          
          <!-- 페이징 처리 -->
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <a href="BoardListCon.do?pageNum=${ i}" style="text-decoration: none" >[${i}]</a>
          </c:forEach>
          
            <!-- 다음 링크를 파악 -->
          <c:if test="${endpage<pageCount }">
          <a href="BoardListCon.do?pageNum=${ startPage+10}" style="text-decoration: none" >[다음]</a>
          </c:if>
          </c:if>
          
</center>
</body>
</html>