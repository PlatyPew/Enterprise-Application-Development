<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    %>
<%@ include file = "constants.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String query;
String ID = request.getParameter("ai");
String MOD = request.getParameter("am");
String FLIGHTNUM = request.getParameter("afn");
String cap = request.getParameter("fpc");
String IMG = request.getParameter("pic");
int CAP=0;
String hello="";
int ID1=0;
String MOD1="";
String FLIGHTNUM1="";
String IMG1="";
boolean error=false;
if(cap.equals("")!=true){
try  
{  
	CAP =Integer.parseInt(cap);
}  
catch(NumberFormatException stri)  
{  
	error=true;
	
}
}
int CAP1=0;
try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
	String query1="select * from assignment.airplanes WHERE id='"+ID+"';";
	Statement stmtn=conn.createStatement();
	ResultSet rs1=stmtn.executeQuery(query1);
	while(rs1.next())
	{
ID1=rs1.getInt("id");
MOD1=rs1.getString("model") ;
FLIGHTNUM1=rs1.getString("flightnumber");
CAP1=rs1.getInt("passengercap") ;
IMG1=rs1.getString("imageurl") ;

	}
	stmtn.close();
	conn.close();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
    query = "UPDATE assignment.airplanes SET model=? ,flightnumber=?,passengercap=? ,imageurl=? WHERE id=?;";
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setString(1,compare(MOD,MOD1));
    stmt.setString(2,compare(FLIGHTNUM,FLIGHTNUM1));
    stmt.setInt(3,compare1(CAP,CAP1));
    stmt.setString(4,compare(IMG,IMG1));
    stmt.setString(5,ID);
    stmt.executeUpdate();                       
    stmt.close();
	con.close();
	}
catch(Exception e){       
	error=true;
	hello=e.getMessage();
} 
if(error){
	response.sendRedirect("updateanddelete.jsp?iswork=no");	
}
else{
	response.sendRedirect("updateanddelete.jsp?iswork=yes");	
}
%>
<%!
public String compare(String a ,String b) { 
if (a.equals("")){
	a=b;
}
return a;
} 
public int compare1(int a ,int b) { 
if (a==0){
	a=b;
}
return a;
} 
%>
</body>
</html>