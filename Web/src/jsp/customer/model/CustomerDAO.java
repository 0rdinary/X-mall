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
			
			pstmt.setInt(7, customer.getAge());
			temp = customer.getJob();
			if (temp == null) {
				pstmt.setNull(8, java.sql.Types.NULL);
			} else {
				pstmt.setString(8, temp);
			}
			
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
	
	public CustomerBean getUserInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CustomerBean customer = null;
		
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM CUSTOMER WHERE User_id=?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				customer = new CustomerBean();
				customer.setUser_id(rs.getInt("User_id"));
				customer.setUser_password(rs.getString("User_password"));
				customer.setAddress(rs.getString("Address"));
				customer.setPhone_number(rs.getString("Phone_number"));
				customer.setMembership(rs.getInt("Membership"));
				customer.setSex(rs.getString("Sex"));
				customer.setAge(rs.getInt("Age"));
				customer.setJob(rs.getString("Job"));
			}
			
			return customer;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null) {pstmt.close(); pstmt=null;}
				if (conn != null) {conn.close(); conn=null;}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	
	public void updateCustomer(CustomerBean customer) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			StringBuffer query = new StringBuffer();
			query.append("UPDATE CUSTOMER SET");
			query.append(" User_password=?, Address=?, Phone_number=?, Sex=?, Age=?, Job=?");
			query.append(" WHERE User_id=?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, customer.getUser_password());
			pstmt.setString(2, customer.getAddress());
			pstmt.setString(3, customer.getPhone_number());
			
			String temp = customer.getSex();
			if (temp.equals("privacy")) {
				pstmt.setNull(4, java.sql.Types.NULL);
			} else {
				pstmt.setString(4, temp);
			}
			
			pstmt.setInt(5, customer.getAge());
			
			temp = customer.getJob();
			if (temp == null) {
				pstmt.setNull(6, java.sql.Types.NULL);
			} else {
				pstmt.setString(6, temp);
			}
			pstmt.setInt(7, customer.getUser_id());
			
			pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if (pstmt != null) { pstmt.close(); pstmt = null;}
				if (conn != null) { conn.close(); conn=null;}
			} catch (Exception e) {
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
