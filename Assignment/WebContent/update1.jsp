<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    import="java.io.*"
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
	#section1 {padding-top: 50px; padding-bottom:50px; min-height: 550px; background-color: #EFEFEF; border-bottom: 1px solid #D6D6D6;}
	.add {width:600px;}
</style>
</head>
<body>
<%@ include file = "adminheader.html" %>

<div class="nav-wrapper">
	<nav id="site-navigation" class="container-fluid navbar navbar-inverse" data-spy="affix" data-offset-top="160" style="margin:auto;">
		<div class="navbar-header">
			<a class="navbar-brand" href="#top" style="font-size: 30px;"><b>SP Airlines</b></a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="admin.jsp">Main Admin Page</a></li>
			<li><a href="viewlogs.jsp">Logs</a></li>
			<li><a href="signup1.jsp">Sign up</a></li>
			<li class="active"><a href="updateanddelete.jsp">Update&sol;Delete</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<%
				boolean auth = false;
				// Show username on page
				if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")&&(session.getAttribute("role") == null) || (session.getAttribute("role") == ""))||!(session.getAttribute("role").equals("adm"))) {
					response.sendRedirect("login.jsp");
			    	
			    } else {
					out.print("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> " + session.getAttribute("userid") + "</a></li>");
					auth = true;
				}
			%>
			<li><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span> Exit to homepage</a></li>
		</ul>
	</nav>
</div>
<section id="section1" class="contatiner-fluid">
	<button onclick="window.location.href='updateanddelete.jsp'" type="button" class="btn btn-default" style="margin-left: 20px;">
		<span class="glyphicon glyphicon-arrow-left"></span> Back to Update and Delete page
	</button>
	<div style="margin-left: 31%;">
		<legend><h3>Airplane Data</h3></legend>
		<form action="planesupdate.jsp">
			<%
				String ID = request.getParameter("update");
				String query;
				String mod="";
				String flin="";
				int pass=0;
				String url="";
				  try {
					    Class.forName("com.mysql.jdbc.Driver").newInstance();
					    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/assignment?user=root&password=" + passwd);
					    Statement stmtn = (Statement) conn.createStatement();
					    query = "SELECT * FROM airplanes WHERE id='"+ID+"';";
					    ResultSet rsn = stmtn.executeQuery(query); 
					    while(rsn.next()){
					    	mod =rsn.getString("model");
					    	flin=rsn.getString("flightnumber");
					    	pass=rsn.getInt("passengercap");
					    	url=rsn.getString("imageurl");
					    }
					    stmtn.close();
						conn.close();
				  }
					catch(SQLException e){       
					   System.out.println(e);       
					}
			%>
		    <input type="hidden" name="ai" value="<%=ID%>">
		    
		    <div class="form-group">
				<label for="am">Aircraft Model<input type="text" class="form-control add" placeholder="Aircraft Model" name="am" value="<%= mod %>" required></label>
			</div>
			<div class="form-group">
				<label for="afn">Aircraft Flight Number<input type="text" class="form-control add" placeholder="Aircraft Flight Number" name="afn" value="<%= flin %>" required></label>
			</div>
			<div class="form-group">
				<label for="fpc">Flight Passenger Capacity<input type="text" class="form-control add" placeholder="Flight Passenger Capacity" name="fpc" value="<%= pass %>" required></label>
			</div>
			<div class="form-group">
				<label for="pic">Image URL 
			  <select class="form-control add" name="pic">
			  	<option value=""></option>
			  <%
				  int i=0;
				  File jsp = new File("C:/Users/chuny/workspace/OnlineShop1/WebContent/images/uploadedimages/");  //change to your path to uploaded images
				  File[] list = jsp.listFiles();
				  File check=new File(url);
			  %>
				<%
					while(i<list.length){
						if(list[i].equals(check)){
					  %>
						<option value="<%=list[i] %>" selected="selected"><%=list[i] %> </option>
						<%  
				  }else{
				  %>
				<option value="<%=list[i] %>" ><%=list[i]%></option>
				<%
				  }
				i++;
				}
			  	%>   
			</select>
			</label>
			</div>
		  <input type="submit" class="btn btn-success" value="Update">
		</form> 
		<br><br>
		<form enctype="multipart/form-data" action="upload.jsp" method=POST>
			
			<input name="F1" class="btn btn-info" type="file">
			<br>
			<input type="submit" class="btn btn-success" value="Send File">
		</form>
	</div>
</section>
<%@ include file = "footer.html" %>
</body>
</html>