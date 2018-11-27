package jsp.ordered_by.model;

public class OrderedbyBean {
	private int user_id;
	private int bag_idx;
	private boolean is_ordered;
	private int year;
	private int month;
	private int day;
	private int store_idx;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getBag_idx() {
		return bag_idx;
	}
	public void setBag_idx(int bag_idx) {
		this.bag_idx = bag_idx;
	}
	public boolean isIs_ordered() {
		return is_ordered;
	}
	public void setIs_ordered(boolean is_ordered) {
		this.is_ordered = is_ordered;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getStore_idx() {
		return store_idx;
	}
	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}
}
