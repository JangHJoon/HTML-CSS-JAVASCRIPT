package ac.green.kr;

public class Stock {
	private int no;
	private String name;
	private String sort;
	private int amount;
	private String exp;
	
	public Stock() {}
	public Stock(int no) {
		setNo(no);
	}
	public Stock(int no, String name, String sort, int amount, String exp) {
		setNo(no);
		setName(name);
		setSort(sort);
		setAmount(amount);
		setExp(exp);
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	@Override
	public boolean equals(Object obj) {
		if((obj == null) || !(obj instanceof Stock)) {
			return false;
		}
		Stock other = (Stock)obj;
		return other.getNo() == no;
	}
	
}
