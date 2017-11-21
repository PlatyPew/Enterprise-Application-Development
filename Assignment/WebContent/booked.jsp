<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="booking.*"
    import="passenger.*"
    import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>SP Airlines</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		.affix {top: 0; width: 100%;}
		.affix + .container-fluid {padding-top: 50px;}
		.nav-wrapper {min-height: 49px;}
		#section1 {padding-top: 20px; padding-bottom: 50px; min-height: 200px; background-color: #EFEFEF;}
		#section2 {padding-top: 20px; padding-bottom: 50px; min-height: 200px; color: white; background-color: #00243d;}
		#section3 {padding-top: 100px; min-height: 500px; background-color: #EFEFEF;}
		#section4 {padding-top: 100px; min-height: 500px; color: white; background-color: #00243d;}
		#section5 {padding-top: 70px; min-height: 1000px; background-color: #EFEFEF;}
		.desc {margin-left: 50px; margin-right: 20px;}
		.text {font-size: 20px}
		#wallpaper1 {height: 500px; width: 100%;}
		#wallpaper2 {height: 500px; width: 100%;}
		#wallpaper3 {height: 500px; width: 100%;}
		.advanced-search {width:1000px;}
	</style>	
	<script>
		//Smooth Scrolling
		$.fn.scrollBottom = function() { 
			return $(document).height() - this.scrollTop() - this.height(); 
		};
		window.onscroll = function() {myFunction()};
		$(document).ready(function(){
			$("a").on('click', function(event) {
				if (this.hash !== "") {
					event.preventDefault();
					var hash = this.hash;
					$('html, body').animate({
						scrollTop: $(hash).offset().top
					}, 400, function(){
						window.location.hash = hash;
					});
				}
			});
		});
	</script>
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
<%
ArrayList<BookingFlightSummary> summary = (ArrayList<BookingFlightSummary>)session.getAttribute("summary");
String cabinClass = "", email = "", bookerID = "", depart = "", arrive = "", originap = "", destap = "", country = "", model = "", flightNumber = "";
int creditCard = 0, numPassengers = 0;
float first = 0, buss = 0 , econ = 0, flightTime = 0, bookingID = 0, cost = 0, price = 0;
if (summary != null) {
	bookingID = summary.get(0).getBOOKINGID();
	model = summary.get(0).getMODEL();
	flightNumber = summary.get(0).getFLIGHTNUMBER();
	cabinClass = summary.get(0).getCABINCLASS();
	email = summary.get(0).getEMAIL() ;
	first = summary.get(0).getFIRST();
	buss = summary.get(0).getBUSS();
	econ = summary.get(0).getECON();
	bookerID = summary.get(0).getBOOKERID();
	creditCard = summary.get(0).getCREDITCARD();
	numPassengers = summary.get(0).getNUMPASSENGERS();
	flightTime = summary.get(0).getFLIGHTTIME();
	depart = summary.get(0).getDEPART();
	arrive = summary.get(0).getARRIVE();
	originap = summary.get(0).getORIGINAP();
	destap = summary.get(0).getDESTAP();
	country = summary.get(0).getCOUNTRY();
	if (cabinClass.equals("first")) {
		cost = summary.size() * first;
		price = first;
	} else if (cabinClass.equals("bus")) {
		cost = summary.size() * buss;
		price = buss;
	} else if (cabinClass.equals("econ")) {
		cost = summary.size() * econ;
		price = econ;
	}
	
	
}
%>
<section id="section1">
<h1 style="margin-left:20px">Flight 1</h1>
<table class="table table-striped">
	<tr>
		<th>Country</th>
		<th>Model</th>
		<th>Flight Number</th>
		<th>Origin Airport</th>
		<th>Destination Airport</th>
		<th>Departure Time</th>
		<th>Arrival Time</th>
		<th>Flight Duration</th>
	</tr>
	<tr>
		<td><%= country %></td>
		<td><%= model %></td>
		<td><%= flightNumber %></td>
		<td><%= originap %></td>
		<td><%= destap %></td>
		<td><%= depart %></td>
		<td><%= arrive %></td>
		<td><%= String.format("%.2f", flightTime) %></td>
		
	</tr>
</table>
<br><br>
<table class="table table-striped">
	<tr>
		<th>Cabin Class</th>
		<th>Number of Passengers booked</th>
		<th>Email</th>
		<th>Credit Card Number</th>
		<th>Booked by</th>
		<th>Total Cost</th>
	</tr>
	<tr>
		<td><%= cabinClass %></td>
		<td><%= numPassengers %></td>
		<td><%= email %></td>
		<td><%= creditCard %></td>
		<td><%= bookerID %></td>
		<td><%= cost %></td>
	</tr>
</table>
<br><br>
<table class="table table-striped">
	<tr>
		<th>Name</th>
		<th>Cost per person</th>
	</tr>
	<%
		for (BookingFlightSummary i : summary) {
	%>
			<tr>
				<td> <%= i.getNAME() %> </td>
				<td><%= price %></td>
			</tr>
	<%
		}
	%>

</table>
<%
try {
	bookingID = summary.get(1).getBOOKINGID();
	model = summary.get(1).getMODEL();
	flightNumber = summary.get(1).getFLIGHTNUMBER();
	cabinClass = summary.get(1).getCABINCLASS();
	email = summary.get(1).getEMAIL() ;
	first = summary.get(1).getFIRST();
	buss = summary.get(1).getBUSS();
	econ = summary.get(1).getECON();
	bookerID = summary.get(1).getBOOKERID();
	creditCard = summary.get(1).getCREDITCARD();
	numPassengers = summary.get(1).getNUMPASSENGERS();
	flightTime = summary.get(1).getFLIGHTTIME();
	depart = summary.get(1).getDEPART();
	arrive = summary.get(1).getARRIVE();
	originap = summary.get(1).getORIGINAP();
	destap = summary.get(1).getDESTAP();
	country = summary.get(1).getCOUNTRY();
	if (cabinClass.equals("first")) {
		cost = summary.size() * first;
		price = first;
	} else if (cabinClass.equals("bus")) {
		cost = summary.size() * buss;
		price = buss;
	} else if (cabinClass.equals("econ")) {
		cost = summary.size() * econ;
		price = econ;
	}
	%>
		<br><br><br>
		<h1 style="margin-left:20px">Flight 2</h1>
		<table class="table table-striped">
		<tr>
			<th>Country</th>
			<th>Model</th>
			<th>Flight Number</th>
			<th>Origin Airport</th>
			<th>Destination Airport</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Flight Duration</th>
		</tr>
		<tr>
			<td><%= country %></td>
			<td><%= model %></td>
			<td><%= flightNumber %></td>
			<td><%= originap %></td>
			<td><%= destap %></td>
			<td><%= depart %></td>
			<td><%= arrive %></td>
			<td><%= String.format("%.2f", flightTime) %></td>
			
		</tr>
	</table>
	<table class="table table-striped">
	<tr>
		<th>Cabin Class</th>
		<th>Number of Passengers booked</th>
		<th>Email</th>
		<th>Credit Card Number</th>
		<th>Booked by</th>
		<th>Total Cost</th>
	</tr>
	<br><br>
	<tr>
		<td><%= cabinClass %></td>
		<td><%= numPassengers %></td>
		<td><%= email %></td>
		<td><%= creditCard %></td>
		<td><%= bookerID %></td>
		<td><%= cost %></td>
	</tr>
</table>
<br><br>
<table class="table table-striped">
	<tr>
		<th>Name</th>
		<th>Cost per person</th>
	</tr>
	<%
		for (BookingFlightSummary i : summary) {
	%>
			<tr>
				<td> <%= i.getNAME() %> </td>
				<td><%= price %></td>
			</tr>
	<%
		}
	%>

</table>
	<%
} catch (Exception e) {
	System.out.println("OH NOES!");
}

%>
<a class="btn btn-large btn-success" href="index.jsp" style="margin-left: 48%">Return</a>
</section>
<%@ include file = "footer.html" %>
</body>
</html>