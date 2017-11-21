<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	.affix {top: 0; width: 100%;}
	.affix + .container-fluid {padding-top: 50px;}
	.nav-wrapper {min-height: 49px;}
	#section1 {padding-top: 50px;padding-bottom: 50px;padding-left: 50px; min-height: 500px; background-color: #EFEFEF;}
	
	.desc {margin-left: 50px; margin-right: 20px;}
	.text {font-size: 20px}
	#wallpaper1 {height: 500px; width: 100%;}
	#wallpaper2 {height: 500px; width: 100%;}
	#wallpaper3 {height: 500px; width: 100%;}
	.advanced-search {width:1000px;}
	.form-control {width: 300px;}
</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.html" %>
<!-- Affixed navigation bar -->
<div class="nav-wrapper">
	<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="497" style="margin:auto;">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp" style="font-size: 30px;"><b>SP Airlines</b></a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="index.jsp#section1">Definition</a></li>
			<li><a href="index.jsp#section2">History</a></li>
			<li><a href="index.jsp#section3">Engine</a></li>
			<li><a href="index.jsp#section4">Creed</a></li>
			<li><a href="index.jsp#section5">Advanced Search</a></li>
			<li><a href="#">Booking</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
		<%
			boolean auth = false;
			// Show username on page
			if (session.getAttribute("userid") == null||session.getAttribute("userid").equals("")) {
				out.print("<li><a href=\"signup.jsp\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li><li><a href=\"login.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>");
			} else if (session.getAttribute("role").equals("adm")){
				out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Welcome, " + session.getAttribute("userid") + "!</a></li><li><a href=\"admin.jsp\"><span class=\"glyphicon glyphicon-king\"></span> Admin</a></li><li><a href=\"logout.jsp\"><span class=\"glyphicon glyphicon-log-out\"></span> Logout</a></li>");
				auth = true;
			}else{
				out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Welcome, " + session.getAttribute("userid") + "!</a></li><li><a href=\"review.jsp\"><span class=\"glyphicon glyphicon-heart-empty\"></span> Write a Review!</a></li><li><a href=\"logout.jsp\"><span class=\"glyphicon glyphicon-log-out\"></span> Logout</a></li>");
				
			}
		%>
			<li>
				<form class="navbar-form navbar-left" action="search.jsp">
					<div class="form-group">
						
						<input type="text" class="form-control" placeholder="Search" name="search" required>
					</div>
					<button class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
				</form>
			</li>
		</ul>
	</nav>
</div>
<section id="section1" class="container-fluid">
<%

String type="";
String type1="";

int k=0;

type=(String)session.getAttribute("type1");
try{
type1=(String)session.getAttribute("type2");
if (type1.equals("")||type1==null){}else{
k=2;}
}catch(Exception e){}

String[] values = type.split("%");
String[] values1=new String[3];
if(k==2){
	try {
		values1 = type1.split("%");
		session.setAttribute("type2", values1);
		
	} catch(Exception e) {
		System.out.println(e);
	}
}
session.setAttribute("type1", values);

%>
<form action="DisplayFlightServlet"> <%
try{
	int l=Integer.parseInt(values[2]);
	int i=0;
	if(k==2){
		out.println("<h1>Return Flight</h1>");
		out.print("<input type=\"hidden\" name=\"type21\" value="+values[0]+">");
		out.print("<input type=\"hidden\" name=\"type22\" value="+values1[0]+">");
	}else{
		out.println("<h1>One-Way Flight</h1>");
		out.print("<input type=\"hidden\" name=\"type21\" value="+values[0]+">");
	}
	out.println("<h3>"+l+" Passengers</h3>\n");
	while (i<l){
		%>

		 First name:<br>
		  <input type="text" name="firstname" placeholder="First Name" class="form-control" required><br>
		  Last name:<br>
		  <input type="text" name="lastname" placeholder="Last Name" class="form-control" required><br>
		<%
		i++;
	}
	
	
	
}catch(Exception e){}


%>
<input type="email" name="email" placeholder="Email" class="form-control"><br>
<div class="form-group">
<input type="number" name="card" placeholder="Credit card number" class="form-control">
</div>
<input type="submit" value="Submit" class="btn btn-success">
</form>
</section>
<%@ include file = "footer.html" %>
</body>
</html>