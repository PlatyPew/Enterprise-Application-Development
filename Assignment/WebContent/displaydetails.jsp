<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.ArrayList"%>
    <%@page import="booking.FlightSchedule"%>
<!DOCTYPE html>
<html>
<head>
		<title>SP Airlines</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>
			.affix {top: 0; width: 100%;}
			.affix + .container-fluid {padding-top: 50px;}
			.nav-wrapper {min-height: 49px;}
			#section1 {padding-top: 20px; padding-bottom: 50px; min-height: 200px; background-color: #EFEFEF;}
			#section2 {padding-top: 20px; padding-bottom: 50px; min-height: 200px; color: white; background-color: #00243d;}
			#section3 {padding-top: 100px; min-height: 500px; background-color: #EFEFEF;}
			#section4 {padding-top: 100px; min-height: 500px; color: white; background-color: #00243d;}
			#section5 {padding-top: 70px; min-height: 1000px; background-color: #EFEFEF;}
			.desc {margin-left: 50px; margin-right: 20px;}
			.text {font-size: 20px}
			#wallpaper1 {height: 500px; width: 100%;}
			#wallpaper2 {height: 500px; width: 100%;}
			#wallpaper3 {height: 500px; width: 100%;}
			.advanced-search {width:1000px;}
		</style>	
		<script>
			//Smooth Scrolling
			$.fn.scrollBottom = function() { 
				return $(document).height() - this.scrollTop() - this.height(); 
			};
			window.onscroll = function() {myFunction()};
			$(document).ready(function(){
				$("a").on('click', function(event) {
					if (this.hash !== "") {
						event.preventDefault();
						var hash = this.hash;
						$('html, body').animate({
							scrollTop: $(hash).offset().top
						}, 400, function(){
							window.location.hash = hash;
						});
					}
				});
			});
		</script>
	</head>
<body>
<%@ include file = "header.html" %>
<div class="nav-wrapper">
	<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="497" style="margin:auto;">
		<div class="navbar-header">
			<a class="navbar-brand" href="#top" style="font-size: 30px;"><b>SP Airlines</b></a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="index.jsp#section1">Definition</a></li>
					<li><a href="index.jsp#section2">History</a></li>
					<li><a href="index.jsp#section3">Engine</a></li>
					<li><a href="index.jsp#section4">Creed</a></li>
					<li><a href="index.jsp#section5">Advanced Search</a></li>
			<li><a href="booking.jsp">Booking</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
		<%
			boolean auth = false;
			// Show username on page
			if (session.getAttribute("userid") == null||session.getAttribute("userid").equals("")) {
				out.print("<li><a href=\"signup.jsp\"><span class=\"glyphicon glyphicon-user\"></span> Sign Up</a></li><li><a href=\"login.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>");
			} else if (session.getAttribute("role").equals("adm")){
				out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Welcome, " + session.getAttribute("userid") + "!</a></li><li><a href=\"admin.jsp\"><span class=\"glyphicon glyphicon-king\"></span> Admin</a></li><li><a href=\"logout.jsp\"><span class=\"glyphicon glyphicon-log-out\"></span> Logout</a></li>");
				auth = true;
			}else{
				out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Welcome, " + session.getAttribute("userid") + "!</a></li><li><a href=\"review.jsp\"><span class=\"glyphicon glyphicon-heart-empty\"></span> Write a Review!</a></li><li><a href=\"logout.jsp\"><span class=\"glyphicon glyphicon-log-out\"></span> Logout</a></li>");
				
			}
		%>
			<li>
				<form class="navbar-form navbar-left" action="search.jsp">
					<div class="form-group">
						
						<input type="text" class="form-control" placeholder="Search" name="search" required>
					</div>
					<button class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
				</form>
			</li>
		</ul>
	</nav>
</div>
<form action="CartServlet" method="post" style="text-align: center">
<section id="section1" class="container-fluid">


<%
ArrayList<FlightSchedule> detail=(ArrayList<FlightSchedule>)request.getAttribute("detail");
String OAP = (String) request.getAttribute("OAP");
String DAP = (String) request.getAttribute("DAP");

int p1=0;
int p2=0;


String type="";


out.println("<h1>"+OAP+" &rarr; "+DAP+"</h1>");
for (FlightSchedule j :detail){
	
	if(j!=null){
		p1+=1;
		type=j.getTYPE();
		System.out.println(type);
		if(type.equals("first")){
			out.println("First class: "+j.getFIR()+"<br>");
	    	
		} else if(type.equals("bus")){
			out.println("Business class: "+j.getBUS()+"<br>");
			   
		} else if(type.equals("econ")){
			out.println("Economy class: "+j.getECON()+"<br>");
			   
		}
		%>
		Origin Airport : <%= j.getOAP()%><br>
		Destination Airport : <%= j.getDAP()%><br>
		Departure : <%=j.getDOD() %><br>
		Arrival : <%= j.getDOA()%><br>
		
		<%
		out.print("<input type=\"radio\" name=\"type1\" value="+j.getFID()+"%"+type+"%"+j.getUNOP()+" required><br>");
		out.print("<input type=\"hidden\" class=\"Check\" name=\"type12\" value="+j.getFID()+" required/><br>");
		
	
	}
	
}
%>


<%
if(p1==0){
	out.println("<h2>no such flight</h2>");
}
%>
</section>
<section id="section2" class="container-fluid">
<%


	try {
		ArrayList<FlightSchedule> returns=(ArrayList<FlightSchedule>)request.getAttribute("return");
		if(returns!=null){
			out.println("<h1>"+DAP+" &rarr; "+OAP+"</h1>");
		}
		for (FlightSchedule j:returns){
		if(j!=null){
				p2+=1;
		if(type.equals("first")){
			out.println("First class: "+j.getFIR()+"<br>");
	    	
		}if(type.equals("bus")){
			out.println("Business class: "+j.getBUS()+"<br>");
			   
		}if(type.equals("econ")){
			out.println("Economy class: "+j.getECON()+"<br>");
			   
		}
		%>
		Origin Airport : <%= j.getOAP()%><br>
		Destination Airport : <%= j.getDAP()%><br>
		Departure : <%=j.getDOD() %><br>
		Arrival : <%= j.getDOA()%><br>
		
		<%out.print("<input  type=\"radio\" name=\"type2\" value="+j.getFID()+"%"+type+"%"+j.getUNOP()+" required><br>");
		out.print("<input type=\"hidden\" class=\"Check\"  name=\"type22\" value="+j.getFID()+" required/><br>");
		
			}
		}
		if(p2==0){
			out.println("<h2>no such flight</h2>");
		}
		
		
			
	}catch(Exception e){
		System.out.println(e);
	}
	


	%>

<script>
$('.Check').dblclick(function(){

    if($(this).is(':checked'))
    {
       $(this).removeAttr('checked');
    }
});
</script>
					
<input type="submit" value="Submit" class="btn btn-success">
</form>
</section>
<%@ include file = "footer.html" %>
<script>
	$('input').on('keypress', function (event) {
	    var regex = new RegExp("^[a-zA-Z0-9\-\ ]+$");
	    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	    if (!regex.test(key)) {
	       event.preventDefault();
	       return false;
	    }
	});
</script>
</body>
</html>