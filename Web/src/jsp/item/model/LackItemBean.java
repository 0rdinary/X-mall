package jsp.item.model;

public class LackItemBean {
	private int item_id;
	private String name;
	private int lack;
	
	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLack() {
		return lack;
	}

	public void setLack(int lack) {
		this.lack = lack;
	}

	public LackItemBean() {}
	
}
