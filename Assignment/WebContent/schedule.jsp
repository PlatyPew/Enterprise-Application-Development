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
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<% 
String query;
String ID = request.getParameter("ai");
String ORIGIN = request.getParameter("oa");
String DEST = request.getParameter("da");
String COUNT = request.getParameter("ct");
String econ = request.getParameter("ec");
String buss = request.getParameter("bcc");
String first = request.getParameter("fcc");
String depart = request.getParameter("dt");
String ARRIVE=request.getParameter("at").replace("T"," ");
String DEPART=request.getParameter("dt").replace("T"," ");
String flight = request.getParameter("ft");

float ECON=0;
float BUSS=0;
float FIRST=0;
float FLIGHT=hours(DEPART,ARRIVE);

boolean error=false;

if (FLIGHT<=0){
	error=true;
}

try  
{  
	ECON=Float.parseFloat(econ);
	BUSS=Float.parseFloat(buss);
	FIRST=Float.parseFloat(first);
}  
catch(Exception stri)  
{  
	error=true;
}
int passengers=0;
int firsts=0;
int busss=0;
int econs=0;
if (error==false){
try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
    query = "SELECT passengercap,first,buss,econ FROM airplanes WHERE id = ?";
    PreparedStatement stmt =  con.prepareStatement(query);
	stmt.setString(1,ID);
	ResultSet rs = stmt.executeQuery();  
	if (rs.next()) {
		passengers=rs.getInt(1);
		firsts=rs.getInt(2);
		busss=rs.getInt(3);
		econs=rs.getInt(4);
		}
	stmt.close();
	con.close();
}catch(Exception e){
	error=true;
}try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
    query = "INSERT INTO assignment.flightschedule (planeid, originap, destap, country, econ, buss, first, dtdepart, dtarrive, flighttime,availseats,firsts,busss,econs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?);";
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setString(1,ID);
    stmt.setString(2,ORIGIN);
    stmt.setString(3,DEST);
    stmt.setString(4,COUNT);
    stmt.setFloat(5,ECON);
    stmt.setFloat(6,BUSS);
    stmt.setFloat(7,FIRST);
    stmt.setString(8,DEPART);
    stmt.setString(9,ARRIVE);
    stmt.setFloat(10,FLIGHT);
    stmt.setInt(11,passengers);
    stmt.setInt(12,firsts);
    stmt.setInt(13,busss);
    stmt.setInt(14,econs);
    stmt.executeUpdate();                       
    stmt.close();
    con.close();
	}
catch(Exception e){       
	error=true;
	System.out.println("Error: " + e);
}  
}
System.out.println(error);
if (error==true){
	System.out.println(error);
	response.sendRedirect("admin.jsp?iswrk1=no#alert2");
}else{
	response.sendRedirect("admin.jsp?iswrk1=yes#alert2");	
}
%>
<%! 
public float hours( String dateStart, String dateStop){
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	Date d1 = null;
	Date d2 = null;
	try {
	    d1 = format.parse(dateStart);
	    d2 = format.parse(dateStop);
	} catch (Exception e) {
	   System.out.println(e);
	   
	}
	
	// Get msec from each, and subtract.
	float diff = d2.getTime() - d1.getTime();
	float diffHours = diff / (60 * 60 * 1000);
	return diffHours;
	
}%>
</body>
</html>