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
<% //AIRPLANE

boolean z=true;
String delet = request.getParameter("delete");
String[] delete = request.getParameterValues("delete");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
String query="";
PreparedStatement stmt=null;
//current implementation is to aid in possibility of multiple selections at once,incase of upgrading.
for(int i = 0; i < delete.length; i++) {
		query="DELETE FROM assignment.member WHERE usr=?;";
		stmt = con.prepareStatement(query);
		stmt.setString(1,delete[i]);
		stmt.executeUpdate();
	}



stmt.close();
con.close();
}
catch(Exception e)
{
	z=false;
}

if(z){
	response.sendRedirect("signup1.jsp?delete1=yes#alert2");	
}
else{
	response.sendRedirect("signup1.jsp?delete1=no#alert2");	
}
%>

</body>
</html>