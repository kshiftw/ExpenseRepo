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
		// Upon GET request, forward it to the login.jsp file to read user input for login verification
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login/login.jsp");
		dispatcher.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		// if POST request is received, authenticate the username / password
		authenticate(request, response);
	}
	
	/* 
	 * Purpose: authenticate/validate the user credentials provided by the user upon POST request (ie. user clicks "login" button)
	 * If the username/password combination exists in the database, redirect the browser to the main expenses page
	 * If the credentials do not exist, display an error notification and ask the user to try again	
	*/
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
				System.out.println("Connection Success");
				HttpSession session = request.getSession();
				session.setAttribute("NOTIFICATION", "");
				
				// store the user login to use as reference for which items to display later
				session.setAttribute("loginUser", login);				
				
				// redirect the browser to the main expenses page
				response.sendRedirect("/MyExpenses/Main");
			} else {
				// Display login unsuccessful notification
				request.getSession().setAttribute("NOTIFICATION", "Login Unsuccessful. Please try again. To try out the application, use the username: \"root\" & password: \"root\"");
				
				// forward back to login.jsp and wait for the next request
				RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login/login.jsp");
				dispatcher.forward(request, response);	
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
