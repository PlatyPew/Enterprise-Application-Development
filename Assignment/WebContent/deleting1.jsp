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
<%@page import="java.sql.*"%>
<% 
String ID = request.getParameter("delete");
String query;
String mod="";
String flin="";
int pass=0;
String url="";
  try {
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
	    Statement stmtn = (Statement) conn.createStatement();
	    query = "SELECT * FROM airplanes WHERE id='"+ID+"';";
	    ResultSet rsn = stmtn.executeQuery(query); 
	    while(rsn.next()){
	    	mod =rsn.getString("model");
	    	flin=rsn.getString("flightnumber");
	    	pass=rsn.getInt("passengercap");
	    	url=rsn.getString("imageurl");
	    		    }
	    stmtn.close();
		conn.close();
  }
	catch(SQLException e){       
	   System.out.println(e);       
	} 

%>
<form action="delete1.jsp">
<fieldset>
    <legend><h3>ARE YOU SURE</h3></legend>
    Aircraft ID : <%=ID %><br>
Aircraft Model : <%=mod%><br>
  Aircraft Flight Number :<%=flin%><br>
  Flight Passenger Capacity :<%=pass%><br>
 Image URL :<%=url%><br>
 <br>
<input type="hidden" name="delete" value="<%=ID %>">
      	<input type="submit" value="Submit">
  </form>
  </fieldset>
</body>
</html>