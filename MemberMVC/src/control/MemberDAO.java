package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	//데이터베이스에 접근 할 수 있도록 설정되어야 하는 객체 
	Connection	con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	//데이터베이스에 접근할 수 있도록 도와주는 메소드 단 DBCP사용
	public void getCon() {
			try {
				// new InitialContext()로 Context의 객체확보
				Context initContext = new InitialContext();
				// JNDI(java Naming Directory Interface)을 이용하여 환경설정 객체 생성
				Context envContext = (Context) initContext.lookup("java:/comp/env");
				DataSource ds = (DataSource) envContext.lookup("jdbc/orcl");
				// 커넥션 확보
				con = ds.getConnection();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	
	
	//1. 데이터베이스에 한 사람에 대한 회원정보 저장
	public void insertMember(MemberBean mbean) {
		getCon();
		try {
			
			String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt =con.prepareStatement(sql);
			//?에 매핑 
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getPass2());
			pstmt.setString(4, mbean.getEmail());
			pstmt.setString(5, mbean.getGender());
			pstmt.setString(6, mbean.getAddress());
			pstmt.setString(7, mbean.getPhone());
			pstmt.setString(8, mbean.getHobby());
			pstmt.setString(9, mbean.getJob());
			pstmt.setString(10, mbean.getAge());
			pstmt.setString(11, mbean.getInfo());
			
			//쿼리실행
			pstmt.executeUpdate();
			
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//2. 모든 사용자의 정보를 가져오는 메소드 
	public Vector<MemberBean> allSelectMember(){
		//각각의 회원정보를 모두 Vector v에 담기 
		Vector<MemberBean> v = new Vector<>();
		
		try {
			getCon();
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString(1)); //rs안에 담겨있는 내용중에서 0번째 값 
				bean.setPass1(rs.getString(2)); 
				bean.setPass2(rs.getString(3)); 
				bean.setEmail(rs.getString(4)); 
				bean.setGender(rs.getString(5)); 
				bean.setAddress(rs.getString(6)); 
				bean.setPhone(rs.getString(7)); 
				bean.setHobby(rs.getString(8)); 
				bean.setJob(rs.getString(9)); 
				bean.setAge(rs.getString(10)); 
				bean.setInfo(rs.getString(11)); 
				
				v.add(bean);
			}
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
}
