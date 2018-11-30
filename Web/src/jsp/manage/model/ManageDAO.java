package jsp.manage.model;

import java.sql.*;

import jsp.util.DBConnection;

public class ManageDAO {
	private static ManageDAO instance;
	
	public ManageDAO() {}
	public static ManageDAO getInstance() {
		if (instance == null) {
			instance = new ManageDAO();
		}
		
		return instance;
	}
	
	// 아이템 번호에 맞는 아이템이 몇개 있는지 반환
	public int getStock(int iid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = 0;
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT SUM(STOCK) FROM MANAGE WHERE Item_id = ? GROUP BY Item_id");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, iid);
		
		    rs = pstmt.executeQuery();
		    if (rs.next()) {
		    	result = rs.getInt("SUM(STOCK)");
		    }
		    
		    return result;
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) { pstmt.close(); pstmt = null; }
				if (conn != null) { conn.close(); conn = null; }
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
}
