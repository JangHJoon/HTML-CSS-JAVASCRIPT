package kr.ac.green;

public class Student {
	
	private String name;
	private String tel;
	private String grade;
	private String clazz;

	public Student() {}
	
	public Student(String name, String tel, String grade, String clazz) {
		this.name = name;
		this.tel = tel;
		this.grade = grade;
		this.clazz = clazz;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getClazz() {
		return clazz;
	}
	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj != null && obj instanceof Student){
			Student s = (Student)obj;			
			if(name.endsWith(s.getName()) && 
					tel.equals(s.getTel()) &&
					grade.equals(s.getGrade()) &&
					clazz.equals(s.getClazz())){
				return true;
			}			
		}
		return false;
	}
	
	
	
}
