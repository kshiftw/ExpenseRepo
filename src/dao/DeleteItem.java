package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.ConnectJDBC;

/**
 * Servlet implementation class DeleteItem
 */
@WebServlet("/DeleteItem")
public class DeleteItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private String queryDeleteItem = "DELETE FROM items WHERE itemsID = ?; ";
	private String queryDeleteItem = "DELETE FROM items WHERE itemsid = ?; ";
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// convert from string to integer
		int id = Integer.parseInt(request.getParameter("ID"));
	
		try {
			deleteItem(id);		
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		// redirect back to ItemsController after deletion
		response.sendRedirect(request.getContextPath() + "/Main");		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void deleteItem (int id) throws SQLException {
		try (Connection conn = ConnectJDBC.getConnection(); PreparedStatement stmt = conn.prepareStatement(queryDeleteItem)){
			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

}
