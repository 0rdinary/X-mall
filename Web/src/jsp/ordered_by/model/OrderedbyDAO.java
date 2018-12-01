package jsp.ordered_by.model;

import java.sql.*;
import java.util.Calendar;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import jsp.manage.model.ManageBean;
import jsp.util.DBConnection;

public class OrderedbyDAO {
	private static OrderedbyDAO instance;
	
	public OrderedbyDAO() {}
	public static OrderedbyDAO getInstance() {
		if (instance == null) {
			instance = new OrderedbyDAO();
		}
		
		return instance;
	}
	
	// 구매완료시 업데이트
	// 매장들의 재고도 감소시켜야함
	public void updateOrder(OrderedbyBean order, int bid, String ul) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement lpstmt = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		int idx = 0;
		
		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			
			StringBuffer sql1 = new StringBuffer();
			sql1.append("select * from INCLUDE where Bag_idx = ?");
			pstmt1 = conn.prepareStatement(sql1.toString());
			pstmt1.setInt(1, bid);
			rs1 = pstmt1.executeQuery();
			List<Integer> itemList = new ArrayList<Integer>();
			List<Integer> itemStock = new ArrayList<Integer>();
			while (rs1.next()) {
				itemList.add(rs1.getInt("Item_id"));
				itemStock.add(rs1.getInt("Stock"));
			}
			int listSize = itemList.size();
			
			for (idx = 0; idx < listSize; idx++) {
				StringBuffer isql = new StringBuffer();
				isql.append("select * from MANAGE where Item_id = ? and Location = ?");
				PreparedStatement ipstmt = conn.prepareStatement(isql.toString());
				ipstmt.setInt(1, itemList.get(idx));
				ipstmt.setString(2, ul);
				rs2=ipstmt.executeQuery();
				
				ManageBean umb = new ManageBean();
				if (rs2.next()) {
					umb.setStore_idx(rs2.getInt("Store_idx"));
					umb.setLocation(rs2.getString("Location"));
					umb.setItem_id(rs2.getInt("Item_id"));
					umb.setStock(rs2.getInt("Stock"));
				}
				
				int diff = umb.getStock() - itemStock.get(idx);
				StringBuffer esql = new StringBuffer();
				esql.append("update MANAGE SET stock = ? where Item_id = ? and Store_idx = ?");
				pstmt3 = conn.prepareStatement(esql.toString());
				if (diff > 0) {
					pstmt3.setInt(1, diff);
					itemStock.set(idx, 0);
				} else if (diff < 0) {
					pstmt3.setInt(1, 0);
					itemStock.set(idx, diff*(-1));
				}
				pstmt3.setInt(2, umb.getItem_id());
				pstmt3.setInt(3, umb.getStore_idx());
				pstmt3.executeUpdate();
				
				if (itemStock.get(idx) == 0) {
					continue;
				} else {
					StringBuffer ssql = new StringBuffer();
					ssql.append("select * from MANAGE where Item_id = ?");
					PreparedStatement ppstmt = conn.prepareStatement(ssql.toString());
					ppstmt.setInt(1, itemList.get(idx));
					ResultSet prs = ppstmt.executeQuery();
					
					List<ManageBean> mlist = new ArrayList<ManageBean>();
					while (prs.next()) {
						ManageBean mb = new ManageBean();
						
						mb.setStore_idx(prs.getInt("Store_idx"));
						mb.setLocation(prs.getString("Location"));
						mb.setItem_id(prs.getInt("Item_id"));
						mb.setStock(prs.getInt("Stock"));
						
						mlist.add(mb);
					}
					
					int msize = mlist.size();
					for (int i = 0; i < msize; i++) {
						int diff1 = mlist.get(i).getStock() - itemStock.get(idx);
						StringBuffer msql = new StringBuffer();
						msql.append("update MANAGE SET stock = ? where Item_id = ? and Store_idx = ?");
						PreparedStatement mpstmt = conn.prepareStatement(msql.toString());
						
						if (diff1 > 0) {
							mpstmt.setInt(1, diff1);
							itemStock.set(idx, 0);
						} else if (diff1 < 0) {
							itemStock.set(idx, diff*(-1));
							mpstmt.setInt(1, 0);
						}
						mpstmt.setInt(2, mlist.get(i).getItem_id());
						mpstmt.setInt(3, mlist.get(i).getStore_idx());
						mpstmt.executeUpdate();
						
						if (itemStock.get(idx) == 0) {
							break;
						}
					}
				}
			}
			
			StringBuffer lsql = new StringBuffer();
			lsql.append("update ORDERED_BY SET Is_ordered=?, When_ordered=? where Bag_idx = ?");
			
			lpstmt = conn.prepareStatement(lsql.toString());
			lpstmt.setBoolean(1, true);
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			lpstmt.setDate(2, sqlDate);
			lpstmt.setInt(3, bid);
			
			lpstmt.executeUpdate();
			
			conn.commit();
		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			conn.rollback();
			
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (conn != null) { conn.close(); conn=null; }
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
}
