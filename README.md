# MyExpenses
Started: Nov 4  
Completed: Nov 25   
This application is my first Java application and was used as a project to help me learn the language and the various technologies that are commonly used to create web applications. Prior to this project, I covered the basics of Java by following the online CS106A course provided by Stanford: https://see.stanford.edu/Course/CS106A

## Overview & Screenshots

## Languages:
* Java
* HTML
* CSS
* Javascript (jQuery)

## Tools / Technologies / Plugins:
* Eclipse IDE for Java Developers https://www.eclipse.org/downloads/
* GitHub Desktop https://desktop.github.com/
* Heroku https://www.heroku.com/home
* PostgreSQL 12.1 https://www.enterprisedb.com/downloads/postgres-postgresql-downloads
* PostgreSQL JDBC Driver https://jdbc.postgresql.org/
* Apache Tomcat 9.0.27 https://tomcat.apache.org/download-90.cgi
	* Java Server Pages (JSP)
	* Java Servlets
* Apache Maven 3.6.2 https://maven.apache.org/index.html
* Font-Awesome https://www.bootstrapcdn.com/fontawesome/
* Bootstrap https://getbootstrap.com/
* DataTables - Table plugin for jQuery https://datatables.net/
* Bootstrap Datepicker https://bootstrap-datepicker.readthedocs.io/en/stable/
* Chart.js https://www.chartjs.org/
* Chart.js datalabels plugin https://chartjs-plugin-datalabels.netlify.com/

## References:
The following repositories contained projects that used similar technologies to the ones I was planning on using (ie. JSP, Java Servlets, JDBC, SQL DB, Heroku) so I used them as references for how I should develop my application:
* https://github.com/RameshMF/todo-application-jsp-servlet-jdbc-mysql
* https://github.com/laniywh/simple-web-app

## Step-by-step summary
### 1. Define Goals
Defined goal of the application: "To create an application that allows users to track expenses and easily visualize what categories their expenses fall into." My method of approach was to learn as I came across things I needed.
### 2. Tutorials
Read through the various tutorials provided by Tutorialspoint that I needed before starting my application:
* Java Servlets: https://www.tutorialspoint.com/servlets/index.htm 
* Java Database Connectivity (JDBC): https://www.tutorialspoint.com/jdbc/index.htm  
* Java Server Pages (JSP): https://www.tutorialspoint.com/jsp/index.htm  
### 3. Implement Login Page
* [Login.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/model/Login.java)
	* Define the Login class where each object contains a username and password
* [LoginController.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/web/LoginController.java)
	* Servlet used to authenticate the user's credentials and control where the browser is redirected
* [LoginDao.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/dao/LoginDao.java)
	* Interface for accessing the Login object
* [LoginDaoImpl.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/dao/LoginDaoImpl.java)
	* Implementation of the Dao interface. Contains a validate() method that connects to the PostgreSQL database via JDBC to query and validate whether the given username/password combination exists in the database. 
* [login.jsp](https://github.com/kshiftw/ExpenseRepo/blob/master/WebContent/login/login.jsp)
	* Login form page that sends POST request to LoginController upon clicking login button
* [ConnectJDBC.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/conn/ConnectJDBC.java)
	* Using the JDBC driver to connect to the PostgreSQL database
### 4. Implement Main Page
* [Items.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/model/Items.java)
	* Define the (Expense) Items class where each (Expense) object contains an ID, date, amount, description, category, type, and associated user.
* [ItemsController.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/web/ItemsController.java)
	* Servlet used to query the list of expense items associated to the user 
* [itemsPage.jsp](https://github.com/kshiftw/ExpenseRepo/blob/master/WebContent/items/itemsPage.jsp)
	* 
	




