<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import ="java.sql.*"
%>
<%@ include file = "constants.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>Hello World</p>
<%
	int id = 0;
	String usr = "";
	String pwd = "";
	String role = "";
	try {
		Class.forName("com.mysql.jdbc.Driver"); 
		String connURL ="jdbc:mysql://localhost/assignment?user=root&password=" + passwd; 
		Connection conn = DriverManager.getConnection(connURL); 
		Statement stmt = conn.createStatement();
		// Execute SQL Command
		String sqlStr = "SELECT * FROM member";         
		ResultSet rs = stmt.executeQuery(sqlStr);
		// Process Result
		while (rs.next()) {
			id = rs.getInt("id");
			usr = rs.getString("usr");
			pwd = rs.getString("pwd");
			role = rs.getString("role");
			out.println ("ID: " + id + ", Name: " + usr + ", Password: " + pwd + ", role: " + role + "<br>");
		}
		conn.close();
	} catch (Exception e) {
		System.err.println("Error: " + e);
		out.print(e.toString());
	}
%>
</body>
</html>