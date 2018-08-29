package kr.ac.green.dao;

import java.sql.Connection;

import kr.ac.green.dto.Dummy;

public class OracleDummyDao implements IDao{

	@Override
	public Connection connect() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Dummy[] getAll(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Connection con, Dummy dummy) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	@Override
	public Dummy get(Connection con, int number) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void close(Connection con) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int delete(Connection con, int number) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

}
