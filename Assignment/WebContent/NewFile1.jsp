<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String user = request.getParameter("user");
out.println("Welcome "+user);
int number = 5 ; %>
<table border=1 style="width:500px;text-align:center;">
<% for (int k=1; k<=5; k++) {
        int result = k * number; %>
<tr><td><%= k %> x 5</td><td><%= result %></td></tr>
<%      } %>
</table><hr>

</body>
</html>