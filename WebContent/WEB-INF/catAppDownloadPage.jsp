<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    
    
</head>
<style type="text/css">

  </style>
<body>

<script>

</script>
<jsp:include page="headerUserHome.jsp" /> 
    <div id="wrapper">
        
        
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center user-image-back" style="background-color: white">
                       
                        <img src="/CAT-APP-PROJECT/resources/images/find_user.png" class="img-responsive" />
                     <br>
                    </li>

					
                    <li>
                        <a href="#">CellLines</a>
                        <ul class="nav nav-second-level">
                            <li >
							<a href="#"><label><input type="checkbox" id="CL" name ="CL" value="2">Cardiomyocytes</label></a>
                                
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" id="CL" name ="CL" value="1">Hepatocytes</label></a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="#">Assay Name</a>
						<ul class="nav nav-second-level">
                            <li>
                                <a href="#"><label><input type="checkbox" name = "AN" id ="AN" value="1">Ca2+</label></a>
                            </li>
							<li>
                                <a href="#"><label><input type="checkbox" name = "AN" id = "AN" value="2">Hoechst</label></a>
                            </li>
                     
                        </ul>
                    </li>
					
                    <li>
                        <a href="#">PhenoTypes</a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pt" id ="pt" value="1">PF</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" name = "pt" id = "pt" value="2">PW</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pt" id ="pt" value="3">PW10</label></a>
                            </li>
                        </ul>
                    </li>
					

                    <li>
                        <a href="#">Plate Design</a>
						<ul class="nav nav-second-level">
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pd" id="pd" value="1">Plate 1</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pd" id= "pd" value="2">Plate 2</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pd" id= "pd" value="3">Plate 3</label></a>
                            </li>
							<li>
                                <a href="#"><label><input type="checkbox" name ="pd" id= "pd" value="4">Plate 4</label></a>
                            </li>
                        </ul>
                    </li>
                      <li style="background-color:white">
                    
					<button type="button" class="btn btn-info" style="margin-left:20px" onclick="searchFiles();hideJumbo();">
						 Search
					</button>
					<button type="button" class="btn btn-info" style="margin-left:20px" onclick="uncheckAll()">
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
                         <div class="dropdown">
  							<button class="dropbtn">entries per page</button>
  							<div class="dropdown-content">
    						<a href="#">20</a>
    						<a href="#">50</a>
    						<a href="#">100</a>
  							</div>
						</div>
                    </div>
                    <div class="col-sm-4 col-md-4 col-lg-4" id="show_paginator"></div>
                    	
                
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <h2>Download your document</h2>
                    </div>
                </div>
                
                <!-- /. ROW  -->
                <div class="container">
             
  <ul class="nav nav-pills">
    <li><a href="#" onclick="showAllFiles()">All Files</a></li>
    <li><a href="#" onclick="showExcelFiles()">Excel Files</a></li>
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
  
</div>
  </div>
  <div id="excelFiles" style="display: none">
  

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
	<script src="/CAT-APP-PROJECT/resources/js/Uploadjs.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/CAT-APP-PROJECT/resources/js/catAppDown.js"></script>
	<!-- <script src="/CAT-APP-PROJECT/resources/js/easyPaginate.js"></script> -->
	<script type="text/plain" src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>
	
</body>
</html>