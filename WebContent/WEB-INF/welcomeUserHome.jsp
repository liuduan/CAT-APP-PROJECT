<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.catapp.entity.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>




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
    
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body style="background-color: Azure">
<jsp:directive.include file="Header.jsp" />
<% String Email =((User)request.getSession().getAttribute("user")).getEmail().toString(); %>  



<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/catapp"
     user="root"  password="root"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from users where Email = "<%=Email%>";
</sql:query>





  <div id="wrapper">
       
        
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse" style="padding-left: 30px; padding-top: 15px;">
                <ul class="nav" id="main-menu" style="background-color: white">
                    <li class="text-center user-image-back" style="background-color: white">
                       
                        <img src="/CAT-APP-PROJECT/resources/images/find_user.png" class="img-responsive" />
                     
                    </li>
                   

                    <li style="margin-top:10px;margin-left: 10px">
                    <b>Institution name<b></b> <br>
                    Texas A&M University
                 
                    </li>
                    <li style="margin-top:10px;margin-left: 10px">
                    Last login <br>
                    01/21/2017 20:08:09
                    <%-- 
                  	<% String Last_login =((User)request.getSession().getAttribute("user")).getLast_login_time().toString(); %>      
					<%=Last_login %>
					--%>
                 

                    </li>
                     
                    <li style="margin-top:10px;margin-left: 10px">
                    
                    <b>Supervisor name</b><br>
                    Liu Duan
                 
                    </li>
                    <li style="margin-top:10px;margin-left: 10px">
                    
                    <b>Supervisor mail</b><br>
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
                        <% String First_name =((User)request.getSession().getAttribute("user")).getFirst_name().toString(); %>
                        <% String Last_name =((User)request.getSession().getAttribute("user")).getLast_name().toString(); %>
						<h1>Welcome <%=First_name %> <%=Last_name %> </h1>
						
						<h3>From ${result.rows[0].supervisor_name} group at ${result.rows[0].institution}. </h3>
						<br>

						<h3>Use <strong>Download</strong> and <strong>Upload</strong> button to manage files related to a project.</h3>

		
                    </div>
                </div>
                <!-- /. ROW  -->
                
             	
             	<!-- Call to Action Well -->
        <br><br>



        <!-- Content Row -->
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                    	<img src="/CAT-APP-PROJECT/resources/images/Oil.jpg" height="150" />
                        
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
                        <img src="/CAT-APP-PROJECT/resources/images/piechart.jpg" height="150" />
                        
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
                        <img src="/CAT-APP-PROJECT/resources/images/leaf.png" height="150"/>
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
    </div>    <!-- /.row -->
</div>      <!-- /. ROW  -->

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
