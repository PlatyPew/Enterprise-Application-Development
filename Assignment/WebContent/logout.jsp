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

String x="pass";
try {
    	    Class.forName("com.mysql.jdbc.Driver").newInstance();
    	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
    	    query = "INSERT INTO assignment.log ( name, datetime, role ,action ) VALUES ( ?, now(), ?,?);";
    	    PreparedStatement stmtn =  conn.prepareStatement(query);
    	    stmtn.setString(1,(String)session.getAttribute("userid"));
    	    stmtn.setString(2,(String)session.getAttribute("role"));
    	    stmtn.setString(3,"logout");
    	    stmtn.executeUpdate();  
    	    stmtn.close();
    		conn.close();
    		session.setAttribute("userid", "");
			session.setAttribute("role", "");
    	}
    		catch(SQLException e){       
    			x="fail"+e;      
    			}   
    
    
if(x.equals("pass")){
	response.sendRedirect("index.jsp");
}else{
	response.sendRedirect(x);
}
%>
</body>
</html>