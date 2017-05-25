<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>CAT-APP</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo2.ico" />
        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" />
     
        <link rel="stylesheet" href="resources/css/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/css/form-elements.css">
        <link rel="stylesheet" href="resources/css/style.css"> 
		 <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <!--   <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" /> -->
        <link href="${pageContext.request.contextPath}/resources/css/full-width-pics.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" />
        <link rel="shortcut icon" href="resources/images/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/images/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/images/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/images/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="resources/images/apple-touch-icon-57-precomposed.png"> 
        
        
        
 
<script src="${pageContext.request.contextPath}/resources/js/Uploadjs.js"></script>



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

<body background="${pageContext.request.contextPath}/resources/images/Catapp_logo_full-blur.svg"
	style="background-size:250%">

    <script type="text/javascript">

    function validateFile(){
    	jQuery("#sequencesave").prop('disabled',false);
    }
    document.addEventListener("DOMContentLoaded", function(event) { 
    	jQuery('input:file').change(
	            function(){
	                if (jQuery(this).val()) {
	                	jQuery('input:submit').attr('disabled',false);
	                    // or, as has been pointed out elsewhere:
	                    // $('input:submit').removeAttr('disabled'); 
	                } 
	            }
	            );
    	});

    function stepJump(){
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
<jsp:directive.include file="header.jsp" />

        <!-- Top content -->
        <!-- <div class="top-content"> -->
        	
           <!--  <div class="inner-bg"> -->
           
<br></br><br></br>
<div class="container">
	<c:if test="${param.success eq 1}">
    	<script type="text/javascript">
			window.location = "${pageContext.request.contextPath}/Success"
		</script>
        <div class="page-alerts">
     		<div class="alert alert-success">
      			<button  type="button" class="close">
      				<i class="glyphicon glyphicon-remove-circle text-success"></i></button>
      			<h4>Success</h4>
      			<p>The file was uploaded successfully</p>
    		</div>
    	</div>
	</c:if>
	<c:if test="${param.failure eq 2}">
		<div class="alert alert-danger">
      		<button  href="#" type="button" class="close"><i class="glyphicon glyphicon-remove-circle text-danger"></i></button>
      		<h4>Danger Alert</h4>
      		<p>Action has caused an error. Additional information <a class="alert-link" href="">Click Here</a> to read</p>
   		</div>
     	<div> failure </div>
	</c:if>
	
	<h1><strong>UPLOAD</strong> Files in CAT-APP</h1>

	<div class="row">
		<div class="col-sm-8 col-sm-offset-3 form-box" style="margin-top:-50px; background-color: ;">
                        	
        	<form role="form" action="SaveFileFormServlet" method="post" class="registration-form" enctype="multipart/form-data">
	
            	<div id="step1">
		        	<div class="form-top ">
		            	<div class="form-top-left">
		                	<h4>Step 1 / 5: Please Select a Cell Line. 
		                	 <button type="button" onclick="should_alert()" class="list-inline">should alert</button>
		            		<button type="button" onclick="getAssayNames()">should alert 3</button></h4>
		                </div>
		            </div>
		       

		            <div class="form-bottom scrollable">
				    	<div class="form-group">
					        <c:forEach var="cellline" items="${cell}">
								<input type="radio" name= "celllines" id= <c:out value="${cellline.value}"/> 
    								value= <c:out value="${cellline.key}"/> 
    								onclick="getAssayNames()" > &nbsp;<b>
    							<c:out value="${cellline.value}"/></b><br><br>
							</c:forEach>
							<select name="assaydata" id="assay" onchange="selectTimePoint()">
    							<c:forEach var="assaynames" items="${assay}">
    								<option value="${assaynames.key}"> ${assaynames.value} .</option>
								</c:forEach>
							</select>
				         </div>
				     </div>
				</div>
							
			                    
			   <div id="step2" style = "display:none;">
		       		<div class="form-top">
		            	<div class="form-top-left">
		                	<h4>Step 2 / 5, Input Assay Name:</h4>
		                </div>
		            </div>
		            <div class="form-bottom">
				    	<div class="form-group">
				        	<label class="sr-only" for="form-email">Assay Name</label>
					        <select name="assaydata" id="assay" onchange="selectTimePoint()">
    							<c:forEach var="assaynames" items="${assay}">
    								<option value="${assaynames.key}"> ${assaynames.value}</option>
								</c:forEach>
							</select>
						</div>
				        <button type="button" class="btn btn-previous" onclick="backRefresh()">Previous</button>
				        <button type="button" class="btn btn-next" id="assays" onclick="selectTimePoint()">Next</button>
				        
				     </div>
			    </div>
			                    
			                    
			    <div id="step3" style = "display:none;">
			    	<div>
		            	<div class="form-top">
		                	<div class="form-top-left">
		                    	<h3>Step 3 / 5</h3>
		                        <h4> Select a Time Point:</h4>
		                    </div>
		                 </div>
		                 <div class="form-bottom">
				         	<div class="form-group">
				            	time: ${time}
				            	<label class="sr-only" for="form-facebook">Time-Point</label>
				              	<select name="timepoint" id="tp" onchange="selectphenotypes()">
    								<c:forEach var="timepoints" items="${time}">
										<option value="${timepoints.key}"> ${timepoints.value}</option>
									</c:forEach>
								</select>
				          	</div>
				          	<button type="button" class="btn btn-previous" onclick="backRefreshTime()">Previous</button>
							<button type="button" class="btn btn-next" id="times" onclick="selectphenotypes()" disabled>Next</button>
					  	</div>
					</div> 
			 	</div>
				
				<div id="step4" style = "display:none;">
					<div>
		            	<div class="form-top">
		                	<div class="form-top-left">
		                    	<h4>Step 4 / 5, Select Phenotype and Plate:</h4>
		                  	</div>
		                </div>
		                <div class="form-bottom">
				        	<div class="form-group">
				             	<label class="sr-only" for="form-facebook">Phenotype</label>
				                d: ${pheno}
				             	<select name="phenotypes" id="ph2" onchange="step4_to_5()">
    								<c:forEach var="phenotypes2" items="${pheno}">
    									<option value="${phenotypes2.key}"> ${phenotypes2.value}</option>
									</c:forEach>
								</select>
								<c:set var="pheno" scope="session" value="${pheno}"/>
								e
				            </div>
				            <div class="form-group">
				            	h
								<label class="sr-only" for="form-facebook">Select a Plate</label>
								<input type="radio" name="form-Plate" id="1"  value="1">&nbsp;1x<br><br>
								<input type="radio" name="form-Plate" id="2"  value="2"> &nbsp;10x<br><br>
								<input type="radio" name="form-Plate" id="3"  value="3"> &nbsp;100x <br><br>
								<input type="radio" name="form-Plate" id="4"  value="4"> &nbsp;1000x<br><br>
				          	</div>
							<button type="button" class="btn btn-previous" onclick="refreshphenotype()">Previous</button>
				            <button type="button" class="btn btn-next" id="pheno" onclick="selectphenotypes()" disabled>Next</button>
				       	</div>
				  	</div> 
			  	</div>
	
				<div id="step5" style = "display:none;">
					<div>   
		            	<div class="form-top">
		                	<div class="form-top-left">
		                    	<h4>Step 5 / 5: Upload Files: </h4>
		                    </div>	
		              	</div>
		               	<div class="form-bottom">
				        	<div class="form-group">
				             	<label class="sr-only" for="form-facebook">Desc:</label>
				                <input type="text" name="desc" id="desc" value="" placeholder="Enter File desc(Optional)"><br><br><br>
				               	<label class="sr-only" for="form-facebook">Upload File:</label>
				               	<input type="file"  id="uploadfile" name="file" size="40" onclick="validateFile()">
							</div>
							<button type="button" class="btn btn-previous">Previous</button>
				            <button type="submit" name="sequencesave" id="sequencesave" class="btn btn-submit" disabled>Upload</button>
				        </div>
				   	</div>  
			    </div>
			                  
			</form>
		</div>
     </div>
</div>


        <!-- Javascript -->
        



<script src="${pageContext.request.contextPath}/resources/js/Uploadjs.js"></script>
      <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.backstretch.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/retina-1.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>     	



		
       
        
        
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>


</html>