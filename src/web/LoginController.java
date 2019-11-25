package web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDaoImpl;
import model.Login;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDaoImpl loginDao;
	
	public void init() {
		loginDao = new LoginDaoImpl();
	}	       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("login/login.jsp");
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login/login.jsp");
		dispatcher.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		// if POST command received, authenticate the username / password
		authenticate(request, response);
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get the username / password strings provided by user		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// create new Login object for validation
		Login login = new Login();
		login.setUsername(username);
		login.setPassword(password);
		
		try {
			// if username / password combo exists in database...
			if (loginDao.validate(login)) {
				// move user to items page
				System.out.println("Connection Success");
				HttpSession session = request.getSession();
				session.setAttribute("NOTIFICATION", "");
				session.setAttribute("loginUser", login);
				
				//response.sendRedirect("/BudgetTracker/Main");
				response.sendRedirect("/MyExpenses/Main");
			} else {
				// Display login unsuccessful notification
				request.getSession().setAttribute("NOTIFICATION", "Login Unsuccessful. Please try again.");
				//response.sendRedirect("login/login.jsp");
				RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login/login.jsp");
				dispatcher.forward(request, response);	
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
