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
	
	public ItemBean getItem(int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ItemBean destItem = new ItemBean();
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM ITEM WHERE Item_id = ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				destItem.setItem_id(rs.getInt("Item_id"));
				destItem.setName(rs.getString("Name"));
				destItem.setPrice(rs.getInt("Price"));
				destItem.setDiscount_rate(rs.getInt("Discount_rate"));
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(rs.getDate("Exp_date"));
				destItem.setYear(cal.get(Calendar.YEAR));
				destItem.setMonth(cal.get(Calendar.MONTH)+1);
				destItem.setDay(cal.get(Calendar.DAY_OF_MONTH));
				
				destItem.setRating(rs.getDouble("Rating"));
				destItem.setImporter(rs.getString("Importer"));
				destItem.setCid(rs.getInt("CID"));
				destItem.setPid(rs.getInt("PID"));
			}
			
			return destItem;
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

	public List<ItemBean> searchName(String Name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ItemBean> itemList = new ArrayList<ItemBean>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM ITEM WHERE Name like ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, "%"+Name+"%");
			
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

	public List<ItemBean> searchProducer(String Name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ItemBean> itemList = new ArrayList<ItemBean>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM ITEM natural join PRODUCERLOCATION WHERE Producer like ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, "%"+Name+"%");
			
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

	public List<ItemBean> searchImporter(String Name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ItemBean> itemList = new ArrayList<ItemBean>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM ITEM WHERE Importer like ?");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, "%"+Name+"%");
			
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

	public List<LackItemBean> getLackItemList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<LackItemBean> itemList = new ArrayList<LackItemBean>();
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT T1.Item_id, ITEM.Name, T2.SUMM - T1.SUMM AS Lack\n" + 
					"FROM ( SELECT Item_id, SUM(Stock) AS SUMM\n" + 
					"       FROM MANAGE NATURAL JOIN ITEM\n" + 
					"       GROUP BY Item_id) T1,\n" + 
					"     ( SELECT Item_id, SUM(Stock) AS SUMM\n" + 
					"       FROM ORDERED_BY NATURAL JOIN INCLUDE\n" + 
					"       WHERE Is_ordered = FALSE\n" + 
					"       GROUP BY Item_id) T2,\n" + 
					"	ITEM\n" + 
					"WHERE T1.Item_id = T2.Item_id\n" + 
					"AND T1.Item_id = ITEM.Item_id\n" + 
					"AND T1.SUMM - T2.SUMM < 0;");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				LackItemBean items = new LackItemBean();
				
				items.setItem_id(rs.getInt("Item_id"));
				items.setName(rs.getString("Name"));
				items.setLack(rs.getInt("Lack"));
				
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
