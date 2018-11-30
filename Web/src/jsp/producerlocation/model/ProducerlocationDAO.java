package jsp.producerlocation.model;

import java.sql.*;

import jsp.util.DBConnection;

public class ProducerlocationDAO {
	private static ProducerlocationDAO instance;
	
	public ProducerlocationDAO() { }
	
	public static ProducerlocationDAO getInstance() {
		if (instance == null) {
			instance = new ProducerlocationDAO();
		}
		return instance;
	}
	
	// 아이템 번호에 맞는 생산자 반환
	public ProducerlocationBean getItemToProducer(int iid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ProducerlocationBean pd = new ProducerlocationBean();
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM ITEM NATURAL JOIN PRODUCERLOCATION WHERE Item_id = ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, iid);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pd.setPid(rs.getInt("PID"));
				pd.setProducer(rs.getString("Producer"));
				pd.setLocation(rs.getString("Location"));
			}
			
			return pd;
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
}
