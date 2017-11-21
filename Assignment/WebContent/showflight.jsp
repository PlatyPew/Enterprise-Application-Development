<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="booking.*"%>
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
<tr><th>FLIGHT ID</th>
<th>PLANE ID</th>
<th>ORIGIN AIRPORT</th>
<th>DESTINATION AIRPORT</th>
<th>COUNTRY</th>
<th>ECONOMY PRICE</th>
<th>BUSINESS PRICE</th>
<th>FIRST CLASS PRICE</th>
<th>DEPARTURE DATE</th>
<th>ARRIVAL DATE</th>
<th>FLIGHT TIME</th>
<th>AVAILABLE SEATS</th>
<th>FIRST CLASS AVAILABLE SEATS</th>
<th>BUSINESS CLASS AVAILABLE SEATS</th>
<th>ECONOMY CLASS AVAILABLE SEATS</th></tr>
<%
FlightSchedule data=(FlightSchedule)request.getAttribute("data");

%>
<tr>
<td><%=data.getFID() %></td>
<td><%=data.getPID() %></td>
<td><%=data.getOAP() %></td>
<td><%=data.getDAP() %></td>
<td><%=data.getCOUNT() %></td>
<td><%=data.getECON() %></td>
<td><%=data.getBUS() %></td>
<td><%=data.getFIR() %></td>
<td><%=data.getDOD() %></td>
<td><%=data.getDOA() %></td>
<td><%=data.getFT() %></td>
<td><%=data.getUNOP() %></td>
<td><%=data.getFNOP() %></td>
<td><%=data.getBNOP() %></td>
<td><%=data.getENOP() %></td>
</tr>
</body>
</html>