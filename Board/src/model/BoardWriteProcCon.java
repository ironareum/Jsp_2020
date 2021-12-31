package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardWriteProcCon.do")
public class BoardWriteProcCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqProc(request, response);
	}
	
	protected void reqProc(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//bean 가져오기 
		BoardBean bean = new BoardBean();
		//한글깨짐 처리
		req.setCharacterEncoding("UTF-8");
		
		//BoardWriterForm에서 데이터 읽어와서 bean에 넣기
		bean.setWriter(req.getParameter("writer"));
		bean.setSubject(req.getParameter("subject"));
		bean.setEmail(req.getParameter("email"));
		bean.setPassword(req.getParameter("password"));
		bean.setContents(req.getParameter("content"));
		
		BoardDAO bdao = new BoardDAO();
		
		bdao.insertBoard(bean);
		
		RequestDispatcher dis = req.getRequestDispatcher("BoardListCon.do");
		dis.forward(req, res);
		
		
	}

}
