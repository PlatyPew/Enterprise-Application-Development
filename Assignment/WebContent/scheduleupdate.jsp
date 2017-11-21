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
String FID = request.getParameter("fi");
String id = request.getParameter("ai");
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

boolean error=false;

float ECON=0;;
float BUSS=0;;
float FIRST=0;;
float FLIGHT=0;;
String hello="";
int ID=0;

try  
{  
	ECON=Float.parseFloat(nulll(econ));
	BUSS=Float.parseFloat(nulll(buss));
	FIRST=Float.parseFloat(nulll(first));
	FLIGHT=Float.parseFloat(nulll(flight));
	ID=Integer.parseInt(nulll(id));
}  
catch(NumberFormatException stri)  
{  
	error=true;
hello=econ;
}
catch(NullPointerException e ){
  error=false;
    }

int PI=0;
String OA="";
String DA="";
String CT="";
float EC = 0;
float BS=0;
float FS=0;
String DD="";
String DAR="";
float FT=0;
try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
	String query1="select * from assignment.flightschedule WHERE flightid='"+FID+"';";
	Statement stmtn=conn.createStatement();
	ResultSet rs1=stmtn.executeQuery(query1);
	while(rs1.next())
	{
		
    	PI=rs1.getInt("planeid") ;
  		OA=rs1.getString("originap"); 
  		DA=rs1.getString("destap") ;
  		CT=rs1.getString("country") ;
  		EC=rs1.getFloat("econ") ;
  		BS=rs1.getFloat("buss") ;
  		FS=rs1.getFloat("first") ;
  		DD=rs1.getString("dtdepart"); 
  		DAR=rs1.getString("dtarrive") ;
      	FT=rs1.getFloat("flighttime") ;

	}
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
    
    query = "UPDATE assignment.flightschedule SET planeid=?, originap=?, destap=?, country=?,econ=?, buss=?, first=?,  dtdepart=?, dtarrive=?, flighttime=? WHERE flightid=?;";
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setInt(1,compare2(ID,PI));
    stmt.setString(2,compare(ORIGIN,OA));
    stmt.setString(3,compare(DEST,DA));
    stmt.setString(4,compare(COUNT,CT));
    stmt.setFloat(5,compare1(ECON,EC));
    stmt.setFloat(6,compare1(BUSS,BS));
    stmt.setFloat(7,compare1(FIRST,FS));
    stmt.setString(8,compare(DEPART,DD));
    stmt.setString(9,compare(ARRIVE,DAR));
    stmt.setFloat(10,compare1(FLIGHT,FT));
    stmt.setString(11,FID);
    stmt.executeUpdate();                       
    stmt.close();
	con.close();
	}
catch(Exception e){       
	error=true;
	hello=e.getMessage();
} 
if(error){
	response.sendRedirect("updateanddelete.jsp?iswrk1=no");	
}
else{
	response.sendRedirect("updateanddelete.jsp?iswrk1=yes");	
}
%>
<%!
public String compare(String a ,String b) { 
if (a.equals("")){
	a=b;
}
return a;
} 
public float compare1(float a ,float b) { 
if (a==0){
	a=b;
}
return a;
} 
public int compare2(int a ,int b) { 
if (a==0){
	a=b;
}
return a;
} 
public String nulll(String h) { 
	String a;
if (h.equals("")){
	a="0";
}else{
a=h;
}
return a;
} 
%>
</body>
</html>