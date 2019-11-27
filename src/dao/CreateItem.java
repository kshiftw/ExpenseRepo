package dao;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.ConnectJDBC;
import model.Login;

@WebServlet("/CreateItem")
public class CreateItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*private String queryCreateItem = "INSERT INTO items (date, amount, description, category, type, user) values "
			+ "(?, ?, ?, ?, ?, ?) ;"; */
	private String queryCreateItem = "INSERT INTO items (date, amount, description, category, type, linkuser) values "
			+ "(?, ?, ?, ?, ?, ?) ;";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDate date;
		double amount;
		String description;
		String category;
		String itemType;
		
		// getSession(false) because we don't create new session if it doesn't already exist
		HttpSession session = request.getSession(false);
		String username = ((Login) session.getAttribute("loginUser")).getUsername();
		
		// store user input for each column into variables
		date = LocalDate.parse(request.getParameter("Date"));
		amount = Double.parseDouble(request.getParameter("Amount"));
		description = request.getParameter("Description");
		category = request.getParameter("Category");
		itemType = request.getParameter("Type");
		
		try {
			createItem(date, amount, description, category, itemType, username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// redirect back to ItemsController after creation 
		response.sendRedirect(request.getContextPath() + "/Main"); 		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	// function createItem used to send Insert query to database
	private void createItem (LocalDate date, double amount, String description, String category, String itemType, String username) throws SQLException{
		try (Connection conn = ConnectJDBC.getConnection(); PreparedStatement stmt = conn.prepareStatement(queryCreateItem)){
			stmt.setObject(1, date);
			stmt.setDouble(2, amount);
			stmt.setString(3, description);
			stmt.setString(4, category);
			stmt.setString(5, itemType);
			stmt.setString(6, username);
			
			stmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
