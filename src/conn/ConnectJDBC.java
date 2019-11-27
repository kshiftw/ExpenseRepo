package conn;

import java.sql.*;

public class ConnectJDBC {	     
	   //static final String DB_URL = "jdbc:postgresql://localhost/mydb";
	   
	   // Heroku PostgreSQL database url
	   static final String DB_URL = "jdbc:postgresql://ec2-174-129-203-86.compute-1.amazonaws.com/d8tk3bjc3jhb59?sslmode=require";
	   
	   //  Local Database credentials
	   //static final String USER = "root";
	   //static final String PASS = "root";
	   
	   // Heroku PostgreSQL credentials
	   static final String USER = "yldxbxoycigfia";
	   static final String PASS = "d87496a9a1ef2926ecedaea531e7ddc4a9a32a7e91be525b18d0d211dcae6784";
	   
	   public static Connection getConnection() {
		   Connection conn = null;		   
		   try {			  
			   Class.forName("org.postgresql.Driver");
			   
			   // Pass the url, username, and password to connect to the DB
			   conn = DriverManager.getConnection(DB_URL, USER, PASS);
		   } catch (SQLException e) {
			   e.printStackTrace();
		   } catch (ClassNotFoundException e) {
			   e.printStackTrace();
		   } 
		   // if connection successful, return the connection object
		   return conn;
	   }
}
