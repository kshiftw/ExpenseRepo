package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.ConnectJDBC;
import model.Login;

/**
 * Servlet implementation class EditItem
 */
@WebServlet("/EditItem")
public class EditItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private String queryEditItem = "UPDATE items SET date = ?, amount = ?, description = ?, category = ?, type = ? WHERE itemsID = ?;";
	private String queryEditItem = "UPDATE items SET date = ?, amount = ?, description = ?, category = ?, type = ? WHERE itemsid = ?;";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemID;
		LocalDate date;
		double amount;
		String description;
		String category;
		String itemType;
		
		// getSession(false) because we don't create new session if it doesn't already exist
		HttpSession session = request.getSession(false);
		String username = ((Login) session.getAttribute("loginUser")).getUsername();
		
		// store user input for each column into variables
		itemID = Integer.parseInt(request.getParameter("ID"));
		date = LocalDate.parse(request.getParameter("Date"));
		amount = Double.parseDouble(request.getParameter("Amount"));
		description = request.getParameter("Description");
		category = request.getParameter("Category");
		itemType = request.getParameter("Type");
		
		try {
			editItem(itemID, date, amount, description, category, itemType, username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// redirect back to ItemsController after editing items
		response.sendRedirect(request.getContextPath() + "/Main"); 		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void editItem (int itemID, LocalDate date, double amount, String description, String category, String itemType, String username) throws SQLException {
		try (Connection conn = ConnectJDBC.getConnection(); PreparedStatement stmt = conn.prepareStatement(queryEditItem)){
			stmt.setObject(1, date);
			stmt.setDouble(2, amount);
			stmt.setString(3, description);
			stmt.setString(4, category);
			stmt.setString(5, itemType);
			stmt.setInt(6, itemID);
			
			stmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
