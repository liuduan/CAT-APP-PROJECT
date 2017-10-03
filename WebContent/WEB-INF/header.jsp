<<<<<<< HEAD
<<<<<<< HEAD
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
=======
<%@page pageEncoding="UTF-8" %>
=======

>>>>>>> SS-Master/master
<!-- Navigation -->
<%@ page import="com.catapp.entity.User"%>
>>>>>>> SS-Master/master

<nav class="navbar navbar-inverse navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="BackToHomeServlet">Cat-App Database</a>
	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown"><a class="dropdown-toggle navbar-brand"
			data-toggle="dropdown" href="#"> <% String fName=((User)request.getSession().getAttribute("user")).getFirst_name().toString();%>

				<span>Welcome <%=fName %><span /> <i class="fa fa-caret-down"></i></a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="UserDisplayController"><i
						class="fa fa-user fa-fw"></i> User Profile</a></li>

				<li class="divider"></li>
				<li><a href="LogoutServlet"><i class="fa fa-sign-out fa-fw"></i>
						Logout</a></li>
			</ul> 
		<li ><a class="navbar-brand" href="BackToHomeServlet"> Home</a></li>
		<li ><a class="navbar-brand" href="redirect?destination=contact"> Contact us</a></li>
		<li ><a class="navbar-brand" href="redirect?destination=about"> About us</a></li>
		
	</ul>
</nav>

<<<<<<< HEAD
<<<<<<< HEAD
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
</body>
</html>
>>>>>>> SS-Master/master
=======
<script src="/CAT-APP-PROJECT/resources/js/jquery.min.js"></script>
>>>>>>> SS-Master/master
=======
<script src="/CAT-APP-PROJECT/resources/js/jquery.min.js"></script>
>>>>>>> SS-Master/master
