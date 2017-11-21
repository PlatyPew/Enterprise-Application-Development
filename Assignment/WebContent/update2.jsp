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
	#section1 {padding-top: 50px; padding-bottom:50px; min-height: 550px; background-color: #EFEFEF; border-bottom: 1px solid #D6D6D6;}
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
			<li class="active"><a href="updateanddelete.jsp">Update&sol;Delete</a></li>
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
	<button onclick="window.location.href='updateanddelete.jsp'" type="button" class="btn btn-default" style="margin-left: 20px;">
		<span class="glyphicon glyphicon-arrow-left"></span> Back to Update and Delete page
	</button>
<legend><h1 style="text-align:center;">Flight Schedule Data</h1></legend>
<form action="scheduleupdate.jsp" style="margin-left: 31%;">
	<% 
		String ID = request.getParameter("update");
		String query;
		String FID="";
		String PID="";
		String OAP="";
		String DAP="";
		String COU="";
		String ECO="";
		String BUS="";
		String FIS="";
		String DTD="";
		String DTA="";
		String FTE="";
		String id;
		String model;
		try {
		    Class.forName("com.mysql.jdbc.Driver").newInstance();
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
		    Statement stmtn = (Statement) conn.createStatement();
		    query = "SELECT * FROM flightschedule WHERE flightid='"+ID+"';";
		    ResultSet rsn = stmtn.executeQuery(query); 
		    while(rsn.next()){
		    	FID =rsn.getString("flightid");
		    	PID=rsn.getString("planeid");
		    	OAP=rsn.getString("originap");
		    	DAP=rsn.getString("destap");
		    	COU=rsn.getString("country");
		    	ECO=rsn.getString("econ");
		    	BUS=rsn.getString("buss");
		    	FIS=rsn.getString("first");
		    	DTD=rsn.getString("dtdepart").replace(" ","T");
		    	DTA=rsn.getString("dtarrive").replace(" ","T");
		    	FTE=rsn.getString("flighttime");
		    		    }
		    stmtn.close();
			conn.close();
		 }
		catch(SQLException e){       
		   System.out.println(e);       
		}
	%>
    <input type="hidden" name="fi" value="<%=ID%>">
    
 	<label for="ai">Aircraft ID</label>
	<select name="ai" class="form-control add" value="<%=PID%>">
  <% 
  try {
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password" + passwd);
	    Statement stmt = (Statement) con.createStatement();
	    query = "SELECT id,model FROM airplanes;";
	    ResultSet rs = stmt.executeQuery(query); 
		while(rs.next()){
		id= rs.getString(1);               
	    model=rs.getString(2);
	    if(id.equals(PID)){
	    	
	    	%>
	    	<option value="<%=id%>" selected='selected' ><%=id %> ( <%=model %> )</option>
	      	    <%
	    }else{
		%>
	<option value="<%=id%>" ><%=id %> ( <%=model %> )</option>
	
  	    <%
		}
	
	    }
  }
	catch(SQLException e){       
	   out.println("not work");       
	} 
  
%>
</select>

<div class="form-group">
	<label for="oa">Origin Airport<input type="text" class="form-control add" placeholder="Origin Airport" name="oa" value="<%= OAP %>" required></label>
</div>
<div class="form-group">
	<label for="da">Destination Airport<input type="text" class="form-control add" placeholder="Destination Airport" name="da" value="<%= DAP %>" required></label>
</div>
<div class="form-group">
	<label for="ct">Country<input type="text" class="form-control add" placeholder="Country" name="ct" value="<%= COU %>" required></label>
</div>
<div class="form-group">
	<label for="ec">Economy Class Cost<input type="text" class="form-control add" placeholder="Economy Class Cost" name="ec" value="<%= ECO %>" required></label>
</div>
<div class="form-group">
	<label for="bcc">Business Class Cost<input type="text" class="form-control add" placeholder="Business Class Cost" name="ec" value="<%= BUS %>" required></label>
</div>
<div class="form-group">
	<label for="fcc">First Class Cost<input type="text" class="form-control add" placeholder="First Class Cost" name="fcc" value="<%= FIS %>" required></label>
</div>
<div class="form-group">
	<label for="dt">Date and time of Departure<input type="datetime-local" class="form-control add" placeholder="Date and time of Departure" name="dt" value="<%= DTD %>" required></label>
</div>
<div class="form-group">
	<label for="at">Date and time of Arrival<input type="datetime-local" class="form-control add" placeholder="Date and time of Arrival" name="at" value="<%= DTA %>" required></label>
</div>
<div class="form-group">
	<label for="ft">Flight Time<input type="text" class="form-control add" placeholder="Flight Time" name="ft" value="<%= FTE %>" required></label>
</div>
<input type="submit" class="btn btn-success" value="Update">
</form>
</section>
<%@ include file = "footer.html" %>
</body>
</html>