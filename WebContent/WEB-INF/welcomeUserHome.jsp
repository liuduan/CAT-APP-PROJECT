<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.catapp.entity.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import="com.catapp.action.smallTools" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CAT-APP</title>
<link rel="shortcut icon" href="/CAT-APP-PROJECT/resources/images/logo2.ico" />
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

</head>

<body style="background-color: Azure">
<% 
String Email = smallTools.safeString(((User)request.getSession().getAttribute("user")).getEmail());
String Is_admin = smallTools.safeString(((User)request.getSession().getAttribute("user")).getIs_admin());
%>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/catapp"
     user="root"  password="vibscatapp"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from users where Email = "<%=Email%>";
</sql:query>


<c:set var="Is_admin" scope="session" value="<%=Is_admin %>"/>
<c:choose>
	<c:when test="${Is_admin == 'Y'}">
		<jsp:directive.include file="HeaderAdmin.jsp" />
    </c:when>    
    <c:otherwise>
        <jsp:directive.include file="header.jsp" />
    </c:otherwise>
</c:choose>



 <br><br><br>




 <div id="wrapper">
       
        
        <!-- /. NAV TOP  -->
        <!-- <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
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
		
        </nav> -->
           
        <!-- /. NAV SIDE  -->
        <!-- <div id="page-wrapper"> -->
           
                <div class="row">
                    <div class="col-md-12">
                     
                        <% String First_name =((User)request.getSession().getAttribute("user")).getFirst_name().toString(); %>
                        <% String Last_name =((User)request.getSession().getAttribute("user")).getLast_name().toString(); %>
                        
                        <br>  
						<h2 style="font-size:2.0em; font-family:'Tahoma';" align="center">Welcome <%=First_name %> <%=Last_name %> </h2>
				
						<h4 style="font-family:'Tahoma';" align="center">From ${result.rows[0].supervisor_name} group at ${result.rows[0].institution}. </h4>
<br>
										
						<!-- <h3>Use <strong>Download</strong> and <strong>Upload</strong> button to manage files related to a project.</h3>
		 
                    </div>
                </div>
            
						
                
                <!-- /. ROW  -->
                
             	
             	<!-- Call to Action Well -->
       <!--  <br><br>
        <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                    Now managing your files is easy!
                </div>
            </div>
            /.col-lg-12
        </div> -->
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <!-- <div class="col-lg-12">
                <h2 class="page-header">Projects</h2>
            </div> -->
            <div style="margin-left:115px"class="col-md-3 col-sm-3">
                <div class="panel panel-default text-center"  style=" border-radius: 25px;">
                    <div class="panel-heading"  style=" border-radius: 20px;">
                        <img src="/CAT-APP-PROJECT/resources/images/piechart.jpg" class=" img-circle " width ="150" height ="150" "/>
                    </div>
                    <div class="panel-body">
                        <h4 style="font-size:1.4em; font-family:'Tahoma'">CAT-APP</h4>
                        
                        <div class="btn-group">
        		<div class="col-md-3">
                        <form action="CatAppDownloadPageServlet" method="post">
                        <input type="submit" class="btn btn-primary" style=" border-radius: 5px;" value="Download">
					</form>
					</div>
					<div class="col-md-3" style="margin-left:70px">
						 <form action="UploadServlet" method="post">
						<input type="submit" class="btn btn-success" style=" border-radius: 5px;" value="Upload">
						</form>
				</div></div>
                </div>
            </div>
            </div>
            <div class="col-md-3 col-sm-3" >
                <div class="panel panel-default text-center" style=" border-radius: 25px;">
                    <div class="panel-heading" style=" border-radius: 20px;" >
                       
    					<img src="/CAT-APP-PROJECT/resources/images/Oil.jpg" class=" img-circle "  width ="150" height ="150" "/>
    			
                    </div>
                    <div class="panel-body">
                        <h4 style="font-size:1.4em; font-family:'Tahoma'">ANALYTICAL</h4>
                        
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
           
            <div class="col-md-3 col-sm-3">
                <div class="panel panel-default text-center"  style=" border-radius: 25px;">
                    <div class="panel-heading"  style=" border-radius: 20px;">
                       <img src="/CAT-APP-PROJECT/resources/images/leaf.png" class=" img-circle " width ="150" height ="150" "/>
				
                    </div>
                    <div class="panel-body">
                        <h4 style="font-size:1.4em; font-family:'Tahoma'">ECO-TOX</h4>
                        
                        <div class="btn-group">
        		<div class="col-md-3">
                        <form action="CatAppDownloadPageServlet" method="post">
                       <!--  <input type="submit" class="btn btn-primary" value="Download"> -->
					</form>
					</div>
					<div class="col-md-3"  >
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
             	
             	
             	
             	
             	
             	
  
			<!-- 	</div> -->
          
             
                  
                  
                <!-- /. ROW  -->
            
            <!-- /. PAGE INNER  -->
        
        <!-- /. PAGE WRAPPER  -->
   
    <!-- /. WRAPPER  -->
 
    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p align="left">Copyright &copy; Ivan Rusyn Website 2017</p>
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
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</body>
</html>
