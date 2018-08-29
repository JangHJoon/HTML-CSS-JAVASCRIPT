package kr.ac.green.dao;

import java.sql.Connection;

import kr.ac.green.dto.Dummy;

public class OracleDummyDao implements IDao {
	OracleDummyDao() {}
	@Override
	public Connection connect() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public int getTotalCount(Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Dummy[] getList(Connection con, int pageNum, int perPage) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Dummy getByNumber(Connection con, int number) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int delete(Connection con, int number) {
		// TODO Auto-generated method stub
		return 0;
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
	public void close(Connection con) {
		// TODO Auto-generated method stub
		
	}
	
}
