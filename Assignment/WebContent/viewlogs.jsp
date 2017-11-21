<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "constants.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>Insert title here</title>
	</head>
<%@page import="java.sql.*"%>
<%
if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")&&(session.getAttribute("role") == null) || (session.getAttribute("role") == ""))||!(session.getAttribute("role").equals("adm"))) {
	response.sendRedirect("login.jsp");
	
}
%>
	<body>
		<table class="table">
		<tr>
		<td>No.</td>
		<td>Name</td>
		<td>Date Time</td>
		<td>User Role</td>
		<td>Action</td>
		</tr>
		    <% 
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
		String query1="select * from assignment.log";
		Statement stmt1=con.createStatement();
		ResultSet rs1=stmt1.executeQuery(query1);
		while(rs1.next())
		{
		
		%>
		    <tr><td><%=rs1.getString("no.") %></td>
		    	<td><%=rs1.getString("name") %></td>
		  		<td><%=rs1.getString("datetime") %></td>
		  		<td><%=change(rs1.getString("role"))%></td>
		  		<td><%=rs1.getString("action") %></td>
		  		
		  		</tr>
		        <%
		
		}
		%>
		<%!public String change(String role){
			String rolee=role;
			if(role.equals("adm"))
				rolee="Admin";
			if(role.equals("mem"))
				rolee="Member";
			return rolee;
		} %>
	    </table>
	    <button onclick="window.location.href='admin.jsp'" type="button" class="btn btn-default" style="margin-left: 20px;">
			<span class="glyphicon glyphicon-arrow-left"></span> Back to Admin Page
		</button>
	</body>
</html>