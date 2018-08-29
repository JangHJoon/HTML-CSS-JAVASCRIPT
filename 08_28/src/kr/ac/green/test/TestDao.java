package kr.ac.green.test;

import static org.junit.Assert.*;

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
 * 단위테스트(JUnit) - TDD(테스트 주도 개발 방식)
 * Test Driven Development
 * 
 * 
 * 
 */

public class TestDao {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println("BeforeClass");
		DaoFactory.init("mysql");
	}
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	System.out.println("AfterClass");
	}

	
	// 이후 메소드는 반복
	
	@Before
	public void setUp() throws Exception {
		System.out.println("Before");
		dao = DaoFactory.getDao();
		con = dao.connect();
	}
	
	private IDao dao;
	private Connection con;
	
	@Test
	public void test() {
		
		int number = Integer.parseInt(JOptionPane.showInputDialog("number"));
		
		int result = dao.delete(con, number);
		
		Assert.assertEquals(1, result);
		
		
		
//		Dummy[] list = dao.getAll(con);
//		assertNotNull(list);
//		assertTrue(list.length != 0);
		
		
		
//		int result = dao.insert(con, new Dummy("a", "b"));		
//		Assert.assertEquals(1, result);
		
		
		
//		Assert.assertNotNull(con);
			
		
//		System.out.println("Test");
//		IDao dao = DaoFactory.getDao();
//		Assert.assertNotNull(dao);
	}

	@After
	public void tearDown() throws Exception {
		System.out.println("After");
		dao.close(con);
	}


}
