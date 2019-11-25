package dao;

import conn.ConnectJDBC;
import model.Login;
import java.sql.*;

public class LoginDaoImpl implements LoginDao {
	
	private static final String queryUserPass = "SELECT * FROM users WHERE username = ? and password = ? ;";
	
	@Override
	public boolean validate(Login login) throws ClassNotFoundException {
		boolean status = false;
		
		//Class.forName("com.mysql.cj.jdbc.Driver");
		Class.forName("org.postgresql.Driver");
		
		// use try-with-resources statement
		// https://docs.oracle.com/javase/7/docs/technotes/guides/language/try-with-resources.html
		// implements the interface java.lang.AutoCloseable, meaning that the Connection and PreparedStatement
		// objects will be closed at the end of the statement without use of "finally" block
		try (Connection conn = ConnectJDBC.getConnection(); 
				PreparedStatement prepStatement = conn.prepareStatement(queryUserPass) ){
			prepStatement.setString(1, login.getUsername());
			prepStatement.setString(2, login.getPassword());
			
			System.out.println(prepStatement);
			ResultSet rs = prepStatement.executeQuery();
			
			// status will be true if the executed prepStatement gives a ResultSet with a non-null value
			status = rs.next();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	public Connection getLoginConnection() throws ClassNotFoundException {
		//Class.forName("com.mysql.cj.jdbc.Driver");
		Class.forName("org.postgresql.Driver");
		try (Connection conn = ConnectJDBC.getConnection()){
			return conn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}

