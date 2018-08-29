package kr.ac.green.dao;

import java.sql.Connection;

import kr.ac.green.dto.Post;


public interface IDao {
	public Connection connect();
	public void close(Connection con);
	

	public int getTotalCount(Connection con);
	public int insert(Connection con, Post post);
	public Post[] getList(Connection con, int pageNum, int perPage);
	public Post getPost(Connection con, int id);
}
