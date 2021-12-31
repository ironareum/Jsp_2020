package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BoardReWriteCon.do")
public class BoardReWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	
	protected void reqProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num =Integer.parseInt(request.getParameter("num"));
		int ref =Integer.parseInt(request.getParameter("ref"));
		int re_step =Integer.parseInt(request.getParameter("re_step"));
		int re_level =Integer.parseInt(request.getParameter("re_level"));
		
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardReWriteForm.jsp");
		dis.forward(request, response);
	}

}
