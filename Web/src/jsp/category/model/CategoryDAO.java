package jsp.category.model;

import java.sql.*;

import jsp.util.DBConnection;

public class CategoryDAO {
	
	private static CategoryDAO instance;
	
	private CategoryDAO() {}
	public static CategoryDAO getInstance() {
		if (instance == null) {
			instance = new CategoryDAO();
		}
		
		return instance;
	}
	
	// 카테고리 번호로 이름 얻어오기
	public String getCategoryName(int cid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT Small_category FROM CATEGORY WHERE CID = ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, cid);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString("Small_category");
			}
			
			return null;
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {pstmt.close(); pstmt=null;}
				if (conn != null) {conn.close(); conn=null;}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
}