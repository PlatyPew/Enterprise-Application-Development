<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.ArrayList"
    import="passenger.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<table class="table">
<tr><th>PASSENGER ID</th>
<th>BOOKING ID</th>
<th>NAME</th>
</tr>
<% 
ArrayList<passenger> pass = (ArrayList<passenger>)request.getAttribute("data");
for (passenger i :pass){
%>
<tr><td><%=i.getPID() %></td>
<td><%=i.getBID() %></td>
<td><%=i.getName() %></td>

</tr>
<%
}
%>
</table>
</body>
</html>