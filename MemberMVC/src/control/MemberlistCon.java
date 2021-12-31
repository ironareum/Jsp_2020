package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MemberlistCon.do")
public class MemberlistCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberlistCon() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO mdao = new MemberDAO();
		Vector<MemberBean> v =mdao.allSelectMember();
		
		req.setAttribute("vec", v); //req객체에 넣어줌 
		
		RequestDispatcher dis = req.getRequestDispatcher("MemberList.jsp"); // 얘 호출 
		dis.forward(req, resp);
		
	}

}
