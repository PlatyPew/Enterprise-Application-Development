<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    import="java.util.*"
    %>
    <%@ include file = "constants.jsp" %>
<!DOCTYPE HTML>
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
			#section1 {padding-top: 50px;padding-bottom: 50px;padding-left: 50px; min-height: 500px; background-color: #EFEFEF;}
			
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
	<body data-spy="scroll" data-target=".navbar" data-offset="50">
		<%@ include file = "header.html" %>
		<% 
		List<String> list = new ArrayList<String>();

		String query;
		String oap="";
		String dap="";
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
			Statement stmt = (Statement) conn.createStatement();
			query = "SELECT originap , destap  FROM flightschedule;";
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
				oap= rs.getString(1);               
				dap= rs.getString(2);
				list.add(oap);
				list.add(dap);
				
	
			}
			conn.close();
		}
		catch(SQLException e){       
			out.println("not work");
		}
		list = new ArrayList<String>(new LinkedHashSet<String>(list));
	%>

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
				if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")&&(session.getAttribute("role") == null) || (session.getAttribute("role") == ""))) {
					response.sendRedirect("login.jsp");
			    	
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
				<form action="BookingServlet" method="post">
					<legend><h1>Booking Search</h1></legend>
					<div class="form-group">
					<label for="originAp">Origin Airport</label>
					<select class="form-control advanced-search"  id="sel1" name="originAp" >
						<% 
						for (String i:list){
							%>
							<option value="<%=i%>"><%= i %></option>
							<%
						}
						%>
					</select>
				</div>
				<div class="form-group">
					<label for="destAp">Destination Airport</label>
					<select class="form-control advanced-search"  id="sel1" name="destAp" >
						<% 
						for (String i:list){
							%>
							<option value="<%=i%>"><%= i %></option>
							<%
						}
						%>
					</select>
				</div>
					
					<div class="form-group">
					<input type="radio" name="flighttype" value="return" style="" onclick="show()"> Return
					<input type="radio" name="flighttype" value="single" onclick="hide()"> One-way<br>
					</div>
					<div class="form-group">
						<label for="dtDepart">Departure<input type="date" class="form-control advanced-search" name="Depart" required></label>
					</div>
					<div class="form-group" id ="returns">
						<label for="return">Return<input type="date" class="form-control advanced-search" name="return"></label>
					</div>
					<div class="form-group">
						<label for="type">Cabin Class
							<select class="form-control advanced-search" name="type">
							  <option value="first">First Class</option>
							  <option value="bus">Business class</option>
							  <option value="econ">Economy Class</option>
							</select>
						</label>
					</div>
					<div class="form-group">
						<label for="Pax">Number of passengers<input type="text" class="form-control advanced-search" placeholder="No. of Passengers" name="Pax" required></label>
					</div>
					<button type="submit" class="btn btn-success">Submit</button>
					<input class="btn btn-info" type="reset">
				</form>
<script>

     function hide() {
var returns = document.getElementById('returns');
returns.style.display = 'none';		 
}
     function show() {
var returns = document.getElementById('returns');
returns.style.display = 'block';		 
}
</script>  
		</section>
		<%@ include file = "footer.html" %>
		<script>
			$('input').on('keypress', function (event) {
			    var regex = new RegExp("^[a-zA-Z0-9\-\ ]+$");
			    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
			    if (!regex.test(key)) {
			       event.preventDefault();
			       return false;
			    }
			});
		</script>
	</body>
</html>
