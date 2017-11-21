<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>SP Airlines</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body background="images\background.jpg"> <!-- https://pixabay.com/en/pyrenees-mountains-snow-zenith-351266/ -->
		<div>
			<button onclick="window.location.href='index.jsp'" type="button" class="btn btn-default" style="margin: 20px;">
				<span class="glyphicon glyphicon-arrow-left"></span> Back to homepage
			</button>
		</div>
		<div style="margin-right: 1.5%; margin-top: 50px;">
			<form action="verifyuser.jsp" class="container text-center">
				<div class="container">
					<img src="images\logo.png" alt="Login" width=200 height=200>
				</div>
				<fieldset class="container">
					<label>Username </label>
					<br>
					<input type="text" name="user">
					<br><br>
					<label>Password </label>
					<br>
					<input type="password" name="pwd">
					<br><br>
					<input class="btn btn-success" type="submit" name="btnSubmit" value="Login">
					<input class="btn btn-info" type="reset">
					<br><br>
					<%
						//String logi = request.getQueryString();
						String login = request.getParameter("login");
						if (login != null && login.equals("fail")) { 
							out.print("<div id=\"danger-alert\" class=\"alert alert-danger fade out\"><p>You have entered either the wrong username or/and password, please try again.</p></div>");
						} 
					%>
				</fieldset>
			</form>
		</div>
		<script>
			$("#danger-alert").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert").slideUp(500);
			});
		</script>
	</body>
</html>