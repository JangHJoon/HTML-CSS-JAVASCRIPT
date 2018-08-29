package kr.ac.green.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;





import java.sql.Statement;

import kr.ac.green.dto.Dummy;

public class MySqlDummyDao implements IDao {

	private static final MySqlDummyDao instance = new MySqlDummyDao();
	
	private MySqlDummyDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}	
	
	static MySqlDummyDao GetInstance(){
		return instance;
	}
	
	@Override
	public Connection connect() {
		Connection con = null;
		
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
	public Dummy[] getAll(Connection con) {
		String sql = "SELECT * FROM dummy";
		Dummy[] list = null;
		PreparedStatement pStmt = null;
		ResultSet rs =  null;
		
		try{
			
			pStmt = con.prepareStatement(sql);
			rs = pStmt.executeQuery();
			
			rs.last();
			int row = rs.getRow();
			list = new Dummy[row];
			rs.beforeFirst();
			int idx = 0;
			while(rs.next()){
				list[idx++] = new Dummy(
					rs.getInt("number"),
					rs.getString("first"),
					rs.getString("second")
				);
			
				
			}
			
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(pStmt);
		}
		
		return list;
	}
	
	

	@Override
	public Dummy get(Connection con, int number) {
		
		String sql = "SELECT * FROM dummy WHERE number = ?";
		PreparedStatement pStmt = null;
		Dummy dummy = null;
		try{
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, number);
			ResultSet rs = pStmt.executeQuery();
			
			dummy = new Dummy(rs.getString("first"), rs.getString("second"));
						
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
		return dummy;
	}

	@Override
	public int delete(Connection con, int number) {
		String sql = "DELETE FROM dummy WHERE number = ?";
		
		PreparedStatement pStmt = null;
		int result = 0;
		try{
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, number);
			result = pStmt.executeUpdate();
		} catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Connection con, Dummy dummy) {

		String sql = "INSERT INTO dummy (first, second) VALUES ";
		sql += "(?,?)";
		int result = 0;
		PreparedStatement pStmt = null;
		
		try{
			pStmt = con.prepareStatement(sql);
			pStmt.setString(1, dummy.getFirst());
			pStmt.setString(2, dummy.getSecond());
			result = pStmt.executeUpdate();
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(pStmt);
		}
		
		return result;
	}

	private void close(Statement stmt){
		try{
			stmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	@Override
	public void close(Connection con) {
		try{
			con.close();
		} catch(Exception e){
			
		}
		
	}
	
	
	

}
