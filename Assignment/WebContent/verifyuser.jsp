<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SP Airlines</title>
	</head>
	<body background="http://i3.kym-cdn.com/photos/images/facebook/000/008/602/Yotsuba_by_lynadeshiko.jpg">
		<% 
			String user = request.getParameter("user");
			String pwd = request.getParameter("pwd");
			String query;
			String role="";
			String img="";
			boolean tru=false;
			
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
				query = "SELECT usr, pwd, role, image FROM member WHERE binary usr=? AND binary pwd=?;";
				PreparedStatement stmt =  conn.prepareStatement(query);
				stmt.setString(1,user);
				stmt.setString(2,pwd);
				ResultSet rs = stmt.executeQuery();  
				if (rs.next()) {
					System.out.println("nono");
					role = rs.getString(3);
					img = rs.getString(4);
					if (img.equals("")){
						img="images/image.png";
					}
					session.setAttribute("userid", user);
					session.setAttribute("role", role);
					session.setAttribute("img", img);
					if (role.equals("mem")) {
						response.sendRedirect("index.jsp");
						tru=true;
					} else if(role.equals("adm")) {
						response.sendRedirect("admin.jsp");
						tru=true;
					}
				}
				else{
					response.sendRedirect("login.jsp?login=fail"); // Brings user to another webpage  
				}
				conn.close();
				if(tru==true){
		    	    Class.forName("com.mysql.jdbc.Driver").newInstance();
		    	    Connection connn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=abc123&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
		    	    query = "INSERT INTO assignment.log ( name, datetime, role,action ) VALUES ( ?, now(), ?,?);";
		    	    PreparedStatement stmtn =  connn.prepareStatement(query);
		    	    stmtn.setString(1,user);
		    	    stmtn.setString(2,role);
		    	    stmtn.setString(3,"login");
		    	    stmtn.executeUpdate();  
		    	    stmtn.close();
		    		connn.close();
		    	
				}	
				} catch (Exception e) {
				System.err.println("Error: " + e);
				out.print("<h1 style=\"font-size: 50px\">Oops! You broke the site!</h1><p style=\"font-size: 30px\"><a href=\"index.jsp\">Return to Civilisation</a></p>");
				}
		%>
	</body>
</html>