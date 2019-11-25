package web;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.ConnectJDBC;
import model.Items;
import model.Login;

/**
 * Servlet implementation class ItemsController
 */
@WebServlet("/Main")
public class ItemsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private String queryItems = "SELECT * FROM items WHERE items.user = ?;";
	private String queryItems = "SELECT * FROM items WHERE items.linkuser = ?;";
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Items> list = null;		
				
		// false - don't create new session if it doesn't exist
		HttpSession session = request.getSession(false);		
		String username = ((Login) session.getAttribute("loginUser")).getUsername();
						
		try {
			list = queryItems(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		request.setAttribute("itemsList", list);
		
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/items/itemsPage.jsp");
		dispatcher.forward(request, response);	
		
		//String redirect = response.encodeRedirectURL(request.getContextPath() + "/items/itemsPage.jsp");
		//response.sendRedirect(redirect);				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private List<Items> queryItems(String username) throws SQLException {
		List<Items> list = new ArrayList<Items>();		
		
		try (Connection conn = ConnectJDBC.getConnection(); PreparedStatement stmt = conn.prepareStatement(queryItems)){

			stmt.setString(1, username);
			System.out.println(stmt);
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				//int itemID = rs.getInt("itemsID");
				int itemID = rs.getInt("itemsid");
				LocalDate date = rs.getObject("date", LocalDate.class);
				double amount = rs.getDouble("amount");
				String description = rs.getString("description");
				String category = rs.getString("category");
				String type = rs.getString("type");
				Items item = new Items(itemID, date, amount, description, category, type);
				list.add(item);							
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
