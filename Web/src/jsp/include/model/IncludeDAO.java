package jsp.include.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import jsp.customer.model.CustomerBean;
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
	
	public void updateInclude(IncludeBean ib, int cs, int diff) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			
			conn.setAutoCommit(false);
			
			StringBuffer sql0 = new StringBuffer();
			sql0.append("select * from ITEM where Item_id = ?");
			PreparedStatement pstmt0 = conn.prepareStatement(sql0.toString());
			pstmt0.setInt(1, ib.getItem_id());
			ResultSet rs0 = pstmt0.executeQuery();
			int price = 0;
			if (rs0.next()) {
				price = rs0.getInt("Price");
			}
			
			StringBuffer sql1 = new StringBuffer();
			int totalPrice = 0;
			int change = price * diff;
			if (cs == 0) {
				sql1.append("insert into INCLUDE values (?, ?, ?, ?)");
				pstmt = conn.prepareStatement(sql1.toString());
				pstmt.setInt(1, ib.getBag_idx());
				pstmt.setInt(2, ib.getUser_id());
				pstmt.setInt(3, ib.getItem_id());
				pstmt.setInt(4, ib.getStock());
			} else if (cs == 1) {
				if (ib.getStock() != 0) {
					sql1.append("update INCLUDE set Stock = ? where Bag_idx = ? and Item_id = ?");
					pstmt = conn.prepareStatement(sql1.toString());
					pstmt.setInt(1, ib.getStock());
					pstmt.setInt(2, ib.getBag_idx());
					pstmt.setInt(3,  ib.getItem_id());
				} else {
					sql1.append("delete from INCLUDE where Bag_idx = ? and Item_id = ?");
					pstmt = conn.prepareStatement(sql1.toString());
					pstmt.setInt(1, ib.getBag_idx());
					pstmt.setInt(2,  ib.getItem_id());
				}
			}
			pstmt.executeUpdate();
			
			StringBuffer sql2 = new StringBuffer();
			sql2.append("select * from SHOPPINGBAG where Bag_idx = ?");
			PreparedStatement ps = conn.prepareStatement(sql2.toString());
			ps.setInt(1, ib.getBag_idx());
			ResultSet rs2 = ps.executeQuery();
			int oTotal = 0;
			if (rs2.next()) {
				oTotal = rs2.getInt("Total_price");
			}
			
			StringBuffer sql3 = new StringBuffer();
			sql3.append("update SHOPPINGBAG set Total_price = ? where Bag_idx = ?");
			PreparedStatement ps3 = conn.prepareStatement(sql3.toString());
			ps3.setInt(1, oTotal+change);
			ps3.setInt(2, ib.getBag_idx());
			ps3.executeUpdate();
			
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

	public IncludeBean getInclude(int bid, int iid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		IncludeBean include = null;
		
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM INCLUDE WHERE Bag_idx = ? and Item_id = ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, bid);
			pstmt.setInt(2, iid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				include = new IncludeBean();
				include.setBag_idx(rs.getInt("Bag_idx"));
				include.setUser_id(rs.getInt("User_id"));
				include.setItem_id(rs.getInt("Item_id"));
				include.setStock(rs.getInt("Stock"));
			}
			
			return include;
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
}
