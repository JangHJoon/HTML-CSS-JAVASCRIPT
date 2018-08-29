package kr.ac.green.dao;

import java.sql.Connection;

import kr.ac.green.dto.Dummy;

public interface IDao {
	public Connection connect();
	public Dummy[] getAll(Connection con);
	public int insert(Connection con, Dummy dummy);
	public void close(Connection con);
	public int delete(Connection con, int number);
	public Dummy getByNumber(Connection con, int number);
	
	//paging
	public int getTotalCount(Connection con);
	public Dummy[] getList(Connection con, int pageNum, int perPage);
}
