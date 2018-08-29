package kr.ac.green.dto;

public class Student {
	private String id;
	private String name;
	private String tel;
	private int grade;
	private String clazz;
	
	
	
	public Student() {
	}
	
	
	public Student(String name, String tel, int grade, String clazz) {
		super();
		this.name = name;
		this.tel = tel;
		this.grade = grade;
		this.clazz = clazz;
	}


	public Student(String id, String name, String tel, int grade, String clazz) {
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.grade = grade;
		this.clazz = clazz;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getClazz() {
		return clazz;
	}
	public void setClazz(String clazz) {
		this.clazz = clazz;
	}
	
}
