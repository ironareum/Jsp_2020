package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		reqPro(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		reqPro(req, res);
	}

	protected void reqPro(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//#1 한 화면에 보여지는 글의 갯수 (10개씩 끊어서 보기)
		int pageSize=10;
		
		//현재보여지고 있는 페이지의 넘버값을 읽어드림(해당 페이지에 대한 정보를 읽어드림)
		String pageNum=req.getParameter("pageNum");//예[1][2]...
		
		//pageNum이 null처리
		if(pageNum==null) {
			pageNum="1";
		}
		//총 게시글의 갯수를 지정할 변수
		int count=0;
		
		//화면에 보여질 글번호 숫자
		int number=0;
		
		//pageNum을 int로 변환
		int currentPage=Integer.parseInt(pageNum);
		System.out.println("currentPage: "+ currentPage);
		//DAO의 객체
		BoardDAO bdao=new BoardDAO();
		
		//총게시글의 숫자를 얻어오는 메소드
		count=bdao.getAllCount();
		System.out.println("count : "+ count);
		// =====================================================================================
		//#2.현재 보여지는 페이지의 시작번호
		//1 페이지경우 (1-1)*10+1=1
		//2 페이지경우 (2-1)*10+1=11
		//3 페이지 경우 (3-1)*10+1=2
		int startRow=(currentPage-1)*pageSize+1;//DB에서 가져올 시작번호
		System.out.println("startRow: "+startRow);
		//1 페이지경우  1*10=10
		//2 페이지경우  2*10=20
		//3 페이지 경우 3*10=30
		int endRow=currentPage*pageSize;
		System.out.println("endRow: "+endRow);
		//최시글 10개를 기준으로 게시글을 리턴받는 메서스 호출
		Vector<BoardBean> v=bdao.getAllBoard(startRow, endRow);
		
		// ================================================================================================
		//#3. start,end까지의 데이터만 가져옴  
	  	//전체글을 9으로 봤을때 9-(1-1)*10=9
	  	//34번째글 위치 34-(4-1)*10=4
	  	//23번째글 위치  23-(3-1)*10=3
	  	
		number=count-(currentPage-1)*pageSize; //글목록에 현재 보여지는 글번호
		System.out.println("number(글번호): "+ number);
		//수정 삭제시 비번이 틀리면 메세지로 처리
		String msg=(String)req.getAttribute("msg");
		
		//jsp 페이지에서 사용할 값을 req에 붙여서 넘겨줌
		req.setAttribute("v", v);
		req.setAttribute("number", number);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("count", count);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("msg", msg);
		
		RequestDispatcher dis=req.getRequestDispatcher("BoardList.jsp");
		dis.forward(req, res);
	
		
	}	
	
}