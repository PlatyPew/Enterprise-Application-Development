<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    %>
<%@ include file = "constants.jsp" %>
<!DOCTYPE HTML">
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
			#section1 {padding-top: 50px; padding-bottom: 50px; min-height: 550px; background-color: #EFEFEF; border-bottom: 1px solid #D6D6D6;}
			#section2 {padding-top: 50px; padding-bottom: 50px; min-height: 300px; border-bottom: 1px solid #D6D6D6;}
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
					<li class="active"><a href="signup1.jsp">Sign up</a></li>
					<li><a href="updateanddelete.jsp">Update&sol;Delete</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						boolean auth = false;
						// Show username on page
						if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")&&(session.getAttribute("role") == null) || (session.getAttribute("role") == ""))||!(session.getAttribute("role").equals("adm"))) {
							response.sendRedirect("login.jsp");
					    	
					    } else {
							out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> " + session.getAttribute("userid") + "</a></li>");
							auth = true;
						}
					%>
					<li><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span> Exit to homepage</a></li>
				</ul>
			</nav>
		</div>
		<section id="section1" class="container-fluid">
			<button onclick="window.location.href='signup1.jsp'" type="button" class="btn btn-default" style="margin-left: 20px;">
				<span class="glyphicon glyphicon-arrow-left"></span> Back to Sign Up page
			</button>
			<%
				String ID = request.getParameter("update");
				String usr="";
				String pwd="";
				String email="";
				String role="";
				String query="";
				try {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
					Statement stmtn = (Statement) conn.createStatement();
					query = "SELECT * FROM member WHERE usr='"+ID+"';";
					ResultSet rsn = stmtn.executeQuery(query); 
					while(rsn.next()){
					usr=rsn.getString("usr");
					pwd=rsn.getString("pwd");
					email=rsn.getString("email");
					role=rsn.getString("role");
					}
					stmtn.close();
					conn.close();
				}
				catch(SQLException e){       
					System.out.println(e);       
				}
				
			%>
			<legend><h1 style="text-align:center;">Update information</h1></legend>
			<form action="userupdate.jsp" style="margin-left: 31%;">
				<input type="hidden" name="update" value="<%=ID %>">
				<div class="form-group">
					<label for="usr">Login ID<input type="text" class="form-control add" placeholder="Username" name="usr" value=<%= usr %> required></label>
				</div>
				<div class="form-group">
					<label for="pwd">Password<input type="text" class="form-control add" placeholder="Password" name="pwd" value=<%= pwd %> required></label>
				</div>
				<div class="form-group">
					<label for="email">Email<input type="text" class="form-control add" placeholder="Email" name="email" value=<%= email %> required></label>
				</div>
				<label for="at">Account type</label>
				<select class="form-control add" name="at" required>
					<%
						if(role.equals("adm")) {
							out.println("<option value=\"adm\" selected=\"selected\">Admin</option><option value=\"mem\">Member</option>");	
						} else {
							out.println("<option value=\"adm\">Admin</option><option  value=\"mem\" selected=\"selected\">Member</option>");
						}
					%>
				</select>
				<br>
				
				<input type="submit" class="btn btn-success" name="btnSubmit" value="Update">
				<input type="reset" class="btn btn-info">
			</form>
		</section>
		<%@ include file = "footer.html" %>
	</body>
</html>