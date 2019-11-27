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
The first part 
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
Once the login page was completed and login verification was tested to be working, I needed a main page that displayed expense items. As part of the next step, I created the Items class for interaction with expense items, the ItemsController servlet to control the flow of displaying and manipulating items, and itemsPage.jsp for all the user interactions. 
* [Items.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/model/Items.java)
	* Define the (Expense) Items class where each (Expense) object contains an ID, date, amount, description, category, type, and associated user.
* [ItemsController.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/web/ItemsController.java)
	* Servlet used to query the list of expense items associated to the user 
* [itemsPage.jsp](https://github.com/kshiftw/ExpenseRepo/blob/master/WebContent/items/itemsPage.jsp)
	* Main page that displays expense items in the table and the donut chart based on the selected date
	* Interacts with CreateItem, EditItem, and DeleteItem servlet if the associated buttons are clicked in the table
### 5. Implement servlets for Item manipulation
After being able to display the table data, I needed servlets that would take care of the create/edit/delete actions:
* [CreateItem.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/dao/CreateItem.java)
	* Called by POST request from itemsPage.jsp, this servlet is responsible for creating expense items by sending a SQL INSERT INTO query to the database with the values entered by the user
* [EditItem.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/dao/EditItem.java)
	* Called by POST request from itemsPage.jsp, this servlet is responsible for editing expense items by sending a SQL UPDATE query to the database with the updated values entered by the user
* [DeleteItem.java](https://github.com/kshiftw/ExpenseRepo/blob/master/src/dao/DeleteItem.java)
	* Called by POST request from itemsPage.jsp, this servlet is responsible for deleting expense items by sending a SQL DELETE FROM query to the database 
### 6. Add DataTables plugin
DataTables is a plugin that provides advanced interaction with tables such as column sorting and page navigation. Implementing it is very simple, requiring one line ```$('#myTable').DataTable();``` and the associated css and js files. 
### 7. Add Datepicker plugin
At first, my table displayed all the expense items that were tied to the user that was logged in. I needed a way for the user to select the month that they wanted to display and also have it filter the table data accordingly. For this, I used the Datepicker plugin which allowed me to easily insert an interactive calendar. 
### 8. Add Chart.js plugin
After being able to filter table data according to the date selected, I also wanted to display a donut chart that would show the distribution of expenses into each expense category. Because I already pulled all the relevant table data from the database, I only needed to use the search functions provided by the DataTables plugin to calculate the total expense amount for each category. These totals would be then used as data to be displayed in the donut chart, which was also an easy and intuitive plugin to use. 
### 9. Add Chart.js label plugin
I realized that although the donut chart had a functionality which displayed the dollar values, it did not have a label to identify the percentage that each category took up for each total amount. In addition to this, the user could only identify the category either by hovering over the chart or matching the legend colour with the chart. Both the percentage and category labeling was taken care of by the label plugin. 




