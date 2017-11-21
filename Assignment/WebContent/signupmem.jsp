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
String user = request.getParameter("user");
String pwd = request.getParameter("pwd");
String pwd1 = request.getParameter("pwd1");
String email = request.getParameter("email");
String query;
String x="pass";

if(pwd.equals(pwd1)==false){
	x="diff";
}
if(x.equals("diff")){}
else{
try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
    query = "INSERT INTO  assignment . member  ( usr ,  pwd ,  role , email) VALUES (?, ?, ?,?);";
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setString(1,user);
    stmt.setString(2,pwd);
    stmt.setString(3,"mem");
    stmt.setString(4,email);
    stmt.executeUpdate();
    stmt.close();
	con.close();
		}
	catch(Exception e){       

x="fail";
	}  
}

response.sendRedirect("signup.jsp?login="+x);	
%>
</body>
</html>