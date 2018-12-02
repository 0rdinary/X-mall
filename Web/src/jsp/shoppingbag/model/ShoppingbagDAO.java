package jsp.shoppingbag.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import jsp.util.DBConnection;

public class ShoppingbagDAO {
	private static ShoppingbagDAO instance;
	
	public ShoppingbagDAO() { }
	
	public static ShoppingbagDAO getInstance() {
		if (instance == null) {
			instance = new ShoppingbagDAO();
		}
		return instance;
	}
	
	// 유저 아이디에 맞는 쇼핑백들 반환
	public List<ShoppingbagBean> getUnorderedShoppingbagList(int uid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<ShoppingbagBean> list = new ArrayList<ShoppingbagBean>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("select Bag_idx, Total_price, Bag_name from CUSTOMER natural join SHOPPINGBAG natural join ORDERED_BY where User_id = ? and is_ordered = false;");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, uid);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ShoppingbagBean em = new ShoppingbagBean();
				
				em.setBag_id(rs.getInt("Bag_idx"));
				em.setTotal_price(rs.getInt("Total_price"));
				em.setBag_name(rs.getString("Bag_name"));
				
				list.add(em);
			}
			
			return list;
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) { pstmt.close(); pstmt=null; }
				if (conn != null) { conn.close(); conn=null; }
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

	public int countShoppingbag() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			StringBuffer query = new StringBuffer();
			query.append("select count(*) from SHOPPINGBAG");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("count(*)");
			}
			
			return result;
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) { pstmt.close(); pstmt=null; }
				if (conn != null) { conn.close(); conn=null; }
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	
	// 쇼핑백 추가
	public void insertShoppingbag(int uid) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement ppstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO SHOPPINGBAG values");
			sql.append("(?, ?, ?, ?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, uid);
			int bid = countShoppingbag() + 1;
			pstmt.setInt(2, bid);
			pstmt.setInt(3, 0);
			pstmt.setNull(4, 0);
			
			pstmt.executeUpdate();
			
			StringBuffer osql = new StringBuffer();
			osql.append("INSERT INTO ORDERED_BY values");
			osql.append("(?, ?, ?, ?, ?)");
			
			ppstmt = conn.prepareStatement(osql.toString());
			ppstmt.setInt(1, uid);
			ppstmt.setInt(2, bid);
			ppstmt.setBoolean(3, false);
			ppstmt.setNull(4, 0);
			ppstmt.setNull(5, 0);
			
			ppstmt.executeUpdate();
			
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
}
