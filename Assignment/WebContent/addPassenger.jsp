<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="booking.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  #section1 {padding-top: 50px;padding-bottom: 50px; min-height: 500px; background-color: #EFEFEF;}
  </style>
<title>Insert title here</title>
<%@ include file = "header.html" %>
</head>
<body>
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
<section id="section1">
<table class="table table-striped">
<tr><th>FLIGHT ID</th>
<th>PLANE ID</th>
<th>ORIGIN AIRPORT</th>
<th>DESTINATION AIRPORT</th>
<th>COUNTRY</th>
<th>ECONOMY PRICE</th>
<th>BUSINESS PRICE</th>
<th>FIRST CLASS PRICE</th>
<th>DEPARTURE DATE</th>
<th>ARRIVAL DATE</th>
<th>FLIGHT TIME</th>
<th>AVAILABLE SEATS</th>
<th>FIRST CLASS AVAILABLE SEATS</th>
<th>BUSINESS CLASS AVAILABLE SEATS</th>
<th>ECONOMY CLASS AVAILABLE SEATS</th></tr>
<%
FlightSchedule data=(FlightSchedule)request.getAttribute("details");
FlightSchedule data1=(FlightSchedule)request.getAttribute("details1");
System.out.println(data1);
%>
<tr>
<td><%=data.getFID() %></td>
<td><%=data.getPID() %></td>
<td><%=data.getOAP() %></td>
<td><%=data.getDAP() %></td>
<td><%=data.getCOUNT() %></td>
<td><%=data.getECON() %></td>
<td><%=data.getBUS() %></td>
<td><%=data.getFIR() %></td>
<td><%=data.getDOD() %></td>
<td><%=data.getDOA() %></td>
<td><%=data.getFT() %></td>
<td><%=data.getUNOP() %></td>
<td><%=data.getFNOP() %></td>
<td><%=data.getBNOP() %></td>
<td><%=data.getENOP() %></td>
</tr>
</table>
<%
if (data1 != null) {
%>
<br><br>
<table class="table table-striped">
	<tr>
		<th>FLIGHT ID</th>
		<th>PLANE ID</th>
		<th>ORIGIN AIRPORT</th>
		<th>DESTINATION AIRPORT</th>
		<th>COUNTRY</th>
		<th>ECONOMY PRICE</th>
		<th>BUSINESS PRICE</th>
		<th>FIRST CLASS PRICE</th>
		<th>DEPARTURE DATE</th>
		<th>ARRIVAL DATE</th>
		<th>FLIGHT TIME</th>
		<th>AVAILABLE SEATS</th>
		<th>FIRST CLASS AVAILABLE SEATS</th>
		<th>BUSINESS CLASS AVAILABLE SEATS</th>
		<th>ECONOMY CLASS AVAILABLE SEATS</th>
	</tr>
	<tr>
		<td><%=data1.getFID() %></td>
		<td><%=data1.getPID() %></td>
		<td><%=data1.getOAP() %></td>
		<td><%=data1.getDAP() %></td>
		<td><%=data1.getCOUNT() %></td>
		<td><%=data1.getECON() %></td>
		<td><%=data1.getBUS() %></td>
		<td><%=data1.getFIR() %></td>
		<td><%=data1.getDOD() %></td>
		<td><%=data1.getDOA() %></td>
		<td><%=data1.getFT() %></td>
		<td><%=data1.getUNOP() %></td>
		<td><%=data1.getFNOP() %></td>
		<td><%=data1.getBNOP() %></td>
		<td><%=data1.getENOP() %></td>
	</tr>
</table>
<%
}
%>

<%
session.setAttribute("firstname",request.getParameterValues("firstname"));
session.setAttribute("lastname",request.getParameterValues("lastname"));
session.setAttribute("email",request.getParameter("email"));
session.setAttribute("card",request.getParameter("card"));
%>



<form action="AddBookingServlet">
	<input type="Submit" value="Confirm" class="btn btn-success" style="margin-left: 49%;">
	<input type="hidden" name="FID" value="<%=data.getFID() %>">
	
</form>
</section>
<%@ include file = "footer.html" %>
</body>
</html>