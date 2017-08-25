<<<<<<< HEAD

 
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

	<div class="container-fluid">
		<div class="navbar-header" >
            <font style = "font-color: white; font-size:28px; font-weight:900;">
 				<a class="navbar-brand" href="${pageContext.request.contextPath}"> CAT-APP</a>
 				</font>
    	</div><!-- end of <div class="navbar-header" > -->
 
    	
      	<ul class="nav navbar-nav">
        	<li><a href="${pageContext.request.contextPath}/BackToHomeServlet">
        			<span class="glyphicon glyphicon-home"></span> User Home</a></li>
        </ul>
    	<ul class="nav navbar-nav navbar-right">
  			<li>
        		<a href="UserDisplayController"><span class="glyphicon glyphicon-user"></span> User profile</a></li>

            <li id="Contact" >
               	<a href="LogoutServlet">
               		<span class="glyphicon glyphicon-log-out"></span> Logout</a></li> 
      	</ul>
    	
 	</div><!-- end of class = container-fluid -->
 </nav>		<!-- end of vav-->
=======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<a class="navbar-brand" href="#" style="float: left"></a>
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<form action="" method="get">
				<a href="BackToMainServlet" class="navbar-brand">CAT-APP</a>
			</form>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1" style="float: right">

			<ul class="nav navbar-nav">

				<li><a href="#about">About us</a></li>
				<li><a href="#contact"> Contact</a></li>

			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
</body>
</html>
>>>>>>> SS-Master/master
