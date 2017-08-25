<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.catapp.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

<<<<<<< HEAD
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CAT-APP</title>

    <!-- Bootstrap Core CSS -->
    <link href="/CAT-APP-PROJECT/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/CAT-APP-PROJECT/resources/css/full-width-pics.css" rel="stylesheet">
	<link href="/CAT-APP-PROJECT/resources/css/login.css" rel="stylesheet">
	<link href="/CAT-APP-PROJECT/resources/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="/CAT-APP-PROJECT/resources/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    
=======
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Home</title>
<link rel="shortcut icon"
	href="/CAT-APP-PROJECT/resources/images/logo2.ico" />


<link href="/CAT-APP-PROJECT/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/CAT-APP-PROJECT/resources/css/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/CAT-APP-PROJECT/resources/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="/CAT-APP-PROJECT/resources/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<style type="text/css">
#page-wrapper {
	/* background: RGBA(24, 161, 196, 0.2); */
	background: url('/CAT-APP-PROJECT/resources/images/bgLight.jpg') repeat
		center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}
</style>
>>>>>>> SS-Master/master
</head>

<body>

<<<<<<< HEAD
   
  <div id="wrapper">
  <jsp:include page="headerAdminHome.jsp" />      
        
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center user-image-back">
                       
                        <img src="/CAT-APP-PROJECT/resources/images/find_user.png" class="img-responsive" />
                     
                    </li>
				</ul>
            </div>
		
        </nav>
        
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <% String user=(String)request.getSession().getAttribute("email");%>
						<h1>Welcome user <%=user %> </h1>
						<br>
						<h3>Now explore the projects. Click any of the projects to check out details</h3>
		
                    </div>
                </div>
                <!-- /. ROW  -->
                
             	
             	<!-- Call to Action Well -->
        <br><br>
        <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                    Now managing your files is easy!
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-4">
                <h2 align="center">CAT-APP</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <div class="btn-group">
        		<div class="col-sm-3 col-md-3">
                        <form action="CatAppDownloadPageServlet" method="post">
                        <input type="submit" class="btn btn-primary"" value="Download">
					</form>
					</div>
					<div class="col-sm-3 col-md-3" style="float:right">
						 <form action="UploadServlet" method="post">
						<input type="submit" class="btn btn-success"" value="Upload">
						</form>
				</div></div>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2 align="center">Analytical</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <div class="btn-group">
        		<div class="col-sm-3 col-md-3">
                        <form action="CatAppDownloadPageServlet" method="post">
                        <input type="submit" class="btn btn-primary"" value="Download">
					</form>
					</div>
					<div class="col-sm-3 col-md-3" style="float:right">
						 <form action="UploadServlet" method="post">
						<input type="submit" class="btn btn-success"" value="Upload">
						</form>
				</div></div>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2 align="center">ECO-TOX</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <div class="btn-group">
        		<div class="col-sm-3 col-md-3">
                        <form action="CatAppDownloadPageServlet" method="post">
                        <input type="submit" class="btn btn-primary"" value="Download">
					</form>
					</div>
					<div class="col-sm-3 col-md-3" style="float:right">
						 <form action="UploadServlet" method="post">
						<input type="submit" class="btn btn-success"" value="Upload">
						</form>
				</div></div>
            </div>
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->
             	
             	
             	
             	
             	
             	
  
=======

	<div id="wrapper">
		<%
			String isAdmin = ((User) request.getSession().getAttribute("user")).getIs_admin();
			if (null == isAdmin || "" == isAdmin.trim()) {
		%>
		<jsp:include page="headerUserHome.jsp" />
		<%
			}
			if ("Y".equalsIgnoreCase(isAdmin)) {
		%>
		<jsp:include page="headerAdminHome.jsp" />
		<%
			}
		%>



		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<%
							String firstName = ((User) request.getSession().getAttribute("user")).getFirst_name().toString();
						%>
						<h1>
							Welcome
							<%=firstName%>
						</h1>
						<br>
					</div>
				</div>
				<!-- /. ROW  -->


				<!-- Call to Action Well -->
				<br> <br>


				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-bar-chart-o fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge"></div>
										<div>CAT-APP</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">




									<span class="pull-left">
										<form action="CatAppDownloadPageServlet" method="post">
											<button type="submit" class="btn btn-primary btn-xs">Download</button>
										</form>
									</span> <span class="pull-right">
										<form action="UploadServlet" method="post">
											<input type="submit" class="btn btn-primary btn-xs"
												value="Upload">
										</form>
									</span>
									<div class="clearfix"></div>


								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tint fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge"></div>
										<div>ANALYTICAL</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left"><button type="button"
											class="btn btn-success btn-xs">Download</button></span> <span
										class="pull-right"><button type="button"
											class="btn btn-success btn-xs">Upload</button></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-leaf fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge"></div>
										<div>ECO-TOX</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer" style="">
									<span class="pull-left"></span> <span class="pull-right"></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

>>>>>>> SS-Master/master
				</div>



<<<<<<< HEAD
          
             
                  
                  
                <!-- /. ROW  -->

            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
   
    <!-- /. WRAPPER  -->
 

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2017</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </footer>

    <!-- jQuery -->
    <script src="/CAT-APP-PROJECT/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/CAT-APP-PROJECT/resources/js/bootstrap.min.js"></script>
    <script src="/CAT-APP-PROJECT/resources/js/userHome.js"></script>
    <!-- JQUERY SCRIPTS -->
    <script src="/CAT-APP-PROJECT/resources/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="/CAT-APP-PROJECT/resources/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="/CAT-APP-PROJECT/resources/js/jquery.metisMenu.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="/CAT-APP-PROJECT/resources/js/custom.js"></script>
=======

			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->

		<!-- /. WRAPPER  -->


		<jsp:include page="footer.jsp" />

	</div>
	<!-- jQuery -->
	<script src="/CAT-APP-PROJECT/resources/js/jquery.min.js"></script>

	<script src="/CAT-APP-PROJECT/resources/js/metisMenu.min.js"></script>



	<!-- Bootstrap Core JavaScript -->
	<script src="/CAT-APP-PROJECT/resources/js/bootstrap.min.js"></script>

	<!-- METISMENU SCRIPTS -->
	<script src="/CAT-APP-PROJECT/resources/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="/CAT-APP-PROJECT/resources/js/sb-admin-2.js"></script>



>>>>>>> SS-Master/master

</body>

</html>
