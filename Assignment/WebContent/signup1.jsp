<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    %>
<%@ include file = "constants.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>SP Airlines</title>
		<style>
			.affix {top: 0; width: 100%;}
			.affix + .container-fluid {padding-top: 50px;}
			.nav-wrapper {min-height: 50px;}
			#section1 {padding-top: 50px; padding-bottom: 50px; min-height: 550px; background-color: #EFEFEF; border-bottom: 1px solid #D6D6D6;}
			#section2 {padding-top: 50px; padding-bottom: 50px; min-height: 300px; border-bottom: 1px solid #D6D6D6;}
			.add {width:600px;}
			input[type=radio] {
			display:none;
			}
input#thing1[type=radio] + label
{
background-image: url(images/userimages/avatarpng/1.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing1[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}input#thing2[type=radio] + label
{
background-image: url(images/userimages/avatarpng/2.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing2[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}input#thing3[type=radio] + label
{
background-image: url(images/userimages/avatarpng/3.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing3[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}input#thing4[type=radio] + label
{
background-image: url(images/userimages/avatarpng/4.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing4[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}input#thing5[type=radio] + label
{
background-image: url(images/userimages/avatarpng/5.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing5[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}input#thing6[type=radio] + label
{
background-image: url(images/userimages/avatarpng/6.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing6[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}input#thing11[type=radio] + label
{
background-image: url(images/userimages/avatarpng/11.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing11[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}input#thing12[type=radio] + label
{
background-image: url(images/userimages/avatarpng/12.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing12[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing17[type=radio] + label
{
background-image: url(images/userimages/avatarpng/17.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing17[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing18[type=radio] + label
{
background-image: url(images/userimages/avatarpng/18.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing18[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}

input#thing21[type=radio] + label
{
background-image: url(images/userimages/avatarpng/21.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing21[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}

input#thing22[type=radio] + label
{
background-image: url(images/userimages/avatarpng/22.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing22[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing23[type=radio] + label
{
background-image: url(images/userimages/avatarpng/23.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing23[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing24[type=radio] + label
{
background-image: url(images/userimages/avatarpng/24.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing24[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}

input#thing26[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing27[type=radio] + label
{
background-image: url(images/userimages/culturepng/3.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing27[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}

input#thing31[type=radio] + label
{
background-image: url(images/userimages/culturepng/7.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing31[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing32[type=radio] + label
{
background-image: url(images/userimages/culturepng/8.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing32[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing33[type=radio] + label
{
background-image: url(images/userimages/culturepng/9.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing33[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing38[type=radio] + label
{
background-image: url(images/userimages/culturepng/14.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing38[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing39[type=radio] + label
{
background-image: url(images/userimages/culturepng/15.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing39[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}

input#thing44[type=radio] + label
{
background-image: url(images/userimages/culturepng/20.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing44[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}

input#thing46[type=radio] + label
{
background-image: url(images/userimages/culturepng/36.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing46[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing47[type=radio] + label
{
background-image: url(images/userimages/culturepng/23.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing47[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing48[type=radio] + label
{
background-image: url(images/userimages/culturepng/24.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing48[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}

input#thing50[type=radio] + label
{
background-image: url(images/userimages/culturepng/26.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing50[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing51[type=radio] + label
{
background-image: url(images/userimages/culturepng/27.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing51[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing52[type=radio] + label
{
background-image: url(images/userimages/culturepng/28.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing52[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}input#thing53[type=radio] + label
{
background-image: url(images/userimages/culturepng/29.png);
background-size:     cover; 

border-color: white;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}
input#thing53[type=radio]:checked + label
{
border-color: red;
border-style: solid;
height: 70px;
width: 70px;
display:inline-block;
padding: 0 0 0 0px;
}

#total{
max-width:700px;
}
			
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
		<%@ include file = "adminheader.html" %>
		<%
			
		%>
		<div class="nav-wrapper">
			<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="160" style="margin:auto;">
				<div class="navbar-header">
					<a class="navbar-brand" href="#top" style="font-size: 30px;"><b>SP Airlines</b></a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="admin.jsp">Main Admin Page</a></li>
					<li><a href="viewlogs.jsp">Logs</a></li>
					<li class="active"><a href="#top">Sign up</a></li>
					<li><a href="updateanddelete.jsp">Update&sol;Delete</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						boolean auth = false;
						// Show username on page
						if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")&&(session.getAttribute("role") == null) || (session.getAttribute("role") == ""))||!(session.getAttribute("role").equals("adm"))) {
								response.sendRedirect("login.jsp");    	
						} else {
							out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> " + (session.getAttribute("userid")) + "</a></li>");
							auth = true;
						}
					%>
					<li><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span> Exit to homepage</a></li>
				</ul>
			</nav>
		</div>
		<section id="section1" class="container-fluid">
			<button onclick="window.location.href='admin.jsp'" type="button" class="btn btn-default" style="margin-left: 20px;">
				<span class="glyphicon glyphicon-arrow-left"></span> Back to Admin page
			</button>
			<legend><h1 style="text-align:center;">Sign up as Admin&sol;Member</h1></legend>
			<form action="SetMemberServlet" style="margin-left: 31%;">
				<div class="form-group">
					<label for="usr">Login ID<input type="text" class="form-control add" placeholder="Username" name="usr" required></label>
				</div>
				<div class="form-group">
					<label for="pwd">Password<input type="password" class="form-control add" placeholder="Password" name="pwd" required></label>
				</div>
				<div class="form-group">
					<label for="pwd1">Re-enter Password<input type="password" class="form-control add" placeholder="Re-enter Password" name="pwd1" required></label>
				</div>
				<div class="form-group">
					<label for="email">Email<input type="email" class="form-control add" placeholder="Email" name="email" required></label>
				</div>
				
				<label for="at">Account type</label>
				<select class="form-control add" name="at" required>
					<option value="mem">Member</option>
					<option value="adm">Administrator</option>
				</select>
				<label for="total" >Profile Picture:
				<div class="form-group" id ="total">
					<input type="radio" name='thing1' id="thing2" value="images/userimages/avatarpng/2.png"/><label for="thing2"></label> 
					<input type="radio" name='thing1' id="thing3" value="images/userimages/avatarpng/3.png"/><label for="thing3"></label> 
					<input type="radio" name='thing1' id="thing4" value="images/userimages/avatarpng/4.png"/><label for="thing4"></label> 
					<input type="radio" name='thing1' id="thing5" value="images/userimages/avatarpng/5.png"/><label for="thing5"></label> 
					<input type="radio" name='thing1' id="thing6" value="images/userimages/avatarpng/6.png"/><label for="thing6"></label> 
					<input type="radio" name='thing1' id="thing11" value="images/userimages/avatarpng/11.png"/><label for="thing11"></label> 
					<input type="radio" name='thing1' id="thing12" value="images/userimages/avatarpng/12.png"/><label for="thing12"></label> 
					<input type="radio" name='thing1' id="thing17" value="images/userimages/avatarpng/17.png"/><label for="thing17"></label> 
					<input type="radio" name='thing1' id="thing18" value="images/userimages/avatarpng/18.png"/><label for="thing18"></label> 
					<input type="radio" name='thing1' id="thing21" value="images/userimages/avatarpng/21.png"/><label for="thing21"></label> 
					<input type="radio" name='thing1' id="thing22" value="images/userimages/avatarpng/22.png"/><label for="thing22"></label> 
					<input type="radio" name='thing1' id="thing23" value="images/userimages/avatarpng/23.png"/><label for="thing23"></label> 
					<input type="radio" name='thing1' id="thing24" value="images/userimages/avatarpng/24.png"/><label for="thing24"></label> 
					<input type="radio" name='thing1' id="thing27" value="images/userimages/culturepng/3.png"/><label for="thing27"></label> 
					<input type="radio" name='thing1' id="thing31" value="images/userimages/culturepng/7.png"/><label for="thing31"></label> 
					<input type="radio" name='thing1' id="thing32" value="images/userimages/culturepng/8.png"/><label for="thing32"></label> 
					<input type="radio" name='thing1' id="thing33" value="images/userimages/culturepng/9.png"/><label for="thing33"></label> 
					<input type="radio" name='thing1' id="thing38" value="images/userimages/culturepng/14.png"/><label for="thing38"></label> 
					<input type="radio" name='thing1' id="thing39" value="images/userimages/culturepng/15.png"/><label for="thing39"></label> 
					<input type="radio" name='thing1' id="thing44" value="images/userimages/culturepng/20.png"/><label for="thing44"></label> 
					<input type="radio" name='thing1' id="thing46" value="images/userimages/culturepng/36.png"/><label for="thing46"></label> 
					<input type="radio" name='thing1' id="thing47" value="images/userimages/culturepng/23.png"/><label for="thing47"></label> 
					<input type="radio" name='thing1' id="thing48" value="images/userimages/culturepng/24.png"/><label for="thing48"></label> 
					<input type="radio" name='thing1' id="thing50" value="images/userimages/culturepng/26.png"/><label for="thing50"></label> 
					<input type="radio" name='thing1' id="thing51" value="images/userimages/culturepng/27.png"/><label for="thing51"></label> 
					<input type="radio" name='thing1' id="thing52" value="images/userimages/culturepng/28.png"/><label for="thing52"></label> 
					<input type="radio" name='thing1' id="thing53" value="images/userimages/culturepng/29.png"/><label for="thing53"></label> 
				</div>
				</label>
				<br>
				<input type="submit" id="alert1" class="btn btn-success" value="Submit">
				<input class="btn btn-info" type="reset">
				<%
					String logi=request.getQueryString();
					
					CharSequence iw="iswork";
					CharSequence idel="delete1";
					CharSequence login="login";
					if(logi!=null && logi.contains(login)){
						if (request.getParameter("login").equals("fail")) {
							out.println("<br><br><div id=\"danger-alert1\" class=\"alert alert-danger fade out add\"><p style=\"text-align: center;\">Username is taken!</p></div>");
						} else if ( request.getParameter("login").equals("diff")) { 
							out.println("<br><br><div id=\"danger-alert2\" class=\"alert alert-danger fade out add\"><p style=\"text-align: center;\">Different password entered!</p></div>");
						} else if ( request.getParameter("login").equals("pass")) { 
							out.println("<br><br><div id=\"success-alert1\" class=\"alert alert-success fade out add\"><p style=\"text-align: center;\">New account has been added successfully!</p></div>");
						}
					}
				%>
			</form>
		</section>
		<section id="section2" class="container-fluid" style="margin-left:50px; margin-right:50px;">
			<legend><h1 style="text-align:center;">Admin&sol;Member table</h1></legend>
			<input type="search" class="light-table-filter form-control" data-table="member" placeholder="Filter">
			<table class="table table-striped member" style="font-size:20px;">
				<thead style="font-weight:bold;">
					<tr>
						<td>User</td>
						<td>Password</td>
						<td>Email</td>
						<td>Role</td>
						<td>image</td>
						<td>Actions</td>
					</tr>
				</thead>
				<tbody>
					<%
						try {
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection connn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
							String queryyy="select * from assignment.member";
							Statement stmtt=connn.createStatement();
							ResultSet rss=stmtt.executeQuery(queryyy);
							while(rss.next()) {
					%>
					<tr>
						<td><%=rss.getString("usr") %></td>
						<td><%=rss.getString("pwd") %></td>
						<td><%=rss.getString("email") %></td>
						<td><%=hue(rss.getString("role")) %></td>
						<td><img src="<%=rss.getString("image") %>" height="90px"></td>
						<td>
							<form action="update3.jsp">
								<input type="submit" class="btn btn-info" value="Update" style="width: 70px;">
								<input type="hidden" name="update" value="<%= rss.getString("usr") %>">
								
							</form>
							<form action="delete3.jsp">
								<input type="submit" class="btn btn-danger" value="Delete" style="width: 70px;">
								<input type="hidden" name="delete" value="<%=rss.getString("usr") %>">
								
							</form>
						</td>
					</tr>
					<%
							}
							stmtt.close();
							connn.close();
						} catch(SQLException e) {
							out.println(e);
						}
					%>
					<%!
						public String hue(String heh) {
							if (heh.equals("mem")) {
								heh="Member";
							} else {
								heh="Admin";
							}
							return heh;
						}
					%>
				</tbody>
			</table>
		    <%
				if(logi!=null && logi.contains(iw)) {
					if (request.getParameter("iswork").equals("yes")) { 
						out.println("<br><br><div id=\"success-alert3\" class=\"alert alert-success fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data has been updated</p></div>");
					} else if ( request.getParameter("iswork").equals("no")) { 
						out.println("<br><br><div id=\"danger-alert4\" class=\"alert alert-danger fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data could not be updated</p></div>");
					}
				}
				if(logi != null && logi.contains(idel)){
					if (request.getParameter("delete1").equals("yes")) {
						out.println("<br><br><div id=\"success-alert2\" class=\"alert alert-success fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data deleted</p></div>");
					} else if (request.getParameter("delete1").equals("no")) { 
						out.println("<br><br><div id=\"danger-alert3\" class=\"alert alert-danger fade out add\" style=\"margin-left: 31%\"><p style=\"text-align: center;\">Data could not be deleted</p></div>");
					} 
				}
			%>
			<div id="alert2"></div>
		</section>
		<%@ include file = "footer.html" %>
		<script>
			$("#success-alert1").fadeTo(4000, 500).slideUp(500, function() {
				$("#success-alert1").slideUp(500);
			});
			
			$("#success-alert2").fadeTo(4000, 500).slideUp(500, function() {
				$("#success-alert2").slideUp(500);
			});
			
			$("#success-alert3").fadeTo(4000, 500).slideUp(500, function() {
				$("#success-alert3").slideUp(500);
			});
			
			$("#danger-alert1").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert1").slideUp(500);
			});
			
			$("#danger-alert2").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert2").slideUp(500);
			});
			
			$("#danger-alert3").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert3").slideUp(500);
			});
			
			$("#danger-alert4").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert4").slideUp(500);
			});
		</script>
		<script>(function(document) {
	'use strict';

	var LightTableFilter = (function(Arr) {

		var _input;

		function _onInputEvent(e) {
			_input = e.target;
			var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
			Arr.forEach.call(tables, function(table) {
				Arr.forEach.call(table.tBodies, function(tbody) {
					Arr.forEach.call(tbody.rows, _filter);
				});
			});
		}

		function _filter(row) {
			var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
			row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
		}

		return {
			init: function() {
				var inputs = document.getElementsByClassName('light-table-filter');
				Arr.forEach.call(inputs, function(input) {
					input.oninput = _onInputEvent;
				});
			}
		};
	})(Array.prototype);

	document.addEventListener('readystatechange', function() {
		if (document.readyState === 'complete') {
			LightTableFilter.init();
		}
	});

})(document);

</script>
	</body>
</html>