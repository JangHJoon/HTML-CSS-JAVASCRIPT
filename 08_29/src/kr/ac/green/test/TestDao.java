package kr.ac.green.test;

import java.sql.Connection;

import javax.swing.JOptionPane;

import kr.ac.green.dao.DaoFactory;
import kr.ac.green.dao.IDao;
import kr.ac.green.dto.Dummy;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
/*
 * 단위테스트(JUnit) - Test Driven Development
 */
public class TestDao {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		DaoFactory.init("mysql");		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		dao = DaoFactory.getDao();
		con = dao.connect();
	}
	@After
	public void tearDown() throws Exception {
		dao.close(con);
	}
	
	private IDao dao;	
	private Connection con;
	@Test
	public void testInsert() {
		int result = dao.insert(con, new Dummy("a", "b"));
		
		Assert.assertEquals(1, result);
	}
	@Test
	public void testGetAll() {
		Dummy[] list = dao.getAll(con);
		Assert.assertNotNull(list);
		Assert.assertTrue(list.length != 0);
	}
	@Test
	public void testDelete() {
		int number = 
			Integer.parseInt(JOptionPane.showInputDialog("number"));
		
		int result = dao.delete(con, number);
		Assert.assertEquals(1, result);
	}
	@Test
	public void testGetByNumber() {
		Dummy d = dao.getByNumber(con, 3);
		Assert.assertEquals(3, d.getNumber());
	}
	@Test
	public void testGetCount(){
		int count = dao.getTotalCount(con);
		Assert.assertEquals(2, count);
	}
	
}



























