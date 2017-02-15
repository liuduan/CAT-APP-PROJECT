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
.span12{
border:none;
background-color:silver;
margin-left: 5 px;
padding-left: 15 px;
margin-right: 20px;
 
}  
.spacer {
    margin-top: 40px; /* define margin as you see fit */
    
}
.scrollDiv{
	max-height:500px;
    overflow-y:scroll;
    overflow-x:hidden;
}
::-webkit-scrollbar {
    width: 8px;
}
 
::-webkit-scrollbar-track {
    -webkit-box-shadow:none;
    border-radius: 0px;
    background-color:#aaa;
}
 
::-webkit-scrollbar-thumb {
    border-radius: 0px;
    -webkit-box-shadow: inset 1px 1px 6px #333; 
    background-color:#666;
}

.dropbtn {
    background-color: #4CAF50;
    color: white;
    
    
    border: none;
    cursor: pointer;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
  </style>
<body>

<script>
function showAllFiles(){
	document.getElementById('allFiles').style.display="block";
	document.getElementById('excelFiles').style.display="none";
	document.getElementById('images').style.display="none";
	document.getElementById('flatFiles').style.display="none";
}
function showExcelFiles(){
	document.getElementById('allFiles').style.display="none";
	document.getElementById('excelFiles').style.display="block";
	document.getElementById('images').style.display="none";
	document.getElementById('flatFiles').style.display="none";
}
function showImages(){
	document.getElementById('allFiles').style.display="none";
	document.getElementById('excelFiles').style.display="none";
	document.getElementById('images').style.display="block";
	document.getElementById('flatFiles').style.display="none";
}
function showFlatFiles(){
	document.getElementById('allFiles').style.display="none";
	document.getElementById('excelFiles').style.display="none";
	document.getElementById('images').style.display="none";
	document.getElementById('flatFiles').style.display="block";
}



</script>
    <div id="wrapper">
        <jsp:include page="headerUserHome.jsp" /> 
        
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center user-image-back">
                        <img src="/CAT-APP-PROJECT/images/find_user.png" class="img-responsive" />
                     
                    </li>


                    <li>
                        <a href="#"><i class="fa fa-edit "></i>CellLines<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li >
							<a href="#"><label><input type="checkbox" value="">Cardiomyocytes</label></a>
                                
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" value="">Hepatocytes</label></a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="#"><i class="fa fa-table "></i>Assay Name</a>
						<ul class="nav nav-second-level">
                            <li>
                                <a href="#"><label><input type="checkbox" value="">Ca2+</label></a>
                            </li>
							<li>
                                <a href="#"><label><input type="checkbox" value="">Hoechst</label></a>
                            </li>
                     
                        </ul>
                    </li>
					
                    <li>
                        <a href="#"><i class="fa fa-edit "></i>PhenoTypes<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#"><label><input type="checkbox" value="">PF</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" value="">PW</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" value="">PW10</label></a>
                            </li>
                        </ul>
                    </li>
					

                    <li>
                        <a href="#"><i class="fa fa-table "></i>Plate Design</a>
						<ul class="nav nav-second-level">
                            <li>
                                <a href="#"><label><input type="checkbox" value="">Plate 1</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" value="">Plate 2</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" value="">Plate 3</label></a>
                            </li>
							<li>
                                <a href="#"><label><input type="checkbox" value="">Plate 4</label></a>
                            </li>
                        </ul>
                    </li>
                      <li>
                    
					<button type="button" class="btn btn-info">
						<span class="glyphicon glyphicon-search"></span> Search
					</button>
					<button type="button" class="btn btn-info">
						<span class="glyphicon glyphicon-clear"></span> Clear filter
					</button>
					</li>
					
                    
                    

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
                    <div class="col-sm-4 col-md-4 col-lg-4">
                        
  						
  							<ul class="pagination">
    							<li>
      							<a href="#" aria-label="Previous">
        						<span aria-hidden="true">&laquo;</span>
      							</a>
    							</li>
    							<li><a href="#">1</a></li>
    							<li><a href="#">2</a></li>
    							<li><a href="#">3</a></li>
    							<li><a href="#">4</a></li>
    							<li><a href="#">5</a></li>
    							<li>
     							 <a href="#" aria-label="Next">
       							 <span aria-hidden="true">&raquo;</span>
      							</a>
    							</li>
 							 </ul>	
  						
						
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <h2>Download your document</h2>
                    </div>
                </div>
                
                <!-- /. ROW  -->
                <div class="container">
             
  <ul class="nav nav-pills">
    <li class="active"><a href="#" onclick="showAllFiles()">All Files</a></li>
    <li><a href="#" onclick="showExcelFiles()">Excel Files</a></li>
    <li><a href="#" onclick="showImages()">Images</a></li>
    <li><a href="#" onclick="showFlatFiles()">Flat Files</a></li>
  </ul>
  <div id=allFiles>
  	
  		<div class="scrollDiv">
     	 <div class="row well well-sm span12 spacer" style="width:60;margin-left: 5%">
  		<label><input type="checkbox" name="optradio">sample.xls</label>
		</div>
		
  		<div class="row well well-sm span12 spacer" style="width:60;margin-left: 5%">
  		<label><input type="checkbox" name="optradio">sample.xls</label>
		</div>
		<div class="row well well-sm span12 spacer" style="width:60;margin-left: 5%">
  		<label><input type="checkbox" name="optradio">sample.jpeg</label>
		</div>
		<div class="row well well-sm span12 spacer" style="width:60;margin-left: 5%">
  		<label><input type="checkbox" name="optradio">sample.doc</label>
		</div>
	
	<div class="row">
					<div class="col-xs-3 col-sm-3 col-md-3">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Download">
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3">
						<input type="submit" class="btn btn-lg btn-primary btn-block" value="Download All">
				</div>
</div>
</div>
  </div>
  <div id=excelFiles style="display: none">
  <div class="scrollDiv">
     	 <div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.xls</label>
		</div>
		
  		<div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.xls</label>
		</div>
		<div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.jpeg</label>
		</div>
		<div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.doc</label>
		</div>
	
	<div class="row">
					<div class="col-xs-3 col-sm-3 col-md-3">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Download">
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3">
						<input type="submit" class="btn btn-lg btn-primary btn-block" value="Download All">
				</div>
</div>
</div>
  </div>
  <div id=images style="display: none">
  <div class="scrollDiv">
     	 <div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.xls</label>
		</div>
		
  		<div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.xls</label>
		</div>
		<div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.jpeg</label>
		</div>
		<div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.doc</label>
		</div>
	
	<div class="row">
					<div class="col-xs-3 col-sm-3 col-md-3">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Download">
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3">
						<input type="submit" class="btn btn-lg btn-primary btn-block" value="Download All">
				</div>
</div>
</div>
	</div>
  <div id=flatFiles style="display: none">
  <div class="scrollDiv">
     	 <div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.xls</label>
		</div>
		
  		<div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.xls</label>
		</div>
		<div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.jpeg</label>
		</div>
		<div class="row well span12 spacer" style="width:75%">
  		<label><input type="radio" name="optradio">sample.doc</label>
		</div>
	
	<div class="row">
					<div class="col-xs-3 col-sm-3 col-md-3">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Download">
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3">
						<input type="submit" class="btn btn-lg btn-primary btn-block" value="Download All">
				</div>
</div>
  </div>
  
  
  
</div>



          
             
                  
                  
                <!-- /. ROW  -->

            </div>
            <!-- /. PAGE INNER  -->
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
</body>
</html>