package kr.ac.green.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Vector;

import kr.ac.green.dto.Post;


public class MySqlDummyDao implements IDao {
	
	private static final MySqlDummyDao instance = 
		new MySqlDummyDao();
	
	private MySqlDummyDao(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}		
	}
	
	static MySqlDummyDao getInstance() {
		return instance;
	}
	
	@Override
	public Post getPost(Connection con, int id) {
		
		String sql = "SELECT * FROM posts WHERE p_id = ?";
		PreparedStatement pStmt = null;
		ResultSet rs = null;		
		Post post = null;
		
		try {
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, id);
			rs = pStmt.executeQuery();
			if(rs.next()){
			//int p_id, String p_ip, String p_title, String p_content,String p_date
				post = new Post(rs.getInt("p_id"), rs.getString("p_ip"), rs.getString("p_title"), rs.getString("p_content"), rs.getString("p_date"));
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(rs);
			close(pStmt);
		}
		
		return post;
	}

	@Override
	public Post[] getList(Connection con, int pageNum, int perPage){
		String sql = "SELECT * FROM posts ORDER BY p_id DESC LIMIT ?, ?";
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Post[] list = null;
		
		try{
			pStmt = con.prepareStatement(sql);			
			pStmt.setInt(1, (pageNum-1)*perPage);
			pStmt.setInt(2, perPage);
			rs = pStmt.executeQuery();
			
			Vector<Post> vec = new Vector<Post>();
			while(rs.next()){ //int p_id, String p_ip, String p_title, String p_date
				vec.add(new Post(rs.getInt("p_id"), rs.getString("p_ip"), rs.getString("p_title"), rs.getTimestamp("p_date").toString()));				
			}
			list = vec.toArray(new Post[0]);
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close(rs);
			close(pStmt);
		}		
		return list;
			
	}
	
	@Override
	public int insert(Connection con, Post post) {
		
		String sql = "INSERT INTO posts (p_title, p_content, p_password, p_ip, p_date) VALUE (?,?,?,?,now())";
		
		PreparedStatement pStmt = null;
		int resultRow = 0;
		try{
			pStmt = con.prepareStatement(sql);
			
			pStmt.setString(1, post.getP_title());
			pStmt.setString(2, post.getP_content());
			pStmt.setString(3, post.getP_password());
			pStmt.setString(4, post.getP_ip());
			
			resultRow = pStmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(pStmt);
		}
		
		return resultRow;
	}

	@Override
	public Connection connect() {
		Connection con = null;
		// alt + shift + z -> 아래방향키
		try {
			con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/test", 
				"root", 
				"1234"
			);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return con;
	}

	
	
	
	
	@Override
	public int getTotalCount(Connection con) {
		String sql = "SELECT COUNT(*) totalCount FROM dummy";
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		int rowCount = 0;
		
		try{
			
			pStmt = con.prepareStatement(sql);
			rs = pStmt.executeQuery();
			
			if(rs.next()){
//				rowCount = rs.getInt(1);
				rowCount = rs.getInt("totalCount");
			
			}
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pStmt);
		}
		
		return rowCount;
	}
	





	private void close(ResultSet rs) {
		try {
			rs.close();
		} catch(Exception e) {}
	}
	
	private void close(Statement stmt) {
		try {
			stmt.close();
		} catch(Exception e) {}
	}
	@Override
	public void close(Connection con) {
		try {
			con.close();
		} catch(Exception e) {}
		
	}
	
}













