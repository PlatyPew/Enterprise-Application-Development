<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    %>
<%@ include file = "constants.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>SP Airlines</title>
		<style>
			.affix {top: 0; width: 100%;}
			.affix + .container-fluid {padding-top: 50px;}
			.nav-wrapper {min-height: 50px;}
			#section1 {padding-top: 50px; min-height: 550px; background-color: #EFEFEF; border-bottom: 1px solid #D6D6D6;}
			#section2 {padding-top: 50px; min-height: 550px; background-color: #EFEFEF; border-bottom: 1px solid #D6D6D6;}
			.add {width:600px;}
		</style>
	</head>
	<body>
		<%@ include file = "adminheader.html" %>
		
		<div class="nav-wrapper">
			<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="160" style="margin:auto;">
				<div class="navbar-header">
					<a class="navbar-brand" href="#top" style="font-size: 30px;"><b>SP Airlines</b></a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="admin.jsp">Main Admin Page</a></li>
					<li><a href="viewlogs.jsp">Logs</a></li>
					<li><a href="signup1.jsp">Sign up</a></li>
					<li class="active"><a href="#top">Update&sol;Delete</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						boolean auth = false;
						// Show username on page
						if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")&&(session.getAttribute("role") == null) || (session.getAttribute("role") == ""))||!(session.getAttribute("role").equals("adm"))) {
							response.sendRedirect("login.jsp");
					    	
					    }else {
							out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> " + session.getAttribute("userid") + "</a></li>");
							auth = true;
						}
					%>
					<li><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span> Exit to homepage</a></li>
				</ul>
			</nav>
		</div>
		<section id="section1" class="container-fluid">
			<div style="margin-left:50px; margin-right:50px;">
				<button onclick="window.location.href='admin.jsp'" type="button" class="btn btn-default" style="margin-left: 20px;">
					<span class="glyphicon glyphicon-arrow-left"></span> Back to Admin page
				</button>
				<legend><h1 style="text-align: center;">Airplane Data</h1></legend>
				<form action="updateanddelete.jsp">
					<div class="form-group">
						<label for="search1">Search<input type="text" class="form-control add" placeholder="Search" name="search1" <% if (request.getParameter("search1") != null) {out.print("value=\"" + request.getParameter("search1") + "\"");} %>required></label>
					</div>
					
					<input type="submit" class="btn btn-success" name="btnSubmit" value="Search">
					<button onclick="window.location.href='updateanddelete.jsp'" type="button" class="btn btn-info">List all</button>
				</form>
				<br><br>
				<table class="table table-striped" style="font-size:20px;">
					<tr>
						<td>ID</td>
						<td>MODEL</td>
						<td>FLIGHTNUMBER</td>
						<td>CAPACITY</td>
						<td>IMAGEURL</td>
						<td>ACTIONS</td>
					</tr>
					<%
						String logi=request.getQueryString();
						CharSequence s1="search1";
						String queryyy="select * from assignment.airplanes";
						if(logi!=null && logi.contains(s1)){
							queryyy= "Select * from assignment.airplanes where Concat(id,model, flightnumber, passengercap , imageurl) like '%"+request.getParameter("search1")+"%';";
						}
						try {
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection connn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
							int x = 0;
							Statement stmtt=connn.createStatement();
							ResultSet rss=stmtt.executeQuery(queryyy);
							while(rss.next()) {
								x++;
					%>
				    <tr>
				    	<td><%=rss.getInt("id") %></td>
				    	<td><%=rss.getString("model") %></td>
				  		<td><%=rss.getString("flightnumber") %></td>
				  		<td><%=rss.getInt("passengercap") %></td>
				      	<td><img src="<%=rss.getString("imageurl") %>" width=100px></td>
				      	<td>
				      		<form action="update1.jsp"><input type="hidden" name="update" value="<%=rss.getInt("id") %>">
				      			
				      			<input type="submit" class="btn btn-info" value="Update" style="width: 70px;">
				      		</form>
				      		<form action="deleting1.jsp">
				      			
				      			<input type="hidden" name="delete" value="<%=rss.getInt("id") %>">
				      			<input type="submit" class="btn btn-danger" value="Delete" style="width: 70px;">
				      		</form>
				      	</td>
					</tr>
					<%
						}
						stmtt.close();
						connn.close();
					%>
					
				</table>
				<%
					if(x <= 0) {
						out.println("<h1 style=\"text-align: center;\">No Results found</h1>");
					}
					CharSequence iw="iswork";
					CharSequence iw1="iswrk1";
					CharSequence idel="delete1";
					CharSequence idel1="delete2";
					if(logi!=null && logi.contains(iw)){
						if (request.getParameter("iswork").equals("yes")) { 
							out.println("<br><br><div id=\"success-alert1\" class=\"alert alert-success fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data updated</p></div>");
						} else if (request.getParameter("iswork").equals("no")) { 
							out.println("<br><br><div id=\"danger-alert1\" class=\"alert alert-danger fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data could not be deleted</p></div>");
						} 
					}
					if(logi!=null && logi.contains(idel)){
						if (request.getParameter("delete1").equals("yes")) { 
							out.println("<br><br><div id=\"success-alert2\" class=\"alert alert-success fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data deleted</p></div>");
						} else if (request.getParameter("delete1").equals("no")) { 
							out.println("<br><br><div id=\"danger-alert2\" class=\"alert alert-danger fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data could not be deleted</p></div>");
						} 
						
					}
				%>
			</div>
		</section>
		<section id="section2" class="container-fluid">
			<div style="margin-left:50px;margin-right:50px;">
				<legend><h1 style="text-align:center;">Flight Schedule Data</h1></legend>
				<form action="updateanddelete.jsp">
					<div class="form-group">
						<label for="search2">Search<input type="text" class="form-control add" placeholder="Search" name="search2" <% if (request.getParameter("search2") != null) {out.print("value=\"" + request.getParameter("search2") + "\"");} %>required></label>
					</div>
					
					<input type="submit" class="btn btn-success" value="Search"/>
					<button onclick="window.location.href='updateanddelete.jsp'" type="button" class="btn btn-info">List all</button>
				</form>
				<br><br>
			    <table class="table table-striped" style="font-size:20px;">
					<tr>
						<td>FLIGHTID</td>
						<td>PLANEID</td>
						<td>ORIGIN AIRPORT</td>
						<td>DEST AIRPORT</td>
						<td>COUNTRY</td>
						<td>ECONOMY FARE</td>
						<td>BUSINESS FARE</td>
						<td>FIRST CLASS FARE</td>
						<td>DEPARTURE DATE AND TIME</td>
						<td>ARRIVAL DATE AND TIME</td>
						<td>FLIGHT TIME</td>
						<td>Actions</td>
					</tr>
					<% 
					    CharSequence s2="search2";
					    String query1="select * from assignment.flightschedule";
				    	if(logi!=null && logi.contains(s2)){
				    		query1= "Select * from assignment.flightschedule where Concat(flightid,planeid, originap, destap, country, econ, buss, first, dtdepart, dtarrive, flighttime) like '%"+request.getParameter("search2")+"%';";
				    	}
					    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
					    Statement stmt = (Statement) con.createStatement();
					    int z=0;
					
						Statement stmt1=con.createStatement();
						ResultSet rs1=stmt1.executeQuery(query1);
						while(rs1.next()) {
							z++;
					%>
				    <tr>
				    	<td><%=rs1.getInt("flightid") %></td>
				    	<td><%=rs1.getInt("planeid") %></td>
				  		<td><%=rs1.getString("originap") %></td>
				  		<td><%=rs1.getString("destap") %></td>
				  		<td><%=rs1.getString("country") %></td>
				  		<td><%=rs1.getFloat("econ") %></td>
				  		<td><%=rs1.getFloat("buss") %></td>
				  		<td><%=rs1.getFloat("first") %></td>
				  		<td><%=rs1.getString("dtdepart") %></td>
				  		<td><%=rs1.getString("dtarrive") %></td>
				      	<td><%=rs1.getFloat("flighttime") %></td>
				      	<td>
				      		<form action="update2.jsp"><input type="hidden" name="update" value="<%=rs1.getInt("flightid") %>">
				      			
				      			<input type="submit" class="btn btn-info" value="Update" style="width: 70px;">
				      		</form>
				      		<form action="deleting2.jsp">
				      			
				      			<input type="hidden" name="delete1" value="<%=rs1.getInt("flightid") %>">
				      			<input type="submit" class="btn btn-danger" value="Delete" style="width: 70px;">
				      		</form>
				      	</td>
					</tr>
			        <%
						}
						stmt1.close();
						con.close();
					%>
			    </table>
				<%
					    if(z <= 0) {
					    	out.println("<h1 style=\"text-align: center;\">No Results found</h1>");
					    }
				    	if(logi!=null && logi.contains(iw1)){
				    		if ( request.getParameter("iswrk1").equals("yes")) {
				    			out.println("<br><br><div id=\"success-alert3\" class=\"alert alert-success fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data updated</p></div>");
				    		} else if ( request.getParameter("iswrk1").equals("no")) {
				    			out.println("<br><br><div id=\"danger-alert3\" class=\"alert alert-danger fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data could not be updated</p></div>");
				    		}
				    	}
				    	if(logi!=null && logi.contains(idel1)){
				    		if ( request.getParameter("delete2").equals("yes")) {
				    			out.println("<br><br><div id=\"success-alert4\" class=\"alert alert-success fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data deleted</p></div>");
				    		} else if ( request.getParameter("delete2").equals("no")) {
				    			out.println("<br><br><div id=\"danger-alert2\" class=\"alert alert-danger fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data could not be deleted</p></div>");
				    		} 
				    	}
					} catch(Exception e) {
				    	e.printStackTrace();
				    }
				%>
			</div>
		</section>
	 	<%@ include file = "footer.html" %>
	 	<script>
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
			
			$("#success-alert3").fadeTo(4000, 500).slideUp(500, function() {
				$("#success-alert3").slideUp(500);
			});
			
			$("#danger-alert3").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert3").slideUp(500);
			});
			
			$("#success-alert4").fadeTo(4000, 500).slideUp(500, function() {
				$("#success-alert4").slideUp(500);
			});
			
			$("#danger-alert4").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert4").slideUp(500);
			});
		</script>
	</body>
</html>