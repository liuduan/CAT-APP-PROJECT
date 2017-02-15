<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <!-- CUSTOM STYLES-->
    <link href="/CAT-APP-PROJECT/resources/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    
</head>

<body>

   
  <div id="wrapper">
  <jsp:include page="headerUserHome.jsp" />      
        
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
             	
             	
             	
             	
             	
             	
  
				</div>



          
             
                  
                  
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

</body>

</html>
