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
			#section1 {padding-top: 100px; min-height: 500px; background-color: #EFEFEF;}
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
	<body data-spy="scroll" data-target=".navbar" data-offset="50">
		<%@ include file = "header.html" %>

		<!-- Affixed navigation bar -->
		<div class="nav-wrapper">
			<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="497" style="margin:auto;">
				<div class="navbar-header">
					<a class="navbar-brand" href="#top" style="font-size: 30px;"><b>SP Airlines</b></a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="#section1">Definition</a></li>
					<li><a href="#section2">History</a></li>
					<li><a href="#section3">Engine</a></li>
					<li><a href="#section4">Creed</a></li>
					<li><a href="#section5">Advanced Search</a></li>
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
		<!-- Main Sections -->
		<section id="section1" class="container-fluid">
			<img src="http://www.airport-ohare.com/images/airlines17/united-airlines.png" alt="fight club" class="desc" style="float: left">
			<article>
				<h1>Definition</h1>
				<p class="text">An airplane or aeroplane is a powered, fixed-wing aircraft that is propelled forward by thrust from a jet engine or propeller. Airplanes come in a variety of sizes, shapes, and wing configurations. The broad spectrum of uses for airplanes includes recreation, transportation of goods and people, military, and research. Commercial aviation is a massive industry involving the flying of tens of thousands of passengers daily on airliners. Most airplanes are flown by a pilot on board the aircraft, but some are designed to be remotely or computer-controlled.</p>
			</article>
		</section>
		<section id="section2" class="container-fluid">
			<img src="http://www.airport-ohare.com/images/airlines17/united-airlines.png" alt="fight club" class="desc" style="float: left">
			<article>
				<h1>History</h1>
				<p class="text">The Wright brothers invented and flew the first airplane in 1903, recognized as "the first sustained and controlled heavier-than-air powered flight". They built on the works of George Cayley dating from 1799, when he set forth the concept of the modern airplane . Between 1867 and 1896, the German pioneer of human aviation Otto Lilienthal also studied heavier-than-air flight. Following its limited use in World War I, aircraft technology continued to develop. Airplanes had a presence in all the major battles of World War II. The first jet aircraft was the German Heinkel He 178 in 1939. The first jet airliner, the de Havilland Comet, was introduced in 1952. The Boeing 707, the first widely successful commercial jet, was in commercial service for more than 50 years, from 1958 to at least 2013.</p>
			</article>
		</section>
		<section id="section3" class="container-fluid">
			<img src="http://www.airport-ohare.com/images/airlines17/united-airlines.png" alt="fight club" class="desc" style="float: left">
			<article>
				<h1>Engine</h1>
				<p class="text">Jet aircraft are propelled by jet engines, which are used because the aerodynamic limitations of propellers do not apply to jet propulsion. These engines are much more powerful than a reciprocating engine for a given size or weight and are comparatively quiet and work well at higher altitude. Most modern jet planes use turbofan jet engines which balance the advantages of a propeller, while retaining the exhaust speed and power of a jet. This is essentially a ducted propeller attached to a jet engine, much like a turboprop, but with a smaller diameter. When installed on an airliner, it is efficient so long as it remains below the speed of sound . Jet fighters and other supersonic aircraft that do not spend a great deal of time supersonic also often use turbofans, but to function, air intake ducting is needed to slow the air down so that when it arrives at the front of the turbofan, it is subsonic. When passing through the engine, it is then re-accelerated back to supersonic speeds. To further boost the power output, fuel is dumped into the exhaust stream, where it ignites.</p>
			</article>
		</section>
		<section id="section4" class="container-fluid">
			<img src="http://www.airport-ohare.com/images/airlines17/united-airlines.png" alt="fight club" class="desc" style="float: left">
			<article>
				<h1>Creed</h1>
				<p class="text">We fly planes. All kind of planes ,big planes, small planes medium planes. We fly through the sky whooshing all the way. We fast planes, with us, you are never late because we, never late. We fly through the sky fast , some might say lightning fast, but we are humble and good people. We see passengers as royalty and food will always be provide . We serve good food straight from microwaves, warm and delicious no veggies . So come, fly with us through the sky as we serve you one by one.</p>
			</article>
		</section>
		<section id="section5" class="container-fluid">
			<article class="desc">
				<form action="advancedsearch.jsp">
					<legend><h1>Advanced Search</h1></legend>
					
					<div class="form-group">
						<label for="flightNum">Flight Number<input type="text" class="form-control advanced-search" placeholder="Flight Number" name="flightNum"></label>
					</div>
					<div class="form-group">
						<label for="originAp">Origin Airport<input type="text" class="form-control advanced-search" placeholder="Origin Airport" name="originAp"></label>
					</div>
					<div class="form-group">
						<label for="destAp">Destination Airport<input type="text" class="form-control advanced-search" placeholder="Destination Airport" name="destAp"></label>
					</div>
					<div class="form-group">
						<label for="country">Country<input type="text" class="form-control advanced-search" placeholder="Country" name="country"></label>
					</div>
					<div class="form-group">
						<label for="price">Pricing<input type="text" class="form-control advanced-search" placeholder="Pricing" name="price"></label>
					</div>
					<div class="form-group">
						<label for="dtDepart">Date of Departure<input type="date" class="form-control advanced-search" name="dtDepart"></label>
					</div>
					<div class="form-group">
						<label for="dtArrive">Date of Arrival<input type="date" class="form-control advanced-search" name="dtArrive"></label>
					</div>
					<div class="form-group">
						<label for="model">Airplane Model<input type="text" class="form-control advanced-search" placeholder="Airplane Model" name="model"></label>
					</div>
					
					<button type="submit" class="btn btn-success">Submit</button>
					<input class="btn btn-info" type="reset">
				</form>
			</article>
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