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

String ID = request.getParameter("update");
String usr = request.getParameter("usr");
String pwd = request.getParameter("pwd");
String email = request.getParameter("email");
String role = request.getParameter("at");
String orig=usr;
boolean error=false;

try {
	
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
    String query = "UPDATE assignment.member SET pwd=? ,email=?,role=? ,usr=? WHERE usr=?;";
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setString(1,pwd);
    stmt.setString(2,email);
    stmt.setString(3,role);
    stmt.setString(4,usr);
    stmt.setString(5,ID);
    stmt.executeUpdate();                       
    stmt.close();
	con.close();
	}
catch(Exception e){       
	error=true;
	System.out.println(e);
} 
if(error){
	response.sendRedirect("signup1.jsp?iswork=no#alert2");	
}
else{
	response.sendRedirect("signup1.jsp?iswork=yes#alert2");	
}
%>

</body>
</html>