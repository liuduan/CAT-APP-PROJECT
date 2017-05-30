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
		<div class="col-lg-1" style="background-color: ;"></div>
		<div class="col-lg-10" style="background-color: ;">
                        	
        	<form role="form" action="SaveFileFormServlet" method="post" class="registration-form" enctype="multipart/form-data">
	
            	<div id="step1" style = "background-color: ''; float: left ;">
		            <div >
		            	<h4>
		            	<li style='vertical-align:middle;'>
		            		Step 1 / 6. Please select a cell line: 
							<select name= "celllines" onchange="getAssayNames()" style='vertical-align:middle;'>
								<option value="audi" selected>Please select a cell line. </option>
								<c:forEach var="cellline" items="${cell}">									
    								<option id= <c:out value="${cellline.value}"/> value= <c:out value="${cellline.key}"/>> 
    									<c:out value="${cellline.value}"/>
    								</option>
								</c:forEach>
							</select>
							
						</li></h4>
				     </div>
				</div>
					
				<br></br>		
			                    
			   <div id="step2" style = "display:none; float: left ;">
			   		<h4>
		            <li>
				    	Step 2 / 6. Please select an assay name: 
				        	<label class="sr-only" for="form-email">Assay Name</label>
					        <select name="assaydata" id="assay" onchange="selectTimePoint()">
    							<c:forEach var="assaynames" items="${assay}">
    								<option value="${assaynames.key}"> ${assaynames.value}</option>
								</c:forEach>
							</select>
								        
				     </li></h4>
			    </div>
			                    
			        <br></br>            
			    <div id="step3" style = "display:; float: left; background-color: ;">
			    	<div>
				         	<div class="form-group">
				            	<!--  time: ${time}-->
				            	<label class="sr-only" for="form-facebook">Time-Point</label>
				            <h4>
				            <li>
				            	Step 3 / 6. Please select a time point:
				              	<select name="timepoint" id="tp" onchange="selectphenotypes()">
    								<c:forEach var="timepoints" items="${time}">
										<option value="${timepoints.key}"> ${timepoints.value}</option>
									</c:forEach>
								</select>
							</li></h4>
				          	</div>
					</div> 
			 	</div>
				<br></br>
				<div id="step4" style = "display:; background-color: ; text-align: left;">
				        <div style = "background-color: ; text-align: left;">
				       		&nbsp;
				             	<label class="sr-only" for="form-facebook">Phenotype</label>
				                <!--  d: ${pheno}-->
				             <h4>
				             <li>
				                Step 4 / 6. Please select a phenotype:
				             	<select name="phenotypes" id="ph2" onchange="step4_to_5()">
    								<c:forEach var="phenotypes2" items="${pheno}">
    									<option value="${phenotypes2.key}"> ${phenotypes2.value}</option>
									</c:forEach>
								</select>
								<c:set var="pheno" scope="session" value="${pheno}"/>
							</li></h4>			            
				       	</div>
			  	</div>
	
	
				<div id="step5" style = "display:none; float: left ;">
					<div class="form-group"  onchange="step5_to_6()"><h4>
				        <label class="sr-only" for="form-facebook">Select a Plate</label>
				        <li>
				        Step 5 / 6. Please select a plate: &nbsp;
						<input type="radio" name="form-Plate" id="11"  value="1" /> 1x &nbsp;&nbsp;&nbsp;
						<input type="radio" name="form-Plate" id="21"  value="2" /> 10x &nbsp;&nbsp;&nbsp;
						<input type="radio" name="form-Plate" id="31"  value="3" /> 100x &nbsp;&nbsp;&nbsp;
						<input type="radio" name="form-Plate" id="41"  value="4" /> 1000x
						</li>
						</h4>
					</div>
				</div>
	
				<br></br>
				<div id="step6" style = "display:none; background-color: azure; margin: auto; margin-top: 5px; height: 270px; ">
					  &nbsp;
					<div>
					<h4><li style="float: left;">
					Step 6 / 6: Upload files: 
					<input type="text" name="desc" id="desc" value="" placeholder="Enter File description (Optional)" 
						style="width: 450px;"/>
					<br></br>
					
					</li></h4>
					<br>
					</div>
					<br></br>
					<div style="background-color:; text-align: left; margin-left: 50px;">
						<h4>
							Choose a file to upload: 
							<div style="background-color: ; position: absolute; margin-left: 200px; margin-top: -20px">
								<input type="file"  id="uploadfile" name="file" size="40" onclick="validateFile()"></input>
							</div>
						</h4>
					</div>
					
					
					
					<div style="position: absolute; text-align: center; background-color: ; margin: auto; 
						margin-top: 20px; margin-left: 45%;">
						
						<button type="submit" name="sequencesave" id="sequencesave" class="btn btn-submit" disabled >
							Upload
						</button>
						<br></br><br></br><br></br><br></br>
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

        <script src="${pageContext.request.contextPath}/resources/js/retina-1.1.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>     	



		
       
        
        
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>


</html>