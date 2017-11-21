<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import ="java.sql.*"
    %>
<!DOCTYPE HTML>
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
			#section1 {padding-top: 50px;padding-bottom: 50px;padding-left: 50px; min-height: 500px; background-color: #EFEFEF;}
			#section2 {padding-top: 100px; min-height: 500px; color: white; background-color: #00243d;}
			#section3 {padding-top: 100px; min-height: 500px; background-color: #EFEFEF;}
			#section4 {padding-top: 100px; min-height: 500px; color: white; background-color: #00243d;}
			#section5 {padding-top: 70px; min-height: 1000px; background-color: #EFEFEF;}
			.desc {margin-left: 50px; margin-right: 20px;}
			.text {font-size: 20px}
			#wallpaper1 {height: 500px; width: 100%;}
			#wallpaper2 {height: 500px; width: 100%;}
			#wallpaper3 {height: 500px; width: 100%;}
			.advanced-search {width:1000px;}
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
		<% String connectionPassword = "52630906"; %>
	</head>
	<body data-spy="scroll" data-target=".navbar" data-offset="50">
		<%@ include file = "header.html" %>

		<!-- Affixed navigation bar -->
		<div class="nav-wrapper">
			<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="497" style="margin:auto;">
				<div class="navbar-header">
					<a class="navbar-brand" href="#top" style="font-size: 30px;"><b>SP Airlines</b></a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="index.jsp/#section1">Definition</a></li>
					<li><a href="index.jsp/#section2">History</a></li>
					<li><a href="index.jsp/#section3">Engine</a></li>
					<li><a href="index.jsp/#section4">Creed</a></li>
					<li><a href="index.jsp/#section5">Advanced Search</a></li>
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
<section id="section1" class="container-fluid">
<form action="SetMemberServlet" >
<legend><h1>Sign up as member</h1></legend>
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
<%@ include file = "footer.html" %>
		
	</body>
</html>
