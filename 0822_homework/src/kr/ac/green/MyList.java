package kr.ac.green;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;

public class MyList extends HashMap<Integer, Student> {
	
	private Integer lastIndex;
	
	public MyList(){
		super();
		this.lastIndex = 1;		
	}
	
	public void add(String name, String tel, String grade, String clazz){
		super.put(lastIndex, new Student(lastIndex, name, tel, grade, clazz));
		lastIndex++;		
	}
	
	public void remove(Integer index){
		if(super.containsKey(index)){
			super.remove(index);
		}
	}
	
	public void update(Integer index, Student s){
		if(super.containsKey(index)){
			super.put(index, s);
		}
	}
	
	public Student getById(Integer index){
		if(super.containsKey(index)){
			System.out.println("method in");
			return super.get(index);
		}
		return null;
	}
	
	public Student[] getByName(String name){
		LinkedList<Student> list = new LinkedList<Student>();
		for(Student s: super.values()){
			if(s.getName().equals(name)){
				list.add(s);
			}
		}
		
		if(list.size()==0){
			return null;
		}
		return list.toArray(new Student[0]);
		
	}
	
	public Student[] getByClass(String clazz){
		LinkedList<Student> list = new LinkedList<Student>();
		for(Student s: super.values()){
			if(s.getClazz().equals(clazz)){
				list.add(s);
			}
		}		
		if(list.size()==0){
			return null;
		}
		return list.toArray(new Student[0]);
	}
	
	
	
	
	
	

}
