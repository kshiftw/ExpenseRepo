<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyExpenses</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Bubblegum+Sans" />

<style type="text/css">
    body {
        color: #404E67;
        background: #F5F7FA;
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	}
	
	#heading {
		background-color: #76ccc0;	
	}
	
	#MyBudget {
		font-size: 45px;
		font-family: 'Bubblegum Sans', Helvetica, sans-serif;
	}	
</style>	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
$(document).ready(function(){
	document.getElementById("username").focus();	
});

</script>

</head>
<body>
	<div class="jumbotron text-center" id="heading">
		<h1 id="MyBudget">MyExpenses</h1>
		<h5>Stay on top of your money by tracking your monthly and annual expenses.</h5>
	</div>	
	
	<div class ="container">
		<%-- POST request to LoginController for username/password validation --%>
		<form action="<%=request.getContextPath()%>/Login" method="post">			
			<div class="row">
				<div class="col-4 offset-md-4">
					<p>${NOTIFICATION}</p>
				</div>			
			</div>			
			<div class="row">
				<div class="col">
				</div>
				<div class="col-4">
					<div class="form-group">
						<input type="text" class="form-control" id="username" placeholder="User Name" name="username" required>
					</div>
				</div>
				<div class="col">
				</div>
			</div>			
			<div class="row">
				<div class="col">
				</div>
				<div class="col-4">
					<div class="form-group">
						<input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
					</div>
				</div>
				<div class="col">
				</div>
			</div>
			
			<div class="row">
				<div class="col-4 offset-md-4">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>				
			</div>
		</form>	
	</div>
</body>
</html>