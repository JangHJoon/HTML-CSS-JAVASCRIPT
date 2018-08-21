package kr.ac.green;

public class Product {
	private String name;
	private int price;
	public Product() {}
	public Product(String name, int price) {
		setName(name);
		setPrice(price);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	// alt + shift + s -> s
	@Override
	public String toString() {
		return "Product [name=" + name + ", price=" + price + "]";
	}
}





