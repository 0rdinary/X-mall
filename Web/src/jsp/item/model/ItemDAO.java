package jsp.item.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import jsp.util.DBConnection;

public class ItemDAO {
private static ItemDAO instance;
	
	private ItemDAO() {}
	public static ItemDAO getInstance() {
		if (instance == null) {
			instance = new ItemDAO();
		}
		
		return instance;
	}
	
	// item은 찾아야할 아이템들의 정보를 가지고 있음
	// 작은 카테고리 일때
	public List<ItemBean> getItemList(ItemBean item) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ItemBean> itemList = new ArrayList<ItemBean>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM ITEM WHERE CID = ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, item.getCid());
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean items = new ItemBean();
				items.setItem_id(rs.getInt("Item_id"));
				items.setName(rs.getString("Name"));
				items.setPrice(rs.getInt("Price"));
				items.setDiscount_rate(rs.getInt("Discount_rate"));
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(rs.getDate("Exp_date"));
				items.setYear(cal.get(Calendar.YEAR));
				items.setMonth(cal.get(Calendar.MONTH));
				items.setDay(cal.get(Calendar.DAY_OF_MONTH));
				
				items.setRating(rs.getDouble("Rating"));
				items.setImporter(rs.getString("Importer"));
				items.setCid(rs.getInt("CID"));
				items.setPid(rs.getInt("PID"));
				
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
	
	// 큰카테고리일때
	public List<ItemBean> getItemList(int... item) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ItemBean> itemList = new ArrayList<ItemBean>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM ITEM WHERE CID = ? OR CID = ? OR CID = ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			
			int count = 1;
			for (int i : item) {
				pstmt.setInt(count++, i);
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean items = new ItemBean();
				items.setItem_id(rs.getInt("Item_id"));
				items.setName(rs.getString("Name"));
				items.setPrice(rs.getInt("Price"));
				items.setDiscount_rate(rs.getInt("Discount_rate"));
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(rs.getDate("Exp_date"));
				items.setYear(cal.get(Calendar.YEAR));
				items.setMonth(cal.get(Calendar.MONTH));
				items.setDay(cal.get(Calendar.DAY_OF_MONTH));
				
				items.setRating(rs.getDouble("Rating"));
				items.setImporter(rs.getString("Importer"));
				items.setCid(rs.getInt("CID"));
				items.setPid(rs.getInt("PID"));
				
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
}
