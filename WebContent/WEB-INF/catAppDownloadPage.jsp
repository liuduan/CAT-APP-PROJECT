<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CAT-APP</title>

    <!-- Bootstrap Core CSS -->
    <link href="/CAT-APP-PROJECT/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/CAT-APP-PROJECT/resources/css/catAppDown.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/CAT-APP-PROJECT/resources/css/full-width-pics.css" rel="stylesheet">
	<link href="/CAT-APP-PROJECT/resources/css/login.css" rel="stylesheet">
	<link href="/CAT-APP-PROJECT/resources/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="/CAT-APP-PROJECT/resources/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    
</head>
<style type="text/css">
  </style>
<body>
<jsp:directive.include file="Header.jsp" />

<%-- 
<% String Is_admin =((User)request.getSession().getAttribute("user")).getIs_admin().toString(); %>
<c:set var="Is_admin" scope="session" value="<%=Is_admin %>"/>
<c:choose>
	<c:when test="${Is_admin == 'Y'}">
		<jsp:directive.include file="HeaderAdmin.jsp" />
    </c:when>    
    <c:otherwise>
        <jsp:directive.include file="Header.jsp" />
    </c:otherwise>
</c:choose>
--%>

    <div id="wrapper">
        
        
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center user-image-back" style="background-color: white">
                    <br>
                       
                       <b> Choose your options </b> 
                     <br><br>
                    </li>

					
                    <li>
                        <a href="#">CellLines</a>
                       
                        <ul class="nav nav-second-level">
                            <li >
                            
							<!-- <a href="#"><label><input type="checkbox" id="CL" name ="CL" value="2">Cardiomyocytes</label></a>
                                
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" id="CL" name ="CL" value="1">Hepatocytes</label></a>
                            </li> -->
                              <c:forEach var="cellline" items="${cell}">
                         							<li >
    												<a href="#"><label><input type="checkbox" name= "celllines" id= "celllines" value= <c:out value="${cellline.key}"/>> &nbsp;<c:out value="${cellline.value}"/></label></a>
											 		</li>
						</c:forEach>
                        </ul>
                    </li>
					<li>
                        <a href="#">Assay Name</a>
						<ul class="nav nav-second-level">
                             <c:forEach var="assaynames" items="${assay}">
                         							<li >
    												<a href="#"><label><input type="checkbox" name= "assaynames" id= "assaynames" value= <c:out value="${assaynames.key}"/>> &nbsp;<c:out value="${assaynames.value}"/></label></a>
											 		</li>
						</c:forEach>
                     
                        </ul>
                    </li>
					
                    <li>
                        <a href="#">PhenoTypes</a>
                        <ul class="nav nav-second-level">
                            <c:forEach var="phenotypes" items="${pheno}">
                         							<li >
    												<a href="#"><label><input type="checkbox" name= "phenotypes" id= "phenotypes" value= <c:out value="${phenotypes.key}"/>> &nbsp;<c:out value="${phenotypes.value}"/></label></a>
											 		</li>
						</c:forEach>
                        </ul>
                    </li>
					

                    <li>
                        <a href="#">Plate Concentration</a>
						<ul class="nav nav-second-level">
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pd" id="pd" value="1">&nbsp;10x</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pd" id= "pd" value="2">&nbsp;100x</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pd" id= "pd" value="3">&nbsp;1000x</label></a>
                            </li>
							<li>
                                <a href="#"><label><input type="checkbox" name ="pd" id= "pd" value="4">&nbsp;10000x</label></a>
                            </li>
                        </ul>
                    </li>
                   
                   <li>
                        <a href="#">Entries per page</a>
						<ul class="nav nav-second-level">
                            <li>
                                <a href="#"><label><input type="radio" name ="pg" id="pg" value="1">&nbsp;10</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="radio" name ="pg" id= "pg" value="2">&nbsp;20</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="radio" name ="pg" id= "pg" value="3">&nbsp;50</label></a>
                            </li>

                        </ul>
                    </li>
                   
                   
                   
                   
                      <li style="background-color:white">
                    <br>
					<button type="button" class="btn btn-info" style="margin-left:10px; border-radius: 5px;" onclick="searchFiles();hideJumbo();">
						 Search
					</button>
					<button type="button" class="btn btn-info" style="margin-left:10px; border-radius: 5px;" onclick="uncheckAll()">
						<span class="glyphicon glyphicon-clear"></span> Clear filter
					</button>
					</li>
					
                    
                    
</ul>

            </div>
</nav>
        
        <!-- /. NAV SIDE  -->
        
            
            	
        
        
        <div id="page-wrapper">
            <div id="page-inner">
                
                
                <div class="row">
                    <div class="col-sm-4 col-md-4 col-lg-4">
                         <!-- <div class="dropdown">
  							<button class="dropbtn">entries per page</button>
  							<div class="dropdown-content">
    						<a href="#">20</a>
    						<a href="#">50</a>
    						<a href="#">100</a>
  							</div>
						</div> -->
                    </div>
                    <div class="col-sm-4 col-md-4 col-lg-4" id="show_paginator"></div>
                    	
                
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <h3 align="center">Download Single Files Or In Bulk</h3>
                    </div>
                </div>
                
                <!-- /. ROW  -->
                <div class="container">
             
  <ul class="nav nav-pills">
    <li><a href="#" onclick=" showAllFiles();">All Files</a></li>
    <li><a href="#" onclick="showExcelFiles();" >Excel Files</a></li>
    <li><a href="#" onclick="showImages()">Images</a></li>
    <li><a href="#" onclick="showFlatFiles()">pdf</a></li>
  </ul>
  
  <div id="searchFilter">
  <div class="jumbotron hero-spacer" style="margin-top: 15px;width:70%;margin-left: 5%">
            	
            			<div class="row">
            				<div class="col-xs-6 col-sm-6 col-md-6 text-center vr-all" id="one">
            			Now searching for your file<br>
            			is easy<br><br><br>
            			Use the left pane
            				</div>
            			
            			
            			
            			
            			<div class="col-xs-6 col-sm-6 col-md-6 text-center" id="one">
            			Choose cell lines <br><br>
            			
            			Choose assay name<br><br>
            			Select phenotype<br><br>
            			Select plate design 
            			</div>
            			
            			</div>
            			
            	</div>
            </div>
            
 
  <div id="allFiles">
  <div id ="pagination">
  </div>
  
</div>
  </div>
  <div id="excelFiles" style="display: none">
  <div id ="pagination">
  </div>

  </div>
  <div id="images" style="display: none">
  
	</div>
  <div id="flatFiles" style="display: none">

  
  
</div>





          
             
                  
                  
                <!-- /. ROW  -->

            </div>
            <!-- /. PAGE INNER  -->
        </div>
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
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
	<script src="/CAT-APP-PROJECT/resources/js/Uploadjs.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/CAT-APP-PROJECT/resources/js/catAppDown.js"></script>
	<!-- <script src="/CAT-APP-PROJECT/resources/js/easyPaginate.js"></script> -->
	<script type="text/plain" src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>
	
</body>
</html>