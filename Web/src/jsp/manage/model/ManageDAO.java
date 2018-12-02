package jsp.manage.model;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

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

	public List<ManageBean> getManageList(int iid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ManageBean> itemList = new ArrayList<ManageBean>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM MANAGE WHERE Item_id = ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, iid);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ManageBean items = new ManageBean();
				
				items.setStore_idx(rs.getInt("Store_idx"));
				items.setLocation(rs.getString("Location"));
				items.setItem_id(rs.getInt("Item_id"));
				items.setStock(rs.getInt("Stock"));
				
				itemList.add(items);
			}
			
			return itemList;
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

	public void updateStock(int sid, int iid, int stock) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			StringBuffer query = new StringBuffer();
			query.append("UPDATE MANAGE SET");
			query.append(" Stock=?");
			query.append(" WHERE Store_idx = ? and Item_id = ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			
			conn.setAutoCommit(false);
			
			pstmt.setInt(1, stock);
			pstmt.setInt(2, sid);
			pstmt.setInt(3, iid);
			
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
}
