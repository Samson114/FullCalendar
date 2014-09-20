package dor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBlink {
	public Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url = "jdbc:mysql://172.18.85.77:3306/test";
		String user = "root"; 
		String password = "root"; 
		conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
		//oracl
/*		public Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
			Connection conn = null;
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "GC";
			String password = "gaochen";
			conn = DriverManager.getConnection(url, user, password);
			return conn;
		}*/
}
