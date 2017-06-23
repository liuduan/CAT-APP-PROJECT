<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>

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
    
</head>
<body onload="enalbe_cell_lines()" 
	background="${pageContext.request.contextPath}/resources/images/Catapp_logo_full-blur.svg"
	style="background-size:250%">

<jsp:include page="header.jsp" /> 

<br><br><br><br>
<div style="margin-left: 40px;">

	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    	url="jdbc:mysql://localhost:3306/catapp"
     	user="root"  password="vibscatapp"/>
 
	<sql:query dataSource="${snapshot}" var="result">
		select distinct cell_line_id from file_info; 
	</sql:query>
	<c:forEach var="row" items="${result.rows}">  
		<c:out value="${row.cell_line_id}"/>, 
	</c:forEach> 

	<script type="text/javascript">
		function enalbe_cell_lines(){
			<c:forEach var="row" items="${result.rows}">  
				$("#${row.cell_line_id}").removeAttr("disabled");
				$("#${row.cell_line_id}_B").css({'color': 'DarkCyan ', 'font-size': '105%', 'font-weight': 'bold' });
			</c:forEach> 
		}
		
	</script>

	<h4 id ="cell_line_title" onclick="show_hide_cell_lines()" style="color: Blue ;"><b><u>Please select cell lines:</u></b></h4>
	<div style="color:LightSteelBlue; margin:20px; " id = "cell_lines">
		<span id="CM_B"><input type="checkbox" id="CM" disabled name="CM" value="CM">1. iCell Cardiomyocytes<br></span>
		<span id="HEP_B"><input type="checkbox" disabled id="HEP" name="HEP" value="HEP">2. iCell Hepatocytes 2.0<br></span>
		<span id="ENDO_B"><input type="checkbox" disabled id="ENDO" name="ENDO" value="ENDO">3. iCell Endothelial Cells<br></span>
		<span id="HUV_B"><input type="checkbox" disabled id="HUV" name="HUV" value="HUV">4. Human Umbilical Vein Endothelial Cells<br></span>
		<span id="Neur_B"><input type="checkbox" disabled id="Neur" name="Neur" value="Neur">5. iCell Neurons<br></span>
		<span id="Macro_B"><input type="checkbox" disabled id="Macro" name="Macro" value="Macro">6. iCell Macrophages<br></span>
		<span id="A375_B"><input type="checkbox" disabled id="A375" name="A375" value="A375">7. A-375 Skin Melanoma<br></span>
		<span id="A549_B"><input type="checkbox" disabled id="A549" name="A549" value="A549">8. A549 Lung Carcinoma<br></span>
		<span id="HepG2_B"><input type="checkbox" disabled id="HepG2" name="HepG2" value="HepG2">9. HepG2 Hepatocyte Carcinoma<br></span>
		<span id="HepaRG_B"><input type="checkbox" disabled id="HepaRG" name="HepaRG" value="HepaRG">10. HepaRG Hepatocyte Carcinoma<br></span>
		<span id="MCF7_B"><input type="checkbox" disabled id="MCF7" name="MCF7" value="MCF7">11. MCF7 Breast Adenocarcinoma<br></span>
		<span id="HT29_B"><input type="checkbox" disabled id="HT29" name="HT29" value="HT29">12. HT-29 Colon Adenocarcinoma<br></span>
		<span id="LN229_B"><input type="checkbox" disabled id="LN229" name="LN229" value="LN229">13. LN-229 Glioblastoma<br></span>
		<span id="HEK10205f_B"><input type="checkbox" disabled id="HEK10205f" name="HEK10205f" value="HEK10205f">14. HEK10205f Human Epidermal Keratinocytes; Foetal<br></span>
		<span id="HLMVEC_B"><input type="checkbox" disabled id="HLMVEC" name="HLMVEC" value="HLMVEC">15. HLMVEC Human Lung Microvascular Endothelial Cells<br></span>
		<span id="HMePC_B"><input type="checkbox" disabled id="HMePC" name="HMePC" value="HMePC">16. HMePC Human Mammary Epithelial Cell<br></span>
		<span id="SH-SY5Y_B"><input type="checkbox" disabled id="SH-SY5Y" name="SH-SY5Y" value="SH-SY5Y">17. SH-SY5Y Neuroblastoma<br></span>
	</div>
</div>		<!-- end of the cell line selection -->

<h4 id ="assay_title" onclick="assays()" style="color: Blue;margin-left: 40px;"><b><u>Please select assays:</u></b></h4>
<div id="Assays" style = "display:none; margin-left: 40px;">
	
	
	<div id="CM_assays" class="all_assays" style="color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell cardiomyocyte assays:</span><br>
		<span id="Ca2_B">		<input type="checkbox" disabled id="Ca2_B" name="Ca2_B" value='Ca2'>Ca2+ flux<br></span>
		<span id="Hoechst_B">	<input type="checkbox" disabled id="Hoechst" name="Hoechst" value='Hoechst'>Nuclei staining<br></span>
		<span id="Mito_B">		<input type="checkbox" disabled id="Mito" name="Mito" value='Mito'>Mitochondrial Integrity<br></span>
	</div><br>
	<div id="HEP_assays" class="all_assays" style="display: ; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell hepatocyte assays:</span><br>
		<span id="Hoechst_B">	<input type="checkbox" disabled id="Hoechst" name="Hoechst" value='Hoechst'>Nuclei staining<br></span>
		<span id="Mito_B">		<input type="checkbox" disabled id="Mito" 	name="Mito" value='Mito'>Mitochondrial Integrity<br></span>
		<span id="CalceinAM_B">	<input type="checkbox" disabled id="CalceinAM" name="CalceinAM" value='CalceinAM'>Cell Viability<br></span>
		<span id="LipidTOX_B">	<input type="checkbox" disabled id="LipidTOX" name="LipidTOX" value='LipidTOX'>Lipid Accumulation<br></span>
	</div>	<br>
	<div id="ENDO_HUV_assays" class="all_assays" style="display: ; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >HUVEC assays:</span><br>
		<span id="Hoechst_B">	<input type="checkbox" disabled id="Hoechst" name="Hoechst" value='Hoechst'>Nuclei staining<br></span>
		<span id="Mito_B">		<input type="checkbox" disabled id="Mito" 	name="Mito" value='Mito'>Mitochondrial Integrity<br></span>
		<span id="CalceinAM_B">	<input type="checkbox" disabled id="CalceinAM" name="CalceinAM" value='CalceinAM'>Cell Viability<br></span>
		<span id="TubForm_B">	<input type="checkbox" disabled id="TubForm" name="TubForm" value='TubForm'>Tube Formation<br></span>
	</div>	<br>
	<div id="Neur_assays" class="all_assays" style="display: ; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell neuron assays:</span><br>
		<span id="Hoechst_B">	<input type="checkbox" disabled id="Hoechst" name="Hoechst" value='Hoechst'>Nuclei staining<br></span>
		<span id="Mito_B">		<input type="checkbox" disabled id="Mito" 	name="Mito" value='Mito'>Mitochondrial Integrity<br></span>
		<span id="CalceinAM_B">	<input type="checkbox" disabled id="CalceinAM" name="CalceinAM" value='CalceinAM'>Cell Viability<br></span>
		<span id="NeurOut_B">	<input type="checkbox" disabled id="NeurOut" name="NeurOut" value='NeurOut'>Neurite Outgrowth<br></span>
	</div>	<br>
	<div id="Macro_assays" class="all_assays" style="display: ; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell macrophage assays:</span><br>
		<span id="Hoechst_B">	<input type="checkbox" disabled id="Hoechst" name="Hoechst" value='Hoechst'>Nuclei staining<br></span>
		<span id="Mito_B">		<input type="checkbox" disabled id="Mito" 	name="Mito" value='Mito'>Mitochondrial Integrity<br></span>
		<span id="CalceinAM_B">	<input type="checkbox" disabled id="CalceinAM" name="CalceinAM" value='CalceinAM'>Cell Viability<br></span>
		<span id="Phag_B">	<input type="checkbox" disabled id="Phag" name="Phag" value='Phag'>Phagocytosis<br></span>
		<span id="Cyto_B">	<input type="checkbox" disabled id="Cyto" name="Cyto" value='Cyto'>Cytokines<br></span>
		<span id="MacroOut_B">	<input type="checkbox" disabled id="MacroOut" name="MacroOut" value='MacroOut'>Macroite Outgrowth<br></span>
	</div>	<br>
	<div id="England_assays" class="all_assays" style="display: ; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >Assays for cell lines 7 - 17:</span><br>
		<span id="CMFDA_B">	<input type="checkbox" disabled id="CMFDA" name="CMFDA" value='CMFDA'>Cell membrane integrity<br></span>
		<span id="ROS_B">	<input type="checkbox" disabled id="ROS" name="ROS" value='ROS'>Reactive Oxygen Species<br></span>
		<span id="CASP_B">	<input type="checkbox" disabled id="CASP" name="CASP" value='CASP'>Apoptosis<br></span>
		<span id="PROT_B">	<input type="checkbox" disabled id="PROT" name="PROT" value='PROT'>Protein synthesis inhibition<br></span>
		<span id="ATP_B">	<input type="checkbox" disabled id="ATP" name="ATP" value='ATP'>ATP Quantitation Assay<br></span>
	</div>
</div>	<!-- end of div for assays. -->







==========================================================================
<form action="DownloadFileServlet">

	<input type="checkbox" name ="optradio" id="pd" value="1">id = 1
	<input type="checkbox" name ="optradio" id="pd" value="2">id = 2
	<input type="submit" name="download" style="border-radius: 5px;" value="Download">
	<input type="submit" name="json" style="border-radius: 5px;" value="Convert to JSON">
</form>





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
	
</body>
</html>