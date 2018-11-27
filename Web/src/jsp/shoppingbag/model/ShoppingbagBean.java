package jsp.shoppingbag.model;

public class ShoppingbagBean {
	private int user_id;
	private int bag_id;
	private int total_price;
	private String bag_name;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getBag_id() {
		return bag_id;
	}
	public void setBag_id(int bag_id) {
		this.bag_id = bag_id;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getBag_name() {
		return bag_name;
	}
	public void setBag_name(String bag_name) {
		this.bag_name = bag_name;
	}
}
