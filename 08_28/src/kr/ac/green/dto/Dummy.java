package kr.ac.green.dto;

public class Dummy {
	private int number;
	private String first;
	private String second;
	
	public Dummy() {
	}
	
	public Dummy(String first, String second) {
		super();
		this.first = first;
		this.second = second;
	}
	
	public Dummy(int number, String first, String second) {
		super();
		this.number = number;
		this.first = first;
		this.second = second;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public String getSecond() {
		return second;
	}

	public void setSecond(String second) {
		this.second = second;
	}
	
	
	
	
	
}
