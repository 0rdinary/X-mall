package jsp.customer.model;

import java.sql.*;
import javax.naming.NamingException;

import jsp.util.DBConnection;

public class CustomerDAO {
	private static CustomerDAO instance;
	
	private CustomerDAO() {}
	public static CustomerDAO getInstance() {
		if (instance == null) {
			instance = new CustomerDAO();
		}
		
		return instance;
	}
	
	public void insertCustomer(CustomerBean customer) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO CUSTOMER values");
			sql.append("(?, ?, ?, ?, ?, ?, ?, ?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, customer.getUser_id());
			pstmt.setString(2, customer.getUser_password());
			pstmt.setString(3, customer.getAddress());
			pstmt.setString(4,  customer.getPhone_number());
			pstmt.setInt(5, 0);
			
			String temp = customer.getSex();
			if (temp.equals("privacy")) {
				pstmt.setNull(6, java.sql.Types.NULL);
			} else {
				pstmt.setString(6, temp);
			}
			
			pstmt.setString(7, Integer.toString(customer.getAge()));
			temp = customer.getJob();
			if (temp == null) {
				pstmt.setNull(8, java.sql.Types.NULL);
			} else {
				pstmt.setString(8, temp);
			}
			
			System.out.println(pstmt);
			
			pstmt.executeUpdate();
			conn.commit();
		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			conn.rollback();
			
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if ( pstmt != null) { pstmt.close(); pstmt=null; }
				if (conn != null) { conn.close(); conn=null; }
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	
	public int loginCheck(int User_id, String User_password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbPW;
		int x = -1;
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT User_password FROM CUSTOMER WHERE user_id=?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, User_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbPW = rs.getString("User_password");
				
				if (dbPW.equals(User_password)) x = 1;	// 인증 성공 
				else x = 0;	// 인증 실패 
			}else {
				x = -1; // 아이디가 없음
			}
			
			return x;
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {pstmt.close(); pstmt=null; }
				if (conn != null) {conn.close(); conn=null; }
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
}
