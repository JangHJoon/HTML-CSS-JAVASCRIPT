package kr.ac.green.dto;

public class Item {
	private int item_id;
	private String item_name;
	private int item_price;
	
	public Item() {}
	
	// insert
	public Item(String item_name, int item_price) {
		setItem_name(item_name);
		setItem_price(item_price);
	}
	
	// select
	public Item(int item_id, String item_name, int item_price) {
		setItem_id(item_id);
		setItem_name(item_name);
		setItem_price(item_price);
	}
		
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	
	
}
