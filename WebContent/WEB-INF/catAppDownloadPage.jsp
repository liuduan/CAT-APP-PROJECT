<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

	pageEncoding="ISO-8859-1"%>
<%@ page import="com.catapp.entity.User"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>

<<<<<<< HEAD
    <meta charset="utf-8">
    <meta https-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CAT-APP</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/catAppDown.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/full-width-pics.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    
    	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css' type='text/css' />
    
</head>
	<!-- function located line 57 -->
<body onload="enalbe_cell_lines()" 
	background="${pageContext.request.contextPath}/resources/images/Catapp_logo_full-blur.svg"
	style="background-size:250%">

<jsp:include page="header.jsp" /> 

<br></br><br></br>
<div class="container-fluid"><div class="row"></div><!-- end of div row -->
<div class="col-lg-5  col-md-5" id ="left" >
<div id ="cell line selection" style="margin-left: 40px;">

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    	url="jdbc:mysql://localhost:3306/catapp"
     	user="root"  password="vibscatapp"/>
 
	<sql:query dataSource="${snapshot}" var="result">
		select distinct cell_line_id from file_info; 
	</sql:query>
	<%--
	<c:forEach var="row" items="${result.rows}">  
		<c:out value="${row.cell_line_id}"/>, 
	</c:forEach> 
 	--%>
	<script type="text/javascript">
		function enalbe_cell_lines(){			////////////////////////// enable_cell_lines()
			<c:forEach var="row" items="${result.rows}">  
				$("#${row.cell_line_id}").removeAttr("disabled");
				$("#${row.cell_line_id}_B").css({'color': 'DarkCyan ', 'font-size': '105%', 'font-weight': 'bold' });
			</c:forEach> 
		}
		
	</script>

	<h4 style="color: Blue ;">
		<a href="#" id ="cell_line_title" onclick="click_cell_line_title()" ><b><u>Please select cell lines:</u></b></a>
		<a href="#" id="cell_line_button" onclick="click_cell_line_button()" style="display: none;">
			<button type="button" class="btn btn-xs btn-success"> Next
 				<span class="glyphicon glyphicon-chevron-right">
				</button>
		</a></h4>
	
	<div id = "cell_line_list" style="color:LightSteelBlue; margin:20px; " >
		<input type="checkbox" disabled class="cell_lines" id="CM" name="CM" value="CM"><span id="CM_B">1. iCell Cardiomyocytes<br></span>
		<input type="checkbox" disabled class="cell_lines" id="HEP" name="HEP" value="HEP"><span id="HEP_B">2. iCell Hepatocytes 2.0<br></span>
		<input type="checkbox" disabled class="cell_lines" id="ENDO" name="ENDO" value="ENDO"><span id="ENDO_B">3. iCell Endothelial Cells<br></span>
		<input type="checkbox" disabled class="cell_lines" id="HUV" name="HUV" value="HUV"><span id="HUV_B">4. Human Umbilical Vein Endothelial Cells<br></span>
		<input type="checkbox" disabled class="cell_lines" id="Neur" name="Neur" value="Neur"><span id="Neur_B">5. iCell Neurons<br></span>
		<input type="checkbox" disabled class="cell_lines" id="Macro" name="Macro" value="Macro"><span id="Macro_B">6. iCell Macrophages<br></span>
		<input type="checkbox" disabled class="cell_lines" id="A375" name="A375" value="A375"><span id="A375_B">7. A-375 Skin Melanoma<br></span>
		<input type="checkbox" disabled class="cell_lines" id="A549" name="A549" value="A549"><span id="A549_B">8. A549 Lung Carcinoma<br></span>
		<input type="checkbox" disabled class="cell_lines" id="HepG2" name="HepG2" value="HepG2"><span id="HepG2_B">9. HepG2 Hepatocyte Carcinoma<br></span>
		<input type="checkbox" disabled class="cell_lines" id="HepaRG" name="HepaRG" value="HepaRG"><span id="HepaRG_B">10. HepaRG Hepatocyte Carcinoma<br></span>
		<input type="checkbox" disabled class="cell_lines" id="MCF7" name="MCF7" value="MCF7"><span id="MCF7_B">11. MCF7 Breast Adenocarcinoma<br></span>
		<input type="checkbox" disabled class="cell_lines" id="HT29" name="HT29" value="HT29"><span id="HT29_B">12. HT-29 Colon Adenocarcinoma<br></span>
		<input type="checkbox" disabled class="cell_lines" id="LN229" name="LN229" value="LN229"><span id="LN229_B">13. LN-229 Glioblastoma<br></span>
		<input type="checkbox" disabled class="cell_lines" id="HEK10205f" name="HEK10205f" value="HEK10205f"><span id="HEK10205f_B">14. HEK10205f Human Epidermal Keratinocytes; Foetal<br></span>
		<input type="checkbox" disabled class="cell_lines" id="HLMVEC" name="HLMVEC" value="HLMVEC"><span id="HLMVEC_B">15. HLMVEC Human Lung Microvascular Endothelial Cells<br></span>
		<input type="checkbox" disabled class="cell_lines" id="HMePC" name="HMePC" value="HMePC"><span id="HMePC_B">16. HMePC Human Mammary Epithelial Cell<br></span>
		<input type="checkbox" disabled class="cell_lines" id="SH-SY5Y" name="SH-SY5Y" value="SH-SY5Y"><span id="SH-SY5Y_B">17. SH-SY5Y Neuroblastoma<br></span>
	</div>
</div>		<!-- end of the cell line selection -->


<div id="Assays_A" style = "display:; margin-left: 40px;">
	.
	
	
</div>	<!-- end of div for assays. -->

<div id="Phenotypes_A" style = "display:; margin-left: 40px;">
	..
	
</div>	<!-- end of div for Phenotypes. -->


</div>	<!-- end of div left -->



<div id="file_display" class="col-lg-7 col-md-7" >
	<h1 style="text-align: center; text-indent: -350px; font-weight: bold; " class = "text-danger">
    	File Download</h1>
	<form action="DownloadFileServlet">
		<div id="file_list" style="display: ; ">
			<br></br>
			<a href="${pageContext.request.contextPath}/resources/Notes/Notes.html">Assay group notes.</a><br>
			Explain file name components.
		</div>
		<div id = "file_button" style="margin-left: 80px; display: none; ">
			<br></br>
			<input type="submit" class="btn btn-info" name="download" style="border-radius: 5px;" value="Download">
			<input type="submit" class="btn btn-info" name="json" style="border-radius: 5px;" value="Convert to JSON">
		</div>
	</form>
</div><!-- end of div file_display -->

</div><!-- end of div row -->
</div> <!-- end of the container-fluid -->

<br></br><br></br><br></br><br></br>

<div id = "not shown" style="display: none">
================================================================================

<div id="wrapper">
        
        
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center user-image-back" style="background-color: white">
                    <br>
                       
                       <b> Choose your options </b> -
                     <br><br>
                    </li>

					
                    <li>
                        <a href="#"><h4>Cell Lines</h4></a>
                       
                      
                        <ul class="nav nav-second-level" id="cellhead">
                            <li >
                              <c:forEach var="cellline" items="${cell}">
                              <c:choose>

                              <c:when test="${cellline.key=='0'}">
                         							
							 </c:when>
							 <c:otherwise>
    							<li >
    								<a href="#"><label><input type="checkbox" name= "celllines" id= "celllines" 
    									value= <c:out value="${cellline.key}"/>> &nbsp;<c:out value="${cellline.value}"/></label></a>
								</li>

							 </c:otherwise>
							</c:choose>
						</c:forEach>
                        </ul>
                    </li>
					<li>

                        <a href="#" onclick="getAssaysForDownload()">Assay Name</a>
						<ul class="nav nav-second-level" id="AssayHead">

                             <c:forEach var="assaynames" items="${assay}">
                             <c:choose>
                             <c:when test="${assaynames.key=='0'}">
                         							
						
						    </c:when>
						    <c:otherwise>

						   							<li>
    												<a href="#"><label><input type="checkbox" name= "assaynames" id= "assaynames" value= <c:out value="${assaynames.key}"/>   > &nbsp;<c:out value="${assaynames.value}"/></label></a>
											 		</li>

						    </c:otherwise>
						 </c:choose>
						</c:forEach>
                     
                        </ul>
                    </li>
					
                    <li>

                        <a href="#" onclick="getPhenotypes()">PhenoTypes</a>
                        <ul class="nav nav-second-level" id="phenohead">
                            <c:forEach var="phenotypes" items="${pheno}">
                              <c:choose>
                             <c:when test="${phenotypes.key=='0'}">
                             </c:when>
                             <c:otherwise>
                             <li >
    							<a href="#"><label><input type="checkbox" name= "phenotypes" id= "phenotypes" value= <c:out value="${phenotypes.key}"/>> &nbsp;<c:out value="${phenotypes.value}"/></label></a>
							</li>
                             </c:otherwise>
                             </c:choose>
                         							

						</c:forEach>
                        </ul>
                    </li>
					

                    <li>
                        <a href="#"><h4>Plate Concentration</h4></a>
						<ul class="nav nav-second-level">
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pd" id="pd" value="1">&nbsp;1x</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pd" id= "pd" value="2">&nbsp;10x</label></a>
                            </li>
                            <li>
                                <a href="#"><label><input type="checkbox" name ="pd" id= "pd" value="3">&nbsp;100x</label></a>
                            </li>
							<li>
                                <a href="#"><label><input type="checkbox" name ="pd" id= "pd" value="4">&nbsp;1000x</label></a>
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


</div><!-- end of div "not shown" -->


          
             
                  
                  
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
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/userHome.js"></script>
    <!-- JQUERY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.metisMenu.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/Download.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/catAppDown.js"></script>
	<!-- <script src="${pageContext.request.contextPath}/resources/js/easyPaginate.js"></script> -->
	<script type="text/plain" src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>
	
=======
<meta charset="utf-8">
<meta https-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Download</title>

<!-- Bootstrap Core CSS -->
<link href="/CAT-APP-PROJECT/resources/css/catAppDown.css"
	rel="stylesheet">

<link href="/CAT-APP-PROJECT/resources/css/bootstrap.min.css"
	rel="stylesheet">


<!-- MetisMenu CSS -->
<link href="/CAT-APP-PROJECT/resources/css/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/CAT-APP-PROJECT/resources/css/sb-admin-2.css"
	rel="stylesheet">

<link href="/CAT-APP-PROJECT/resources/css/font-awesome.css"
	rel="stylesheet" />

<!-- Custom Fonts -->
<link
	href="/CAT-APP-PROJECT/resources/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="resources/images/favicon.png">
<style type="text/css">
#page-wrapper {
	/* background: RGBA(24, 161, 196, 0.2); */
	background: url('/CAT-APP-PROJECT/resources/images/bgLight.jpg') repeat
		center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}
</style>
</head>
<!-- function located line 57 -->
<body onload="enalbe_cell_lines()">
	<div id="wrapper">

		<%
			String isAdmin = ((User) request.getSession().getAttribute("user")).getIs_admin();
			if (null == isAdmin || "" == isAdmin.trim()) {
		%>
		<jsp:include page="headerUserHome.jsp" />
		<%
			}
			if ("Y".equalsIgnoreCase(isAdmin)) {
		%>
		<jsp:include page="headerAdminHome.jsp" />
		<%
			}
		%>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Download Files in CAT-APP</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>

			<div class="row">
				<div class="col-md-6" id="left">
					<div id="cell line selection" style="margin-left: 40px;">

						<sql:setDataSource var="snapshot"
							driver="com.mysql.jdbc.Driver"
							url="jdbc:mysql://localhost:3306/CATAPP?autoReconnect=true&useSSL=false" user="root" password="ashima"/>


						<sql:query dataSource="${snapshot}" var="result">
		select distinct cell_line_id from file_info; 
	</sql:query>

						<script type="text/javascript">
							function enalbe_cell_lines() { ////////////////////////// enable_cell_lines()
								<c:forEach var="row" items="${result.rows}">
								$("#${row.cell_line_id}")
										.removeAttr("disabled");
								$("#${row.cell_line_id}_B").css({
									'color' : 'Black',
									'font-size' : '105%',
									'font-weight' : 'bold'
								});
								</c:forEach>
							}
						</script>

						<h4>
							<a href="#" id="cell_line_title"
								onclick="click_cell_line_title()"><b><u>Please
										select cell lines:</u></b></a> <a href="#" id="cell_line_button"
								onclick="click_cell_line_button()" style="display: none;">
								<button type="button" class="btn btn-xs btn-primary">
									Next <span class="fa fa-chevron-right"></span>
								</button>
							</a>
						</h4>

						<div id="cell_line_list" style="color: Gray; margin: 20px;">
							<input type="checkbox" disabled class="cell_lines" id="CM"
								name="CM" value="CM"><span id="CM_B">1. iCell
								Cardiomyocytes<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="HEP"
								name="HEP" value="HEP"><span id="HEP_B">2. iCell
								Hepatocytes 2.0<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="ENDO"
								name="ENDO" value="ENDO"><span id="ENDO_B">3.
								iCell Endothelial Cells<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="HUV"
								name="HUV" value="HUV"><span id="HUV_B">4. Human
								Umbilical Vein Endothelial Cells<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="Neur"
								name="Neur" value="Neur"><span id="Neur_B">5.
								iCell Neurons<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="Macro"
								name="Macro" value="Macro"><span id="Macro_B">6.
								iCell Macrophages<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="A375"
								name="A375" value="A375"><span id="A375_B">7.
								A-375 Skin Melanoma<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="A549"
								name="A549" value="A549"><span id="A549_B">8.
								A549 Lung Carcinoma<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="HepG2"
								name="HepG2" value="HepG2"><span id="HepG2_B">9.
								HepG2 Hepatocyte Carcinoma<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="HepaRG"
								name="HepaRG" value="HepaRG"><span id="HepaRG_B">10.
								HepaRG Hepatocyte Carcinoma<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="MCF7"
								name="MCF7" value="MCF7"><span id="MCF7_B">11.
								MCF7 Breast Adenocarcinoma<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="HT29"
								name="HT29" value="HT29"><span id="HT29_B">12.
								HT-29 Colon Adenocarcinoma<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="LN229"
								name="LN229" value="LN229"><span id="LN229_B">13.
								LN-229 Glioblastoma<br>
							</span> <input type="checkbox" disabled class="cell_lines"
								id="HEK10205f" name="HEK10205f" value="HEK10205f"><span
								id="HEK10205f_B">14. HEK10205f Human Epidermal
								Keratinocytes; Foetal<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="HLMVEC"
								name="HLMVEC" value="HLMVEC"><span id="HLMVEC_B">15.
								HLMVEC Human Lung Microvascular Endothelial Cells<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="HMePC"
								name="HMePC" value="HMePC"><span id="HMePC_B">16.
								HMePC Human Mammary Epithelial Cell<br>
							</span> <input type="checkbox" disabled class="cell_lines" id="SH-SY5Y"
								name="SH-SY5Y" value="SH-SY5Y"><span id="SH-SY5Y_B">17.
								SH-SY5Y Neuroblastoma<br>
							</span>
						</div>
					</div>
					<!-- end of the cell line selection -->


					<div id="Assays_A" style="display:; margin-left: 40px;">.</div>
					<!-- end of div for assays. -->

					<div id="Phenotypes_A" style="display:; margin-left: 40px;">..

					</div>
					<!-- end of div for Phenotypes. -->


				</div>

				<!-- end of div left -->



				<div id="file_display" class="col-md-6">

					<form action="DownloadFileServlet">
						<div id="file_list" style="display:;">
							<br></br> <a href="/CAT-APP-PROJECT/resources/Notes/Notes.html">Assay
								group notes.</a><br> Explain file name components.
						</div>
						<div id="file_button" style="margin-left: 80px; display: none;">
							<br></br> <input type="submit" class="btn btn-primary"
								name="download" style="border-radius: 5px;" value="Download">
							<input type="submit" class="btn btn-primary" name="json"
								style="border-radius: 5px;" value="Convert to Json">
						</div>
					</form>
				</div>
				<!-- end of div file_display -->


				<!-- end of div row -->

				<!-- end of the container-fluid -->

				<br></br> <br></br> <br></br> <br></br>




			</div>
			<%-- 		<jsp:include page="footer.jsp" />
 --%>
		</div>
		<!-- jQuery -->
		<!-- <script src="/CAT-APP-PROJECT/resources/js/jquery.js"></script>
	Bootstrap Core JavaScript
	JQUERY SCRIPTS
	<script src="/CAT-APP-PROJECT/resources/js/jquery-1.10.2.js"></script>
	BOOTSTRAP SCRIPTS
	<script src="/CAT-APP-PROJECT/resources/js/bootstrap.min.js"></script>
	METISMENU SCRIPTS
	<script src="/CAT-APP-PROJECT/resources/js/jquery.metisMenu.js"></script>
	CUSTOM SCRIPTS
	<script src="/CAT-APP-PROJECT/resources/js/custom.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/CAT-APP-PROJECT/resources/js/catAppDown.js"></script>
	<script src="/CAT-APP-PROJECT/resources/js/easyPaginate.js"></script>
	<script type="text/plain"
		src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>



	<script src="/CAT-APP-PROJECT/resources/js/metisMenu.min.js"></script>
	CUSTOM SCRIPTS
	<script src="/CAT-APP-PROJECT/resources/js/sb-admin-2.js"></script> -->


		<!-- jQuery -->
		<script src="/CAT-APP-PROJECT/resources/js/jquery.min.js"></script>

		<script src="/CAT-APP-PROJECT/resources/js/metisMenu.min.js"></script>
		<script src="/CAT-APP-PROJECT/resources/js/Download.js"></script>



		<!-- Bootstrap Core JavaScript -->
		<script src="/CAT-APP-PROJECT/resources/js/bootstrap.min.js"></script>

		<!-- METISMENU SCRIPTS -->
		<script src="/CAT-APP-PROJECT/resources/js/jquery.metisMenu.js"></script>
		<!-- CUSTOM SCRIPTS -->
		<script src="/CAT-APP-PROJECT/resources/js/sb-admin-2.js"></script>
>>>>>>> SS-Master/master
</body>
</html>