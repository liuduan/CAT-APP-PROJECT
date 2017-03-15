<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>CAT-APP</title>
		<link rel="shortcut icon" href="/CAT-APP-PROJECT/resources/images/logo2.ico" />
        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" />
     
        <link rel="stylesheet" href="resources/css/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/css/form-elements.css">
        <link rel="stylesheet" href="resources/css/style.css"> 
		 <link href="/CAT-APP-PROJECT/resources/css/bootstrap.min.css" rel="stylesheet">
      <!--   <link href="/CAT-APP-PROJECT/resources/css/custom.css" rel="stylesheet" /> -->
        <link href="/CAT-APP-PROJECT/resources/css/full-width-pics.css" rel="stylesheet">
        <link href="/CAT-APP-PROJECT/resources/css/font-awesome.css" rel="stylesheet" />
        <link rel="shortcut icon" href="resources/images/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/images/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/images/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/images/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="resources/images/apple-touch-icon-57-precomposed.png"> 
        

<link rel="stylesheet" 	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
     
    </head>
	<style type="text/css">
	.scrollable {
    height: 300px; /* or any value */
    overflow-y: auto;
}
	
	
	
	</style>
    <body>




    <script type="text/javascript">
    function stepJump(){
    	
    	//var step1Value='<c:out value="${sessionScope.cellLine}" />';
    	//var step2Value='<c:out value="${cellline.value}"/>';
    	//alert(step1Value);
    	//alert(step2Value);
    	document.getElementById('step2').style.display="none";
    	document.getElementById('step3').style.display="none";
    	document.getElementById('step4').style.display="none";
    	document.getElementById('step5').style.display="none";
    	document.getElementById('directJumpToUpload').style.display="block";
    }
    
    function backToStep2(){
    	document.getElementById('directJumpToUpload').style.display="none";
    	document.getElementById('step4').style.display="none";
    	document.getElementById('step3').style.display="none";
    	document.getElementById('step2').style.display="block";
    }
    
    </script>
    <jsp:directive.include file="Header.jsp" />
		<!-- 	<div align="right"><a href = "/database_project/Protected/ID_home">
		<img src="/database_project/scripts/images/MB__home.png"/></a>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;</div> -->
		<!-- Top menu -->
		<!--  -->

		<!-- 
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					 <a class="navbar-brand" >Upload Files</a> 
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<!-- <div class="collapse navbar-collapse" id="top-navbar-1">
					
				</div>
			</div>
		</nav> -->


        <!-- Top content -->
        <!-- <div class="top-content"> -->
        	
           <!--  <div class="inner-bg"> -->
           
           <br></br><br></br><br></br>
                <div class="container">
                <c:if test="${param.success eq 1}">
                	<div class="page-alerts">
     					<div class="alert alert-success">
      						<button  type="button" class="close">
      							<i class="glyphicon glyphicon-remove-circle text-success"></i></button>
      						<h4>Success</h4>
      						<p>The file was uploaded successfully</p>
    					</div>
    				</div>
				</c:if>
				<c:if test="${param.success eq 2}">
				 <div class="alert alert-danger">
      			<button  href="#" type="button" class="close"><i class="glyphicon glyphicon-remove-circle text-danger"></i></button>
      			<h4>Danger Alert</h4>
      			<p>Action has caused an error. Additional information <a class="alert-link" href="">Click Here</a> to read</p>
   				 </div>
     			<div> failure </div>
				</c:if>
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text" >
                            <h1><strong>UPLOAD</strong> Files in CAT-APP</h1>
                            <div class="description">
                            	<p>
	                            	Give us Cell Types,Assay Name,Time Point, Phenotype name and Plate Id and you are <strong>good</strong> to go!
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box" style="margin-top:-50px">
                        	
                        	<form role="form" action="SaveFileFormServlet" method="post" class="registration-form" enctype="multipart/form-data">
                        		
                        		<fieldset>
		                        	<div class="form-top ">
		                        		<div class="form-top-left">
		                        			<h3>Step 1 / 5:</h3> <h4>Choose CellLine</h4>
		                            		<!-- <h4>Cell Type:</h4><p>Somewhere to Start &#9786;</p> -->
		                            		<div class="progress">
										  <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar"
										  aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width:15%">
										    0%(start)
										  </div>
										</div>
		                            		
		                        		</div>
		                        		
		                            </div>
		                            <div class="form-bottom scrollable">
				                    	<div class="form-group">
				                    		
											  
											  <c:forEach var="cellline" items="${cell}">
    												<input type="radio" name= "celllines" id= <c:out value="${cellline.value}"/> value= <c:out value="${cellline.key}"/>> &nbsp;<b><c:out value="${cellline.value}"/></b><br><br>
											  </c:forEach>
				                 			<%String celllines=request.getParameter("celllines");%>
				                 			<c:set var="cellLine" value="${celllines}" scope="session"  />
				                 				
				                        </div>
				                        
				                        <button type="button" class="btn btn-next">Next</button>
				                    </div>
			                    </fieldset>
			                    
			                    <fieldset id="step2">
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 2 / 5</h3>
		                            		<h4>Input Assay Name:</h4>
		                            		<p> A step ahead &#x1f44d;</p>
		                            		<div class="progress">
										  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar"
										  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width:25%">
										    25% Complete (cellline done)
										  </div>
										  
										</div>
										<!-- <p><font color="red"> Click upload if time point and phenotype are unavailable</font></p>
		                        		 --></div>
		                        		
		                            </div>
		                            <div class="form-bottom">
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">Assay Name</label>
				                        	<select name="assaydata" id="assay">
    											<c:forEach var="assaynames" items="${assay}">
										        <option value="${assaynames.key}"> ${assaynames.value}</option>
										    	</c:forEach>
												</select>

				                        </div>
				                      	
				                        <button type="button" class="btn btn-previous">Previous</button>
				                        <button type="button" class="btn btn-next" >Next</button>
				                         <!-- OR
				                        <button type="button" class="btn btn-primary" onclick="stepJump()">Upload</button> -->
				                    </div>
			                    </fieldset>
			                    
			                    
			                    <fieldset id="step3">
			                      <div>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 3 / 5</h3>
		                            		<h4> Select a Time Point:</h4>
		                            		<p> Bear with us &#x1f612;</p>
		                            		<div class="progress">
										  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar"
										  aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%">
										    50% Complete (assay name done)
										  </div>
										</div>
		                        		</div>
		                        		
		                            </div>
		                            <div class="form-bottom">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-facebook">Time-Point</label>
				                        	<select name="timepoint" id="tp">
    											<c:forEach var="timepoints" items="${time}">
										        <option value="${timepoints.key}"> ${timepoints.value}</option>
										    	</c:forEach>
												</select>
				                        </div>
				                       
				                        <button type="button" class="btn btn-previous">Previous</button>
										<button type="button" class="btn btn-next">Next</button>
				                        
				                    </div>
				                   </div> 
			                    </fieldset>
			                  
			                  
			                    
								
								<fieldset id="step4">
								  <div>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 4 / 5</h3>
		                            		<h4>Select Phenotype and Plate:</h4>
		                            		<p>We are close &#x1f64c;</p>
		                            		<div class="progress">
										  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
										  aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width:75%">
										    75% Complete (time point done)
										  </div>
										</div>
		                        		</div>
		                        		
		                        		
		                            </div>
		                            <div class="form-bottom">
				                       <div class="form-group">
				                    		<label class="sr-only" for="form-facebook">Phenotype</label>
				                        <select name="phenotypes" id="ph">
    											<c:forEach var="phenotypes" items="${pheno}">
										        <option value="${phenotypes.key}"> ${phenotypes.value}</option>
										    	</c:forEach>
												</select>
				                        </div>
				                        <div class="form-group">
											  <label class="sr-only" for="form-facebook">Select a Plate</label>
											  <input type="radio" name="form-Plate" id="1"  value="1" checked>&nbsp;10x<br><br>
											  <input type="radio" name="form-Plate" id="2"  value="2"> &nbsp;100x<br><br>
											  <input type="radio" name="form-Plate" id="3"  value="3"> &nbsp;1000x <br><br>
											  <input type="radio" name="form-Plate" id="4"  value="4"> &nbsp;10000x<br><br>
				                        </div>
										
				                      
				                        <button type="button" class="btn btn-previous">Previous</button>
				                        <button type="button" class="btn btn-next">Next</button>
				                    </div>
				                   </div> 
			                    </fieldset>
			                
			                
			                
			                    <!-- <fieldset id="directJumpToUpload" style="display: none">
			                    <div>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 3 / 3</h3>
		                        			<h4>Upload Files: </h4>
		                            		<p>Here you are,Finally!!!</p>
		                            		<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
										  aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
										    100% Complete (Selection complete)
										  </div>
		                        		</div>
		                        		
		                            </div>
		                            <div class="form-bottom">
				                       <div class="form-group">
				                       		<label class="sr-only" for="form-facebook">Desc:</label>
				                        	<input type="text" name="desc" id="desc" value="" placeholder="Enter File desc(Optional)"><br><br><br>
				                    		<label class="sr-only" for="form-facebook">Upload File:</label>
				                        	<input type="file"  id="uploadfile" name="file" size="40">
				                        	
				                        </div>
										
										<button type="button" class="btn btn-primary" onclick="backToStep2()">Previous</button>
				                        <button type="submit" name="directsave" class="btn btn-submit">Upload</button>
				                       </div> 
				                    </div>
			                    </fieldset> -->
			                 
								<fieldset id="step5">
								  <div>   
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 5 / 5</h3>
		                        			<h4>Upload Files: </h4>
		                            		<p>Here you are,Finally!!!</p>
		                            		<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
										  aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
										    100% Complete (Selection complete)
										  </div>
		                        		</div>
		                        		
		                            </div>
		                            <div class="form-bottom">
				                       <div class="form-group">
				                       		<label class="sr-only" for="form-facebook">Desc:</label>
				                        	<input type="text" name="desc" id="desc" value="" placeholder="Enter File desc(Optional)"><br><br><br>
				                    		<label class="sr-only" for="form-facebook">Upload File:</label>
				                        	<input type="file"  id="uploadfile" name="file" size="40">
				                        	
				                        </div>
										
										<button type="button" class="btn btn-previous">Previous</button>
				                        <button type="submit" name="sequencesave"  class="btn btn-submit">Upload</button>
				                        
				                    </div>
				                  </div>  
			                    </fieldset>
			                  
			                    
			                 
			                  
			                    
			                    
		                    
		                    </form>
		                    
                        </div>
                    </div>
                <!-- </div> -->
           <!--  </div> -->
            
        </div>


        <!-- Javascript -->
       	<script src="resources/js/Uploadjs.js"></script>
        <script src="resources/js/jquery-1.11.1.min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery.backstretch.min.js"></script>
        <script src="resources/js/retina-1.1.0.min.js"></script>
        <script src="resources/js/scripts.js"></script>
		
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>


</html>