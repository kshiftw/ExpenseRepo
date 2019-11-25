package conn;

import java.sql.*;

public class ConnectJDBC {
	// JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	   //static final String DB_URL = "jdbc:mysql://localhost/EMP";
	   //static final String DB_URL = "jdbc:postgresql://localhost/mydb";
	   static final String DB_URL = "jdbc:postgresql://ec2-174-129-203-86.compute-1.amazonaws.com/d8tk3bjc3jhb59?sslmode=require";
	   
	   //  Database credentials
	   //static final String USER = "root";
	   //static final String PASS = "root";
	   
	   static final String USER = "yldxbxoycigfia";
	   static final String PASS = "d87496a9a1ef2926ecedaea531e7ddc4a9a32a7e91be525b18d0d211dcae6784";
	   
	   public static Connection getConnection() {
		   Connection conn = null;
		   
		   try {
			   // Class.forName(JDBC_DRIVER);
			   Class.forName("org.postgresql.Driver");
			   // Connect to DB
			   conn = DriverManager.getConnection(DB_URL, USER, PASS);
		   } catch (SQLException e) {
			   e.printStackTrace();
		   } catch (ClassNotFoundException e) {
			   e.printStackTrace();
		   } 
		   return conn;
	   }
}
