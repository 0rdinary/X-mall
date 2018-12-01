package jsp.include.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jsp.util.DBConnection;

public class IncludeDAO {
	private static IncludeDAO instance;
	
	public IncludeDAO() {}
	public static IncludeDAO getInstance() {
		if (instance == null) {
			instance = new IncludeDAO();
		}
		
		return instance;
	}
	
	public List<IncludeBean> getIncludeList(int bid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<IncludeBean> list = new ArrayList<IncludeBean>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("select * from INCLUDE where Bag_idx = ?;");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, bid);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				IncludeBean em = new IncludeBean();
				
				em.setBag_idx(bid);
				em.setUser_id(rs.getInt("User_id"));
				em.setItem_id(rs.getInt("Item_id"));
				em.setStock(rs.getInt("Stock"));
				
				list.add(em);
			}
			
			return list;
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
