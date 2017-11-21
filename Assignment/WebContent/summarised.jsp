<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "constants.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@page import="java.sql.*"%>
<% 
String ID = request.getParameter("ID");
String query;
int pid=0;
try {
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
	    Statement stmtn = (Statement) conn.createStatement();
	    query = "SELECT * FROM flightschedule WHERE flightid='"+ID+"';";
	    ResultSet rsn = stmtn.executeQuery(query); 
	    while(rsn.next()){
	    	pid=rsn.getInt("planeid") ;
	    	%>
	    	<div class="container-fluid">
	    	<h2>Flight schedule information</h2>
	    	<p>FlightID =<%=rsn.getString("flightid") %></p>
	    	<p>PlaneID =<%=rsn.getInt("planeid") %></p>
	    	<p>Destination Airport =<%=rsn.getString("destap") %></p>
	    	<p>Origin Airport =<%=rsn.getString("originap") %></p>
	    	<p>Economy =<%=rsn.getString("econ") %></p>
	    	<p>Business =<%=rsn.getString("buss") %></p>
	    	<p>First Class =<%=rsn.getString("first") %></p>
	    	<p>Departure time =<%=rsn.getString("dtdepart").replace(" ","T") %></p>
	    	<p>Arrival Time =<%=rsn.getString("dtarrive").replace(" ","T")%></p>
	    	<p>Flight Time =<%=rsn.getString("flighttime") %></p>
	    	</div>
	    	<%
	    		    }
	    Connection connn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
	    Statement stmtnn = (Statement) conn.createStatement();
	    query = "SELECT * FROM airplanes WHERE id='"+pid+"';";
	    ResultSet rs = stmtnn.executeQuery(query); 
	    while(rs.next()){
	    	%>
	    	<div class="container-fluid">
	    	<h2>Aircraft info</h2>
	    	<p>Model =<%=rs.getString("model") %></p>
	    	<p>Flight Number =<%=rs.getString("flightnumber") %></p>
	    	<p>Capacity =<%=rs.getString("passengercap") %></p>
	    	<p><img src="<%=rs.getString("imageurl") %>" alt="picture" width="100" height="100"></p>
	    	</div>
	    	<%
	    		    }
	    stmtn.close();
		conn.close();
  }
	catch(SQLException e){       
	   System.out.println(e);       
	} 
%>
</body>
</html>