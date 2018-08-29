package kr.ac.green.dao;

import java.sql.Connection;

import kr.ac.green.dto.Post;


public class OracleDummyDao implements IDao {

	@Override
	public Connection connect() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void close(Connection con) {
		// TODO Auto-generated method stub
	}

	@Override
	public int insert(Connection con, Post post) {
		return 0;
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalCount(Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
