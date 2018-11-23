package jsp.util;

import java.sql.*;
import javax.naming.NamingException;

public class DBConnection {
	public static Connection getConnection() throws SQLException, NamingException,
		ClassNotFoundException{
		String DB_NAME = "market";
		String USER = "team1";
		String PASSWORD = "comp322004";
		
		Class.forName("com.mysql.jdbc.Driver");
		String myUrl = "jdbc:mysql://localhost/" + DB_NAME;
		Connection conn = DriverManager.getConnection(myUrl, USER, PASSWORD);
		
		return conn; 
	}
}
