<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.ArrayList"%>
    <%@page import="booking.*"%>
	<%@page import="review.*"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>SP Airlines</title>
		<style>
			#mybutton{margin-bottom:30px}
			.affix {top: 0; width: 100%;}
			.affix + .container-fluid {padding-top: 50px;}
			.nav-wrapper {min-height: 49px;}
			#wallpaper1 {height: 500px; width: 100%;}
			#wallpaper2 {height: 500px; width: 100%;}
			#wallpaper3 {height: 500px; width: 100%;}
			#section1 {padding-top: 50px; min-height: 500px; background-color: #EFEFEF;}
			#section2 {padding-top: 50px; min-height: 500px; background-color: #EFEFEF;}
			
			#site-navigation{z-index:3;}
			#review{height:300px;width:600px;}
			.add {width:600px;}
.comment-list .row {
  margin-bottom: 0px;
  z-index:-1;
}
.comment-list .panel .panel-heading {
  padding: 4px 15px;
  border:none;
  /*Panel-heading border radius*/
  border-top-right-radius:0px;
  top: 1px;
}
.comment-list .panel .panel-heading.right {
  border-right-width: 0px;
  /*Panel-heading border radius*/
  border-top-left-radius:0px;
  right: 16px;
}
.comment-list .panel .panel-heading .panel-body {
  padding-top: 6px;
}
.comment-list figcaption {
  /*For wrapping text in thumbnail*/
  word-wrap: break-word;
}
/* Portrait tablets and medium desktops */
@media (min-width: 768px) {
  .comment-list .arrow:after, .comment-list .arrow:before {
    content: "";
    position: absolute;
    width: 0;
    height: 0;
    border-style: solid;
    border-color: transparent;
  }
  .comment-list .panel.arrow.left:after, .comment-list .panel.arrow.left:before {
    border-left: 0;
  }
  
  
}

	</style>
		<% String connectionPassword = "52630906"; %>
	</head>
	<body>
		<%@ include file = "header.html" %>
		<% String search = request.getParameter("search"); %>
		
		<!-- Affixed navigation bar -->
		<div class="nav-wrapper">
			<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="497" style="margin:auto;">
				<div class="navbar-header">
					<a class="navbar-brand" href="index.jsp#top" style="font-size: 30px;"><b>SP Airlines</b></a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="index.jsp#section1">Definition</a></li>
					<li><a href="index.jsp#section2">History</a></li>
					<li><a href="index.jsp#section3">Engine</a></li>
					<li><a href="index.jsp#section4">Creed</a></li>
					<li><a href="index.jsp#section5">Advanced Search</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
						boolean auth = false;
						// Show username on page
						
						 if ((session.getAttribute("userid")) == null) {
							response.sendRedirect("login.jsp");}
							else {
							out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> Welcome, " + (session.getAttribute("userid")) + "!</a></li><li><a href=\"index.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span> Logout</a></li>");
							auth = true;
						}
					%>
					<li>
						<form class="navbar-form navbar-left" action="search.jsp">
							<div class="form-group">
								
								<input type="text" class="form-control" placeholder="Search" name="search" <% if(search != null){out.print("value=\"" + search + "\"");} %> required>
							</div>
							<button class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
						</form>
					</li>
				</ul>
			</nav>
		</div>
		<section id="section1" class="container-fluid">
		<form action="setreviewServlet" method="post" id ="form">
					<legend><h1>Comments</h1></legend>
					<input type="hidden"  name="jsptype" value="BOOKING">
					<div class="form-group">
						<b>Username:<%="\t"+(session.getAttribute("userid"))%></b>
					</div>
					<input type="hidden" id="user" name="user" value="<%=(session.getAttribute("userid"))%>">
					<input type="hidden" id="img" name="img" value="<%=(session.getAttribute("img"))%>">
					<div class="form-group">
						<label for="review">Review:<textarea type="text" class="form-control" name="revi" id="review" rows="5"></textarea>
					</div>
					
					<button type="submit" class="btn btn-success">Submit</button>
					<input class="btn btn-info" type="reset">
					
					<%
					String logi=request.getQueryString();
					System.out.println("this "+logi);
					CharSequence iw="iswork";
					if(logi!=null && logi.contains(iw)){
						System.out.println("IN "+logi);
						if (request.getParameter("iswork").equals("yes")) {
							System.out.println("YES "+logi);
							out.println("<br><br><div id=\"success-alert1\" class=\"alert alert-success fade out add\"><p style=\"text-align: center;\">Review entered!</p></div>");
						} else if (request.getParameter("iswork").equals("no")) { 
							System.out.println("NO "+logi);
						out.println("<br><br><div id=\"danger-alert1\" class=\"alert alert-danger fade out add\"><p style=\"text-align: center;\">Review could not be entered in database due to invalid input, please try again</p></div>");
						}
					}
				%>
				</form><br>
				<form action="getreviewServlet" method="post">
						<button type="submit" class="btn btn-success">View Reviews</button>
					</form><br>
</section>

<% 
try{
ArrayList<review> reviews=(ArrayList<review>)request.getAttribute("review");
out.println("<section id=\"section2\" class=\"container-fluid\">");
for (review a :reviews){
	%>          <article class="row">
            <div class="col-md-2 col-sm-2 hidden-xs">
              <figure class="thumbnail">
                <img class="img-responsive" src="<%=a.getImg()%>" />
                <figcaption class="text-center"><%= a.getUsername()%></figcaption>
              </figure>
            </div>
            <div class="col-md-10 col-sm-10">
              <div class="panel panel-default arrow left">
                <div class="panel-body">
                  <header class="text-left">
                    <div class="comment-user"><i class="fa fa-user"></i> <%= a.getUsername()%></div>
                    <time class="comment-date" ><i class="fa fa-clock-o"></i> <%=a.getDate()%></time>
                  </header>
                  <div class="comment-post">
                    <p>
                   <%= a.getReviews()%>
                    </p>
                  </div>
                 </div>
              </div>
            </div>
          </article><%
}
%>
<br><button onclick="hide()"class="btn btn-info btn-lg" id="mybutton"> <span class="glyphicon glyphicon-menu-up"></span> Hide</button>
<%
out.println("</section>");

}catch(Exception e){
	
}

%>

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
			$("#success-alert1").fadeTo(4000, 500).slideUp(500, function() {
				$("#success-alert1").slideUp(500);
			});
			
			$("#danger-alert1").fadeTo(4000, 500).slideUp(500, function() {
				$("#danger-alert1").slideUp(500);
			});
			function hide() {
				var returns = document.getElementById('section2');
				returns.style.display = 'none';		 
				}
			
		</script>
	</body>
	
</html>