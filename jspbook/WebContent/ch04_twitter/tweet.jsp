<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
request.setCharacterEncoding("UTF-8");

//HTML 폼에서 전달된 msg값을 가지고 옴
String msg = request.getParameter("msg");

//세션에 저장된 로그인 사용자 이름을 가지고 옴
Object username_ = session.getAttribute("user");

ArrayList<String> msgs = (ArrayList<String>) application.getAttribute("msgs");

// 받아온 메세지가 없으면 
if(msgs==null){
	msgs= new ArrayList<String>();
	//application에 저장 
	application.setAttribute("msgs", msgs);
}

Date date = new Date();
SimpleDateFormat f = new SimpleDateFormat("MM/dd/ (HH:mm)", Locale.KOREA); //형식을 만듬 

//msgs에 사용자 메시지를 추가 
msgs.add(username_+" : "+msg +"-> "+f.format(date));

//콘솔에 확인 
application.log(msg+ "<- 메세지 추가됨");

//목록 화면으로 리다이렉팅
response.sendRedirect("twitter_list.jsp"); //application에 값을 넣어뒀기때문에 리다이렉트 해도 값이 계속 유지되어 있음 

%>