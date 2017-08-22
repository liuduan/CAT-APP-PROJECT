<<<<<<< HEAD
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
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                 <a class="navbar-brand" href="#">CAT-APP</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float: right">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">User Account <b class="caret"></b></a>
                    	<ul class="dropdown-menu">
                    		<li><a href="UserManagementServlet">User Profile</a></li>
               				 <li><a href="#">Language Settings</a></li>
               				 <li><a href="UserManagementServlet">Change Password</a></li>
               				 <li class="divider"></li>
               				 <li><a href="#">Help Center</a></li>
               				 
                    	</ul>
                    </li>
                    <li>
                        <a href="#">Admin Page</a>
                    </li>
                    <li>
                        <a href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
</body>
</html>
=======

<!-- Navigation -->
<%@ page import="com.catapp.entity.User"%>

<nav class="navbar navbar-inverse navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="BackToHomeServlet">CAT APP</a>
	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <% String fName=((User)request.getSession().getAttribute("user")).getFirst_name().toString();%>

				<span>Welcome <%=fName %><span /> <i class="fa fa-caret-down"></i></a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="UserDisplayController"><i
						class="fa fa-user fa-fw"></i>Admin Profile</a></li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
				<li class="divider"></li>
				<li><a href="LogoutServlet"><i class="fa fa-sign-out fa-fw"></i>
						Logout</a></li>
			</ul>
		<li><a href="BackToHomeServlet"> Home</a></li>
		<li><a href="redirect?destination=contact"> Contact us</a></li>
		<li><a href="redirect?destination=about"> About us</a></li>




		<!-- /.dropdown-user -->
		</li>
		<!-- /.dropdown -->




	</ul>
	<!-- /.navbar-top-links -->



	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<!-- <li class="text-center user-image-back">
                       
                        <img src="/CAT-APP-PROJECT/resources/images/find_user.png" class="img-responsive" />
                     
                    </li> -->
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="Search...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> <!-- /input-group -->
				</li>


				<li><a href="#">CAT-APP <span class="fa arrow"></span></a>
					<ul class="nav nav-third-level">
						<li><a href="#">Download</a></li>
						<li><a href="#">Upload</a></li>

					</ul> <!-- /.nav-third-level --></li>

				<li><a href="#">ANALYTICAL <span class="fa arrow"></span></a>
					<ul class="nav nav-third-level">
						<li><a href="#">Download</a></li>
						<li><a href="#">Upload</a></li>

					</ul> <!-- /.nav-third-level --></li>

				<li><a href="#">ECO-TOX <span class="fa arrow"></span></a>
					<ul class="nav nav-third-level">

					</ul> <!-- /.nav-third-level --></li>



			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>
>>>>>>> SS-Master/master
