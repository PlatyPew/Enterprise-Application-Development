<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="booking.*"
    import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>SP Airlines</title>
	<style>
		.affix {top: 0; width: 100%;}
		.affix + .container-fluid {padding-top: 50px;}
		.nav-wrapper {min-height: 50px;}
		#section1 {padding-top: 50px; min-height: 550px; background-color: #EFEFEF; border-bottom: 1px solid #D6D6D6;}
		.form-control {width: 400px;}
		h1,form {margin-left: 20px;}
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
<%@ include file = "adminheader.html" %>
<div class="nav-wrapper">
	<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="160" style="margin:auto;">
		<div class="navbar-header">
			<a class="navbar-brand" href="#top" style="font-size: 30px;"><b>SP Airlines</b></a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#top">Main Admin Page</a></li>
			<li><a href="viewlogs.jsp">Logs</a></li>
			<li><a href="signup1.jsp">Sign up</a></li>
			<li><a href="updateanddelete.jsp">Update&sol;Delete</a></li>
			<li><a href="GetBookingServlet">View Bookings</a></li>
			<li><a href="email.jsp">Send Email</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<%
			if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")&&(session.getAttribute("role") == null) || (session.getAttribute("role") == ""))||!(session.getAttribute("role").equals("adm"))) {
				response.sendRedirect("login.jsp");
		    	
		    }else{
		    	out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> " + session.getAttribute("userid") + "</a></li>");
			}
				
			%>
			<li><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span> Exit to homepage</a></li>
		</ul>
	</nav>
</div>
<br><h1>Search Bookings</h1><br>
<form action="SearchServlet" method="post">
Class:
  <select name="class" class="form-control">
  <option value=""></option>
  <option value="first">First</option>
  <option value="econ">Economy</option>
  <option value="bus">Business</option>
</select><br>
  Flight ID:<br>
  <input type="text" name="flightid" class="form-control">
  <br><br>
  <input type="submit" value="Submit" class="btn btn-success">
  
</form>
<br><br>
<table class="table">
<tr>
    <th>BOOKING ID</th>
    <th>FLIGHT ID</th> 
    <th>NO. OF PASSENGERS</th>
    <th>USERNAME</th>
    <th>CABIN CLASS</th>
    <th>CREDITCARD NUMBER</th>
    <th>EMAIL</th>
  </tr>
<%
try{
ArrayList<booking> book =(ArrayList<booking>)request.getAttribute("detail");
for (booking i : book){

	%>
	<tr>
	<td><%=i.getBID() %></td>
	<td><%=i.getFID() %>
	<form action="GetFlightServlet" method="post">
  <input type="hidden" name="FID" value="<%=i.getFID() %>">
  <input type="submit" value="view more" class="btn btn-info">
</form></td>
	<td><%=i.getNP() %><form action="GetPassengerServlet" method="post">
  <input type="hidden" name="BID" value="<%=i.getBID() %>">
  <input type="submit" value="view more" class="btn btn-info">
</form>
	</td>
	<td><%=i.getPID() %>
	<form action="GetMemberServlet" method="post">
  <input type="hidden" name="PID" value="<%=i.getPID() %>">
  <input type="submit" value="view more" class="btn btn-info">
</form></td>
	<td><%=i.getCC() %></td>
	<td><%=i.getC() %></td>
	<td><%=i.getEmail() %></td>
	</tr>
	<%
}
}catch(Exception e){
	System.out.println(e);
}
%>
</table>
<br>
<%@ include file = "footer.html" %>
</body>
</html>