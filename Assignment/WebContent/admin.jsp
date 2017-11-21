<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
  	import="java.io.*"
    %>
<%@ include file = "constants.jsp" %>
<!DOCTYPE HTML>
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
			#section2 {padding-top: 50px; min-height: 1000px; background-color: #EFEFEF; border-bottom: 1px solid #D6D6D6;}
			#section3 {padding-top: 20px; min-height: 400px; background-color: #EFEFEF; border-bottom: 1px solid #D6D6D6;}
			.add {width:600px;}
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
		<%
		// Show username on page
		%>
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
		<section id="section1" class="container-fluid">	
			<legend><h1 style="text-align: center;">Airplane Data</h1></legend>
			<form action="planes.jsp" style="margin-left: 31%;">
				<div class="form-group">
					<label for="am">Aircraft model<input type="text" class="form-control add" placeholder="Aircraft model" name="am" required></label>
				</div>
				<div class="form-group">
					<label for="afn">Aircraft Flight Number<input type="text" class="form-control add" placeholder="Aircraft Flight Number" name="afn" required></label>
				</div>
				<div class="form-group">
					<label for="fir">First-class Passenger Capacity<input type="text" class="form-control add" placeholder="Flight Passenger Capacity" name="fir" required></label>
				</div>
				<div class="form-group">
					<label for="bus">Business-class Passenger Capacity<input type="text" class="form-control add" placeholder="Flight Passenger Capacity" name="bus" required></label>
				</div>
				<div class="form-group">
					<label for="econ">Economy-class Passenger Capacity<input type="text" class="form-control add" placeholder="Flight Passenger Capacity" name="econ" required></label>
				</div>
				<div class="form-group">
					<label for="pic">Image URL 
					  <select class="form-control add" name="pic">
					  <%
						  int i=0;
						  File jsp = new File(dir);  //change to your path to uploaded images
						  File[] list = jsp.listFiles();
					  %>
						<option></option>
						<%
					 	 while(i<list.length){
						  %>
						<option  value="<%=list[i] %>" ><%=list[i] %> </option>
						<%
						i++;
						}
					  	%>   
					</select>
					</label>
				</div>
				
				
				<input type="submit" id="alert1" class="btn btn-success" value="Save">
				<%
					String logi=request.getQueryString();
					CharSequence iw="iswork";
					CharSequence iw1="iswrk1";
					if(logi!=null && logi.contains(iw)){
						if (request.getParameter("iswork").equals("yes")) {
							out.println("<br><br><div id=\"success-alert1\" class=\"alert alert-success fade out add\"><p style=\"text-align: center;\">Data Entered into the database</p></div>");
						} else if (request.getParameter("iswork").equals("no")) { 
						out.println("<br><br><div id=\"danger-alert1\" class=\"alert alert-danger fade out add\"><p style=\"text-align: center;\">Data could not be entered in database due to invalid input, please try again</p></div>");
						}
					}
				%>
			</form>
		</section>
		<section id="section2" class="container-fluid">
			<legend><h1 style="text-align: center;">Flight Schedule Data</h1></legend>
			<form action="schedule.jsp" style="margin-left: 31%;">
				<div class="form-group">
					<label for="ai">Aircraft ID</label>
					<select class="form-control" id="sel1" name="ai" style="width:600px;">
						<% 
							String query;
							String id="";
							String model="";
							try {
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
								Statement stmt = (Statement) conn.createStatement();
								query = "SELECT id, model FROM airplanes;";
								ResultSet rs = stmt.executeQuery(query);
								while(rs.next()){
									id= rs.getString(1);               
									model=rs.getString(2);
						%>
						<option value="<%= id %>"><%= id %> ( <%= model %> )</option>
						<%
								}
								conn.close();
							}
							catch(SQLException e){       
								out.println("not work");
							}
						%>
					</select>
				</div>
				<div class="form-group">
					<label for="oa">Origin Airport<input type="text" class="form-control add" placeholder="Origin Airport" name="oa" required></label>
				</div>
				<div class="form-group">
					<label for="da">Destination Airport<input type="text" class="form-control add" placeholder="Destination Airport" name="da" required></label>
				</div>
				<div class="form-group">
					<label for="ct">Country<input type="text" class="form-control add" placeholder="Country" name="ct" required></label>
				</div>
				<div class="form-group">
					<label for="ec">Economy Class Pricing<input type="text" class="form-control add" placeholder="Economy Class Pricing" name="ec" required></label>
				</div>
				<div class="form-group">
					<label for="bcc">Business Class Pricing<input type="text" class="form-control add" placeholder="Business Class Pricing" name="bcc" required></label>
				</div>
				<div class="form-group">
					<label for="fcc">First Class Pricing<input type="text" class="form-control add" placeholder="First Class Pricing" name="fcc" required></label>
				</div>
				<div class="form-group">
					<label for="dt">Date and time of Departure<input type="datetime-local" class="form-control add" name="dt" required></label>
				</div>
				<div class="form-group">
					<label for="at">Date and time of Arrival<input type="datetime-local" class="form-control add" name="at" required></label>
				</div>
				
				<input type="submit" id="alert2" class="btn btn-success" value="Save">
				<%
					if(logi != null && logi.contains(iw1)){
						if (request.getParameter("iswrk1").equals("yes")) {
							out.println("<br><br><div id=\"success-alert2\" class=\"alert alert-success fade out add\"><p style=\"text-align: center;\">Data Entered into the database</p></div>");
						} else if (request.getParameter("iswrk1").equals("no")) { 
							out.println("<br><br><div id=\"danger-alert2\" class=\"alert alert-danger fade out add\"><p style=\"text-align: center;\">Data could not be entered in database due to invalid input, please try again</p></div>");
						}
					}
				%>
			</form>
		</section>
		<section id="section3" class="container-fluid">
			<h2 style="text-align: center">Misc.</h2>
			<h3 style="text-align: center;"><a href="viewlogs.jsp" class="btn btn-primary btn-lg">View logs</a></h3>
			<h3 style="text-align: center;"><a href="signup1.jsp" class="btn btn-primary btn-lg">Sign up as Administrator</a></h3>
			<h3 style="text-align: center;"><a href="updateanddelete.jsp" class="btn btn-primary btn-lg">Update and Delete Records</a></h3>
		</section>
		<%@ include file = "footer.html" %>
		<script>
			$('input').on('keypress', function (event) {
			    var regex = new RegExp("^[a-zA-Z0-9\-_\ ]+$");
			    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
			    if (!regex.test(key)) {
			       event.preventDefault();
			       return false;
			    }
			});
			
			$("#success-alert1").fadeTo(4000, 500).slideUp(500, function() {
				$("#success-alert1").slideUp(500);
			});
			
			$("#danger-alert1").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert1").slideUp(500);
			});
			
			$("#success-alert2").fadeTo(4000, 500).slideUp(500, function() {
				$("#success-alert2").slideUp(500);
			});
			
			$("#danger-alert2").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert2").slideUp(500);
			});
		</script>
	</body>
</html>