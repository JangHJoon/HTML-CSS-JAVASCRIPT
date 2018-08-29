package kr.ac.green.dao;

public class DaoFactory {
	private static IDao dao;
	public static void init(String db) {
		if(db.equals("mysql")) {
			dao = MySqlDummyDao.getInstance();
		} else {
			
		}
	}
	
	public static IDao getDao() {
		return dao;
	}
}	

