package db;
import java.sql.*;

public class db_connect {
	public static Connection getConnection() {
		Connection connection = null;
	
		try {
		 	Class.forName("org.postgresql.Driver");
		 	connection = DriverManager.getConnection(
				 "jdbc:postgresql://127.0.0.1:5432/web_DB", "postgres", "admin");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
