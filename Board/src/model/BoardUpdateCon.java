package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BoardUpdateCon.do")
public class BoardUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//num 값 
		int num =Integer.parseInt(request.getParameter("num"));
		
		//BeanDAO 객체 getoneUpdateBoard(num)메소드 호출 
		BoardDAO bdao = new BoardDAO();
		BoardBean bean=bdao.getoneUpdateBoard(num); //조회수 증가없이 데이터 추출 
		
		request.setAttribute("bean", bean); //bean객체 넘겨줌 
		RequestDispatcher dis = request.getRequestDispatcher("BoardUpdateForm.jsp");
		dis.forward(request, response);
		
		
	}

}
