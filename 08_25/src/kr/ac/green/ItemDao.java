package kr.ac.green;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import kr.ac.green.dto.Item;



// SingleTon Pattern
// �� �ϳ��� ��ü�� �����Ѵ�.
public class ItemDao {
	/*
	 * 1. ����̹� �ε�
	 * 2. ����
	 * 3. ����
	 * 4. �ڿ����� 
	 * 
	 * 1���� �ѹ��� ���� ���� 2~4���� �ݺ�
	 * 
	 */
	
	private static final ItemDao instance = new ItemDao();
	
	private ItemDao() {
		// ����̹� �ε�
		// DriverManager�� ���
		try {
			// DB���� ���ڿ� ������ �ٸ�
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
					// DB���� url�� �ٸ�
					"jdbc:mysql://localhost:3306/test",  //url
					"root",   //uid
					"1234" //password
					);
		} catch (SQLException e) {
			// �����Ҷ�, �����Ҷ� ��� SQLException�� �߻��ϱ� ������
			// �ٸ� ���ܸ� ����� throw �Ͽ� �����Ѵ�.
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
		
			
// 1�� ���
//			Vector<Item> vec = new Vector<Item>();
//			while(rs.next()){
//				int id = rs.getInt("item_id");
//				String name = rs.getString("item_name");
//				int price = rs.getInt("item_price");
//				vec.add(new Item(id, name, price));				
//			}
//			
//			items = vec.toArray(new Item[0]);
			
			rs.last(); // ������ ���������
			int rowCount = rs.getRow(); // ���� �� �� ����
			rs.beforeFirst(); // ó������ 
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
	
	// �ܺο��� �ڿ�����
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
