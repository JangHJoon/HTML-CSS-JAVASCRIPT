package kr.ac.green.test;



import java.sql.Connection;

import kr.ac.green.dao.StudentDao;
import kr.ac.green.dto.Student;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class studentTest {

	private static StudentDao dao;
	private Connection con;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		dao = StudentDao.GetInstance();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		con = dao.connect();
	}

	@After
	public void tearDown() throws Exception {
		dao.close(con);
	}
	
	@Test
	public void connectionTest(){
		Assert.assertNotNull(con);
	}
	
	@Test
	public void getByIdTest(){
		Student s = dao.searchById(con, 1);
		Assert.assertNotNull(s);
	}
	@Test
	public void getByNameTest(){
		Student[] s = dao.searchByName(con, "j");
		Assert.assertNotNull(s);
	}
	
	@Test
	public void insertTest() {
		int result = dao.insert(con, new Student("jang", "2660", 29, "501"));
		Assert.assertEquals(1, result);
	}
	
	@Test
	public void updateTest(){
		int result = dao.update(con, 1, new Student("hi", "911", 55, "502"));
		
		Assert.assertEquals(1, result);
	}
	
	@Test
	public void deleteTest(){
		int result = dao.delete(con, 2);
		Assert.assertEquals(1, result);
	}
	

}
