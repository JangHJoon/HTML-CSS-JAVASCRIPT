package kr.ac.green.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kr.ac.green.dto.Student;


public class StudentDao {

	
	private static final StudentDao instance = new StudentDao();
	
	private StudentDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}		
	}	
	
	public static StudentDao GetInstance(){
		return instance;
	}
	
	
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


	public Student[] getAll(Connection con) {
		
		String sql = "SELECT * FROM student";
		
		Student[] list = null;
		PreparedStatement pStmt = null;
		ResultSet rs =  null;
		
		try{
			pStmt = con.prepareStatement(sql);
			rs = pStmt.executeQuery();
			
			rs.last();
			int row = rs.getRow();
			list = new Student[row];
			rs.beforeFirst();
			int idx = 0;
			while(rs.next()){
				list[idx++] = new Student(
						String.valueOf(rs.getInt("s_id")),
						rs.getString("s_name"),
						rs.getString("s_tel"),
						rs.getInt("s_grade"),
						rs.getString("s_class")
					);				
			}			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(rs);
			close(pStmt);
		}
		
		return list;
	}
	
	

	
	public Student searchById(Connection con, int id){		
		
		String sql = "SELECT * FROM students WHERE s_id = ?";
		
		Student student = null;
		PreparedStatement pStmt = null;
		ResultSet rs =  null;
		
		try{
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, id);
			rs = pStmt.executeQuery();
			
			if(rs.next()){
				student = new Student(
						String.valueOf(rs.getInt("s_id")),
						rs.getString("s_name"),
						rs.getString("s_tel"),
						rs.getInt("s_grade"),
						rs.getString("s_class")
					);		
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(rs);
			close(pStmt);
		}
		
		return student;		
	}

	public Student[] searchByClass(Connection con, String clazz){		
		
		String sql = "SELECT * FROM students WHERE s_class = ?";
		
		Student[] list = null;
		PreparedStatement pStmt = null;
		ResultSet rs =  null;
		
		try{
			pStmt = con.prepareStatement(sql);
			pStmt.setString(1, clazz);
			rs = pStmt.executeQuery();
			
			rs.last();
			int row = rs.getRow();
			list = new Student[row];
			rs.beforeFirst();
			int idx = 0;
			while(rs.next()){
				list[idx++] = new Student(
						String.valueOf(rs.getInt("s_id")),
						rs.getString("s_name"),
						
						rs.getString("s_tel"),
						rs.getInt("s_grade"),
						rs.getString("s_class")
					);				
			}			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(rs);
			close(pStmt);
		}
		
		return list;		
	}

	public Student[] searchByName(Connection con, String name){		
		
		String sql = "SELECT * FROM students WHERE s_name = %?%";
		
		Student[] list = null;
		PreparedStatement pStmt = null;
		ResultSet rs =  null;
		
		try{
			pStmt = con.prepareStatement(sql);
			pStmt.setString(1, name);
			rs = pStmt.executeQuery();
			
			rs.last();
			int row = rs.getRow();
			list = new Student[row];
			rs.beforeFirst();
			int idx = 0;
			while(rs.next()){
				list[idx++] = new Student(
						String.valueOf(rs.getInt("s_id")),
						rs.getString("s_name"),
						rs.getString("s_tel"),
						rs.getInt("s_grade"),
						rs.getString("s_class")
					);				
			}			
			
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(rs);
			close(pStmt);
		}
		
		return list;		
	}
	
	public int update(Connection con, int id, Student s){
		
		String sql = "UPDATE students SET "
				+ "s_name = ?, s_tel = ?, s_grade = ?, s_class = ? "
				+ "WHERE s_id = ?";
		
		PreparedStatement pStmt = null;
		int result = 0;
		
		try{
			pStmt = con.prepareStatement(sql);
			pStmt.setString(1, s.getName());
			pStmt.setString(2, s.getTel());
			pStmt.setInt(3, s.getGrade());
			pStmt.setString(4, s.getClazz());
			pStmt.setInt(5, id);
			result = pStmt.executeUpdate();
		
		} catch(SQLException e){
			e.printStackTrace();
		}
		return result;
		
	}

	public int delete(Connection con, int id) {
		
		String sql = "DELETE FROM students WHERE s_id = ?";
		
		PreparedStatement pStmt = null;
		int result = 0;
		
		try{
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, id);
			result = pStmt.executeUpdate();
		
		} catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}


	public int insert(Connection con, Student s) {

		String sql = "INSERT INTO students (s_name, s_tel, s_grade, s_class) VALUES ";
		sql += "(?, ?, ?, ?)";
		
		PreparedStatement pStmt = null;
		int result = 0;
		
		try{
			pStmt = con.prepareStatement(sql);
			pStmt.setString(1, s.getName());
			pStmt.setString(2, s.getTel());
			pStmt.setInt(3, s.getGrade());
			pStmt.setString(4, s.getClazz());
			result = pStmt.executeUpdate();
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close(pStmt);
		}
		
		return result;
	}
	
	
	
	private void close(ResultSet rs){
		try{
			if(rs != null)rs.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	private void close(Statement stmt){
		try{
			stmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}

	public void close(Connection con) {
		try{
			con.close();
		} catch(Exception e){
			
		}
		
	}
}
