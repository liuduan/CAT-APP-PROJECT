<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.catapp.entity.User" %>
<!DOCTYPE html>
<html lang="en">

<head>

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
	<link href="/CAT-APP-PROJECT/resources/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="/CAT-APP-PROJECT/resources/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' type='text/css' />
     <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css' type='text/css' />
    
    	<link rel="stylesheet" 
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body style="background-color: Azure">

<jsp:directive.include file="Header.jsp" />
  <div id="wrapper">
       
        
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu" style="background-color: white">
                    <li class="text-center user-image-back" style="background-color: white">
                       
                        <img src="/CAT-APP-PROJECT/resources/images/find_user.png" class="img-responsive" />
                     
                    </li>
                   
                    <li style="margin-top:10px">
                    <b>Institution name<b></b> <br>
                    Texas A&M University
                 
                    </li>
                    <li style="margin-top:10px">
                    Last login <br>
                    01/21/2017 20:08:09
                 
                    </li>
                    <li style="margin-top:10px">
                    Supervisor name <br>
                    Liu Duan
                 
                    </li>
                    <li style="margin-top:10px">
                    Supervisor email <br>
                    liuduan@gmail.com
                 
                    </li>
				</ul>
            </div>
		
        </nav>
        
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <% String user=((User)request.getSession().getAttribute("user")).getFirst_name().toString();%>
						<h1>Welcome <%=user %> </h1>
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
            <div class="col-lg-12">
                <h2 class="page-header">Projects</h2>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-user fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>CAT-APP</h4>
                        
                        <div class="btn-group">
        		<div class="col-md-3">
                        <form action="CatAppDownloadPageServlet" method="post">
                        <input type="submit" class="btn btn-primary" value="Download">
					</form>
					</div>
					<div class="col-md-3" style="margin-left:70px">
						 <form action="UploadServlet" method="post">
						<input type="submit" class="btn btn-success" value="Upload">
						</form>
				</div></div>
                </div>
            </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-user fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>Analytical</h4>
                        
                        <div class="btn-group">
        		<div class="col-md-3">
                        <form action="CatAppDownloadPageServlet" method="post">
                        <!-- <input type="submit" class="btn btn-primary" value="Download"> -->
					</form>
					</div>
					<div class="col-md-3" style="margin-left:70px">
						 <form action="UploadServlet" method="post">
						<!-- <input type="submit" class="btn btn-success" value="Upload"> -->
						</form>
				</div></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-user fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>ECO-TOX</h4>
                        
                        <div class="btn-group">
        		<div class="col-md-3">
                        <form action="CatAppDownloadPageServlet" method="post">
                       <!--  <input type="submit" class="btn btn-primary" value="Download"> -->
					</form>
					</div>
					<div class="col-md-3" style="margin-left:70px">
						 <form action="UploadServlet" method="post">
						<!-- <input type="submit" class="btn btn-success" value="Upload"> -->
						</form>
				</div></div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
        <!-- /.row -->
             	
             	
             	
             	
             	
             	
  
				</div>



          
             
                  
                  
                <!-- /. ROW  -->

            </div>
            <!-- /. PAGE INNER  -->
        
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

</body>

</html>
