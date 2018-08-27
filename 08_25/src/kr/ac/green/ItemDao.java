package kr.ac.green;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import kr.ac.green.dto.Item;
/*
 * DAO(= student manager)
data access object



1. 드라이버 로드(한번)

2. 연결
3. 질의
4. 자원 해제(세션 제한)


2~4 반복

import java.sql
1. Connection 객체(만들어 지면 데이터베이스와 연결된거, socket 객체랑 비슷함)
2. Statement 객체(질의를 전송)
3. ResultSet 객체(질의문의 결과, select)
 

3->2->1 close();

 */


// SingleTon Pattern
// 단 하나의 객체로 보장한다.
public class ItemDao {
	/*
	 * 1. 드라이버 로드
	 * 2. 연결
	 * 3. 질의
	 * 4. 자원해제 
	 * 
	 * 1번은 한번만 실행 이후 2~4번은 반복
	 * 
	 */
	
	private static final ItemDao instance = new ItemDao();
	
	private ItemDao() {
		// 드라이버 로드
		// DriverManager에 등록
		try {
			// DB마다 문자열 내용이 다름
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
				
	}
	
	public static ItemDao getInstance(){
		return instance;
	}
	
	
	public Connection connect() throws ConnectionFailException {
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(
					// DB마다 url이 다름
					"jdbc:mysql://localhost:3306/test",  //url
					"root",   //uid
					"1234" //password
					);
		} catch (SQLException e) {
			// 연결할때, 질의할때 모두 SQLException이 발생하기 때문에
			// 다른 예외를 만들어 throw 하여 구분한다.
			throw new ConnectionFailException();
		} finally {
//			try {
//				con.close();
//			} catch(SQLException e){
//				e.printStackTrace();
//			}
		}
		
		return con;		
	}
	
	private String getSqlString(String word){
		return "'" + toEn(word) + "'";
	}
	
	
	public Item[] getAll(Connection con){
		Item[] items = null;
		
		String sql = "SELECT * FROM items";
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql); // select --> ResultSet
//			result =  stmt.executeUpdate(sql); // create, update, delete --> int
		
			
// 1번 방법
//			Vector<Item> vec = new Vector<Item>();
//			while(rs.next()){
//				int id = rs.getInt("item_id");
//				String name = rs.getString("item_name");
//				int price = rs.getInt("item_price");
//				vec.add(new Item(id, name, price));				
//			}
//			
//			items = vec.toArray(new Item[0]);
			
			rs.last(); // 마지막 결과값으로
			int rowCount = rs.getRow(); // 현재 행 수 리턴
			rs.beforeFirst(); // 처음으로 
			items = new Item[rowCount];
			int idx = 0;
			
			while(rs.next()){
				int id = rs.getInt("item_id");
				String name = toKor(rs.getString("item_name"));
				int price = rs.getInt("item_price");
				items[idx++] = new Item(id, name, price);
			}
			
			
		
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}	
		
		return items;
	}
	
	//insert, delete, update
	public int insertItem(Connection con, Item item){
		int result = 0;
		
		String item_name = item.getItem_name();
		int item_price = item.getItem_price();
		
//		String sql = "INSERT INTO items (item_name, item_price) VALUES ("+getSqlString(item_name) +", "+ item_price +")";
//		String sql = "INSERT INTO items (item_name, item_price) VALUES ('"+ item_name +"', "+ item_price +")";
		String sql = String.format("INSERT INTO items (item_name, item_price) VALUES ('%s', %d )", item_name, item_price);
		
		
		Statement stmt = null;
		
		try {
			stmt = con.createStatement();
			//stmt.executeQuery(sql); // select --> ResultSet
			result =  stmt.executeUpdate(sql); // create, update, delete --> int
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		
		return result;
	}
	
	// 외부에서 자원해제
	public void close(Connection con){
		try{
			con.close();			
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	private void close(ResultSet rs){
		try{
			rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private void close(Statement stmt){
		try{
			stmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	//insert, update
	private String toEn(String kor){
		
		String en = null;
		try {
			en = new String(kor.getBytes("euc_kr"),"8859_1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return en;
		
		
	}
	
	// select
	private String toKor(String en){
		
		String kor = null;
		try {
			kor = new String(en.getBytes("8859_1"),"euc_kr");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return kor;
		
		
	}
	
	
	
	
	
	
}
