package kr.ac.green;

import java.util.HashMap;
import java.util.NavigableMap;
import java.util.SortedSet;
import java.util.TreeMap;

public class test {

	public static void main(String[] args) {
		
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		
		list.put(1, "a");
		list.put(2, "l");
		list.put(3, "3");
		
		System.out.println(list.toString());
		
		list.put(5, "3");
		list.put(5, "4");
		list.put(11, "3");
		list.remove(2);
		
		System.out.println(list.toString());
		
		
		System.out.println(list.keySet());
		
	}

}
