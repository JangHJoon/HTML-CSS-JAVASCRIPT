package kr.ac.green;

import java.util.HashMap;

public class MyList extends HashMap<Integer, Student> {
	
	private Integer lastIndex;
	
	public MyList(){
		super();
		this.lastIndex = 0;		
	}
	
	public void add(Student s){
		super.put(lastIndex, s);
		lastIndex++;		
	}
	
	public void remove(Integer index){
		super.remove(index);
	}
	
	public void update(Integer index, Student s){
		if(super.containsKey(index)){
			super.put(index, s);
		}
	}
	
	
	
	
	
	

}
