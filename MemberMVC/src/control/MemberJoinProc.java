package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/proc1.do") //url주소 (없으면 자기자신 호출) 
public class MemberJoinProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MemberBean bean = new MemberBean();
		
		//form에서 입력한 값 bean에 넣기 
		bean.setId(req.getParameter("id"));
		System.out.println("테스트중 ");
		System.out.println(req.getParameter("id"));
		String pass1 = req.getParameter("pass1");
		String pass2 = req.getParameter("pass2");
		bean.setPass1(pass1);
		bean.setPass2(pass2);
		bean.setEmail(req.getParameter("email"));
		bean.setGender(req.getParameter("gender"));
		bean.setAddress(req.getParameter("address"));
		bean.setPhone(req.getParameter("phone"));
		//bean.setHobby(req.getParameter("hobby")); //hobby는 값이 여러개니까 배열로 받음 
		String[] arr = req.getParameterValues("hobby");
		String data="";
		for(String str:arr) {
			data += str+", "; //스트림처리: 데이터를 하나의 스트링으로 처리  
		}
		bean.setHobby(data);
		bean.setJob(req.getParameter("job"));
		bean.setAge(req.getParameter("age"));
		bean.setInfo(req.getParameter("info"));
		
		
		//비밀번호 일치하는지 확인 
		if(pass1.equals(pass2)) {
			//bean의 값을 오라클에 넣어줌 
			MemberDAO mdao = new MemberDAO();
			mdao.insertMember(bean);
			
			//회원가입 완료시 가입한 회원의 정보리스트를 보여줌 
			RequestDispatcher dis = req.getRequestDispatcher("MemberlistCon.do"); //또다른 서블릿으로 넘어감
			dis.forward(req, res);//req, res 값 넘겨주기 
		} else {
			//패스워드가 불일치시 (메세지 띄워주고, 에러페이지로 이동) 
			req.setAttribute("msg", "패스워드가 일치하지 않습니다.");
			RequestDispatcher dis = req.getRequestDispatcher("LoginError.jsp");
			dis.forward(req, res);
		}
		
		
		
		
	}

}
