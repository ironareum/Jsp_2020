package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글깨짐 처리 
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String subject =request.getParameter("subject");
		String password =request.getParameter("password");
		String contents =request.getParameter("contents");
		String pass =request.getParameter("pass");
		int num = Integer.parseInt(request.getParameter("num"));
		
		//password() pass() 비교 
		if(password.equals(pass)) {
			//DAO연결 : UpdateBoard로 이동 
			BoardDAO bdao = new BoardDAO();
			bdao.UpdateBoard(num, subject, contents);
			
			//BoardList.jsp로 이동(하지만 BoardListCon으로 이동함)
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
			
		} else {
			//BoardList.jsp로 이동(하지만 BoardListCon으로 이동함)하여 스트립트 메세지 띄움 
			request.setAttribute("msg", "0"); //수정오류 띄워주는 값 '0' 셋팅 
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
			
		}
		
		
	}

}
