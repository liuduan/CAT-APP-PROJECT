<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
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
    
</head>

<body>
<jsp:include page="header.jsp" />
    <!-- Navigation -->
   
   
   <div id="wrapper">
  <jsp:include page="headerUserHome.jsp" />      
        
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center user-image-back">
                       
                        <img src="/CAT-APP-PROJECT/images/find_user.png" class="img-responsive" />
                     
                    </li>
				</ul>
            </div>
		
        </nav>
        
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="container" id="registration">


<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="ForgotPasswordServlet" method="post">
			<fieldset>
				<h2 align="center">Change Password</h2>
				<hr class="colorgraph">		
				<div class="form-group">
                    <input type="password" id="password" name="password" class="form-control input-lg" placeholder="New Password" required="required">
				    </div>
				    <div class="form-group">
                    <input type="password" id="repassword" name="repassword" class="form-control input-lg" placeholder="Re-enter Password" required="required">
				    </div>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
					   
                        <input type="submit" class="btn btn-lg btn-success btn-block" name="pwd" value="Change" style="margin-left: 50%">
					</div>
					
				</div>
				
			</fieldset>
		</form>
	</div>
</div>

</div>
  
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
                    <p>Copyright &copy; Your Website 2014</p>
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
    <script src="/CAT-APP-PROJECT/resources/js/homepage.js"></script>

</body>

</html>
