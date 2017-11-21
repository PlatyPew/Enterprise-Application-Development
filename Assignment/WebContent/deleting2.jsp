<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "constants.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="delete2.jsp">
<fieldset>
<%@page import="java.sql.*"%>
<% 
String ID = request.getParameter("delete1");
String query;
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

    <legend><h3>ARE YOU SURE</h3></legend>
    Flight ID : <%=ID%>
 <br>
 Aircraft ID : <%=PID%>
	<br>
   Origin Airport : <%=OAP%>
   <br>
  Destination Airport : <%=DAP%>
   <br>
  Country : <%=COU%>
   <br>
  Economy Cost : <%=ECO%>
   <br>
  Business Class Cost : <%=BUS%>
   <br>
  First Class Cost : <%=FIS%>
  <br>
  Date and time of Departure : <%=DTD%>
   <br>
  Date and time of Arrival : <%=DTA%>
   <br>
  Flight Time : <%=FTE%>
  
   <br>
   <input type="hidden" name="delete1" value="<%=ID%>">
  <input type="submit" value="Submit">
  </fieldset>
</form>
</body>
</html>