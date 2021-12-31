package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs; 
	
	//데이터베이스에 연결 DBCP사용 
	public void getCon(){
		
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds= (DataSource)envContext.lookup("jdbc/orcl");
			
			con = ds.getConnection();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// -----------------------------------------------------------
	//#1. 전체 게시글 갯수
	
	public int getAllCount() {
		getCon();
		
		int count=0;
		try {
			//쿼리 
			String sql ="select count(*) from board"; //갯수 : count(*)
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1); //결과값 1개니까 인덱스 번호 첫번째만 담으면됨 				
			}
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//-------------------------------------------
	//#2. 화면에 보여질 데이터 10개씩 리턴해주기 
	
	public Vector<BoardBean> getAllBoard(int startRow, int endRow){
		
		getCon();
		Vector<BoardBean> v = new Vector<>();
		
		try {
			//쿼리작성(스칼라 질의) 최신글 10개씩 가져오기(오라클에서만 적용되는 메소드 : Rownum 함수) 
			String sql=" SELECT * FROM (SELECT A.* ,Rownum Rnum FROM (SELECT * FROM board ORDER BY ref desc, re_step asc) A) WHERE Rnum >= ? and Rnum <= ?";
			pstmt=con.prepareStatement(sql);
			
			//?대입 
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getString(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContents(rs.getString(11));
			
				v.add(bean);
			}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	//-------------------------------------------
	//#3. form에서 받아온 데이터 입력하기 
	
	public void insertBoard(BoardBean bean) {
		getCon();
		
		//빈클래스에서 넘어오지 않았던 데이터를 초기화 
		int ref =0; //쿼리를 실행시켜서 가장 큰 ref(그룹)값을 가져와서 +1 해주기 (최신글 위로 가져오는 법) 
		int re_step =1; //새글 =부모글 (최상위)
		int re_level =1; //몇번째 자식...?
			
		try {
			String refsql ="select max(ref) from Board"; //가장 최근 글(그룹) 가져오기 
			
			pstmt = con.prepareStatement(refsql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref=rs.getInt(1)+1; //글그룹 설정. 가져온 값에 +1 해주기(위로 올릴려고)
			}
			
			String sql ="insert into board values(BOARD_SEQ.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			
			//? 대입 
			pstmt.setString(1, bean.getWriter());
		    pstmt.setString(2, bean.getEmail());
		    pstmt.setString(3, bean.getSubject());
		    pstmt.setString(4, bean.getPassword());
		    pstmt.setInt(5, ref);
		    pstmt.setInt(6, re_step);
		    pstmt.setInt(7, re_level);
		    pstmt.setString(8, bean.getContents());
			
		    //쿼리실행
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			
		}
	}
	//-------------------------------------------
	//4. 게시글 클릭(조회시) 조회수 증가 메소드 
	public BoardBean getOneBoard(int num) {
		
		getCon();
		BoardBean bean = null;
		
		try {
			//하나의 게시글을 읽어와서 조회수 증가하는 쿼리 
			String countsql="update board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(countsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			//하나의 게시글 리턴 
			String sql = "select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getString(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContents(rs.getString(11));
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return bean;
	}
	
	//-------------------------------------------
	// 5. 답글달기 
	public void reInsertBoard(BoardBean bean) {
		getCon();
		int ref= bean.getRef();
		int re_step= bean.getRe_step();
		int re_level= bean.getRe_level();
		
		try {
			String levelsql = "update board set re_level=re_level+1 where ref=? and re_level>?"; //글 그룹이 같으면서,레벨이 나보다 큰애들은 레벨을 다 +1 해줌(아래로 내려줌)  
			 pstmt= con.prepareStatement(levelsql);
			 pstmt.setInt(1, ref); //부모글 그룹번호 
			 pstmt.setInt(2, re_level); //부모글 레벨 
			 pstmt.executeUpdate();
			 
			//insert into 
			String sql ="insert into board values(BOARD_SEQ.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			
			//? 대입 
			pstmt.setString(1, bean.getWriter());
		    pstmt.setString(2, bean.getEmail());
		    pstmt.setString(3, bean.getSubject());
		    pstmt.setString(4, bean.getPassword());
		    pstmt.setInt(5, ref);
		    pstmt.setInt(6, re_step+1);
		    pstmt.setInt(7, re_level+1);
		    pstmt.setString(8, bean.getContents());
			
		    pstmt.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//-------------------------------------------
	// 6. 조회수를 증가하지 않고 한 게시글 가져오는 메소드..?  
	
	public BoardBean getoneUpdateBoard(int num){
		getCon();
		BoardBean bean = null;
		try {
			String sql = "select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			bean = new BoardBean();
			bean.setNum(rs.getInt(1));
			bean.setWriter(rs.getString(2));
			bean.setEmail(rs.getString(3));
			bean.setSubject(rs.getString(4));
			bean.setPassword(rs.getString(5));
			bean.setReg_date(rs.getString(6).toString());
			bean.setRef(rs.getInt(7));
			bean.setRe_step(rs.getInt(8));
			bean.setRe_level(rs.getInt(9));
			bean.setReadcount(rs.getInt(10));
			bean.setContents(rs.getString(11));
			}
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	//-------------------------------------------
	// 7. 게시글을 수정하는 메소드  
	public void UpdateBoard(int num, String subject, String contents){
		getCon();
		
		try {
			String sql="update board set subject=?, contents=? where num =?";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, contents);
			pstmt.setInt(3, num);
			
			pstmt.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//-------------------------------------------
	// 8. 게시글을 삭제하는 메소드  
	public void deleteBoard(int num) {
		getCon();
		
		try {
			String sql = "delete from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
}
