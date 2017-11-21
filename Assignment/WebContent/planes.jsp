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
String query;
String MOD = request.getParameter("am");
String FLIGHTNUM = request.getParameter("afn");
String IMG = request.getParameter("pic");
String fir = request.getParameter("fir");
String bus = request.getParameter("bus");
String econ = request.getParameter("econ");
int CAP=0;
int FIR=0;
int BUS=0;
int ECON=0;
boolean error=false;
try  
{  
	 FIR =Integer.parseInt(fir);
	 BUS =Integer.parseInt(bus);
	 ECON =Integer.parseInt(econ);
}  
catch(NumberFormatException stri)  
{  
	System.out.println(stri);
	error=true;
}
CAP=FIR+BUS+ECON;
if(IMG.equals("")){
	IMG="default image";//default image 
}
if(CAP!=0){
try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
    
    query = "INSERT INTO assignment.airplanes ( model, flightnumber, passengercap , imageurl,first,buss,econ) VALUES (?, ?, ?, ?,?,?,?);";
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setString(1,MOD);
    stmt.setString(2,FLIGHTNUM);
    stmt.setInt(3,CAP);
    stmt.setString(4,IMG);
    stmt.setInt(5,FIR);
    stmt.setInt(6,BUS);
    stmt.setInt(7,ECON);
    stmt.executeUpdate();                       
	
    stmt.close();
    con.close();
	}
catch(Exception e){       
	error=true;
	System.out.println(e);
} 
}
if (error){
	response.sendRedirect("admin.jsp?&iswork=no#alert1");
}else{
	response.sendRedirect("admin.jsp?iswork=yes#alert1");	
}
%>
</body>
</html>