package kr.ac.green.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import kr.ac.green.dto.Dummy;

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
	
	

	@Override
	public Dummy[] getList(Connection con, int pageNum, int perPage) {
		String sql = "SELECT * FROM dummy ORDER BY number DESC LIMIT ?, ?";
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		Dummy[] list = null;
		
		try{
			pStmt = con.prepareStatement(sql);			
			pStmt.setInt(1, (pageNum-1)*perPage);
			pStmt.setInt(2, perPage);
			
			rs = pStmt.executeQuery();
			
			Vector<Dummy> vec = new Vector<Dummy>();
			while(rs.next()){
				vec.add(getDummy(rs));
			}
			list = vec.toArray(new Dummy[0]);
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close(rs);
			close(pStmt);
		}
		
		return list;
	}

	@Override
	public Dummy[] getAll(Connection con) {
		String sql = "SELECT * FROM dummy ORDER BY number DESC";
		Dummy[] list = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		
		try {
			pStmt = con.prepareStatement(sql);
			rs = pStmt.executeQuery();
			rs.last();
			int count = rs.getRow();
			list = new Dummy[count];
			rs.beforeFirst();
			int idx = 0;
			while(rs.next()) {
				list[idx++] = getDummy(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pStmt);
		}
		return list;
	}

	@Override
	public int insert(Connection con, Dummy dummy) {
		
		String sql = 
			"INSERT INTO dummy (first, second) VALUES (?, ?)";
		int result = 0;		
		PreparedStatement pStmt = null;
		
		try {
			pStmt = con.prepareStatement(sql);
			pStmt.setString(1, dummy.getFirst());
			pStmt.setString(2, dummy.getSecond());
			result = pStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pStmt);
		}
		return result;
	}
	@Override
	public int delete(Connection con, int number) {
		String sql = "DELETE FROM dummy WHERE number = ?";
		PreparedStatement pStmt = null;
		int result = 0;
		try {
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, number);
			result = pStmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pStmt);
		}		
		return result;
	}
	
	
	
	

	@Override
	public Dummy getByNumber(Connection con, int number) {
		String sql = "SELECT * FROM dummy WHERE number = ?";
		Dummy dummy = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		
		try {
			pStmt = con.prepareStatement(sql);
			pStmt.setInt(1, number);
			rs = pStmt.executeQuery();
			if(rs.next()) {
				dummy = getDummy(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dummy;
	}
	// bind DTO
	private Dummy getDummy(ResultSet rs) throws SQLException {
		return new Dummy(
			rs.getInt("number"),
			rs.getString("first"),
			rs.getString("second")
		);
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













