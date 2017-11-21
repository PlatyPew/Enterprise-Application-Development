<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import ="java.sql.*"
    %>
<%@ include file = "constants.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>Insert title here</title>
		<style>
			#wallpaper1 {height: 500px; width: 100%;}
			#wallpaper2 {height: 500px; width: 100%;}
			#wallpaper3 {height: 500px; width: 100%;}
			#section1 {padding-top: 50px; height: 500px; background-color: #EFEFEF;}
		</style>
	</head>
	<body>
		<%@ include file = "header.html" %>
		
		<!-- Affixed navigation bar -->
		<div class="nav-wrapper">
			<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="497" style="margin:auto;">
				<div class="navbar-header">
					<a class="navbar-brand" href="index.jsp#top" style="font-size: 30px;"><b>SP Airlines</b></a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="index.jsp#section1">Definition</a></li>
					<li><a href="index.jsp#section2">History</a></li>
					<li><a href="index.jsp#section3">Engine</a></li>
					<li><a href="index.jsp#section4">Creed</a></li>
					<li><a href="index.jsp#section5">Advanced Search</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
					
					// Show username on page
							if ((session.getAttribute("userid") == null)||(session.getAttribute("userid") == "")){
								out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li><li><a href=\"login.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>");
							}else{
						    	out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> " + session.getAttribute("userid") + "</a></li>");
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
				boolean found = true;
				// Store Advanced Search values in array
				String[] search = new String[8];
				int[] value = new int[8];
				search[0] = request.getParameter("flightNum");
				search[1] = request.getParameter("originAp");
				search[2] = request.getParameter("destAp");
				search[3] = request.getParameter("country");
				search[4] = request.getParameter("price");
				search[5] = request.getParameter("dtDepart");
				search[6] = request.getParameter("dtArrive");
				search[7] = request.getParameter("model");
				// Check if values are empty
				for (int i = 0; i < 8; i++) {
					if (search[i] != null && search[i].equals("")) {
						value[i] = 0;
					} else {
						value[i] = 1;
					}
				}
				String flightid = "";
				String flightNum = "";
				String originAp = "";
				String destAp = "";
				String country = "";
				String econ = "";
				String buss = "";
				String first = "";
				String flightTime = "";
				String dtDepart = "";
				String dtArrive = "";
				String model = "";
				try {
					Class.forName("com.mysql.jdbc.Driver"); 
					String connURL ="jdbc:mysql://localhost/assignment?user=root&password=" + passwd; 
					Connection conn = DriverManager.getConnection(connURL); 
					Statement stmt = conn.createStatement();
					// Execute SQL Command
					String sqlStr = "SELECT flightid, model, flightnumber, originap, destap, country, DATE_FORMAT(dtDepart,'%d/%m/%Y') AS Depart, DATE_FORMAT(dtArrive,'%d/%m/%Y') AS Arrive,flighttime, flightschedule.econ, flightschedule.buss, flightschedule.first FROM flightschedule INNER JOIN airplanes ON flightschedule.planeID = airplanes.id WHERE (airplanes.flightnumber LIKE '%" + search[0] + "%' AND 1 = " + value[0] + ") OR (flightschedule.originap LIKE '%" + search[1] + "%' AND 1 = " + value[1] + ") OR (flightschedule.destAp LIKE '%" + search[2] + "%' AND 1 = " + value[2] + ") OR (flightschedule.country LIKE '%" + search[3] + "%' AND 1 = " + value[3] + ") OR (airplanes.econ LIKE '%" + search[4] + "%' AND 1 = " + value[4] + ") OR (airplanes.buss LIKE '%" + search[4] + "%' AND 1 = " + value[4] + ") OR (airplanes.first LIKE '%" + search[4] + "%' AND 1 = " + value[4] + ") OR (flightschedule.dtDepart LIKE '%" + search[5] + "%' AND 1 = " + value[5] + ") OR (flightschedule.dtArrive LIKE '%" + search[6] + "%' AND 1 = " + value[6] + ") OR (airplanes.model LIKE '%" + search[7] + "%' AND 1 = " + value[7] + ");";
					ResultSet rs = stmt.executeQuery(sqlStr);
					if (!rs.next()) {
						found = false;
						out.print("<h1 style=\"text-align: center;\">No results found</h1>");
					} else {
			%>
			<div style="margin-left:50px; margin-right:50px;">
				<h2 style="text-align:center">Results</h2>
				<table class="table">
					<thead>
						<tr>
							<th>Flight Number</th>
							<th>Origin Airport</th>
							<th>Destination Airport</th>
							<th>Country</th>
							<th>Departure Date</th>
							<th>Arrival Date</th>
							<th>Flight Time</th>
							<th>Economic price</th>
							<th>Business price</th>
							<th>First-Class price</th>
							<th>Airplane Model</th>
							<th>Summarised view</th>
						</tr>
					</thead>
					<tbody>
					<% } %>
						<%
								// Return result set pointer
								rs.previous();
								// Process Result
								while (rs.next()) {
									flightid = rs.getString("flightid");
									flightNum = rs.getString("flightnumber");
									originAp = rs.getString("originAp");
									destAp = rs.getString("destAp");
									country = rs.getString("country");
									econ = rs.getString("econ");
									buss = rs.getString("buss");
									first = rs.getString("first");
									flightTime = rs.getString("flighttime");
									dtDepart = rs.getString("Depart");
									dtArrive = rs.getString("Arrive");
									model = rs.getString("model");
									out.print("<tr><td>" + flightNum + "</td><td>" + originAp + "</td><td>" + destAp + "</td><td>" + country + "</td><td>" + dtDepart + "</td><td>" + dtArrive + "</td><td>" + flightTime + "</td><td>" + econ + "</td><td>" + buss + "</td><td>" + first + "</td><td>" + model + "</td><td><button onclick=\"window.location.href='summarised.jsp?ID=" + flightid + "'\" type=\"button\" class=\"btn btn-info\">Summary</button></td></tr>");
								}
								conn.close();
							} catch (Exception e) {
								System.err.println("Error: " + e);
							}
							if (found) {
						%>
					</tbody>
				</table>
			</div>
			<% } %>
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