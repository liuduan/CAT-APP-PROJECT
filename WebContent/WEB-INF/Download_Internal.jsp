<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/Download.js"></script>
</head>
<body onload="myFunction()" 
	background="${pageContext.request.contextPath}/resources/images/Catapp_logo_full-blur.svg"
	style="background-size:250%">
	
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/catapp"
    user="root"  password="vibscatapp"/>
<%-- 
<sql:query dataSource="${snapshot}" var="result">
	select distinct assay_type from file_info where cell_line_id = 'HT29'; 
</sql:query>


<c:forEach var="row" items="${result.rows}">  
	Assay found for HT29: <c:out value="${row.assay_type}"/>, 
</c:forEach> 
--%>


<script>
$(document).ready(function(){
   	// alert("ready function.");
   	$("#assay_title").show();
	$("#Assays").show();
    // $(".all_assays").hide();
    var selected_cell_lines;
    // alert("still ready function.");
    <c:forEach var="element" items="${selected_cell_lines}" varStatus="status">
    	// alert("element (cell line): " + "${element}");
    	<sql:query dataSource="${snapshot}" var="result">
    		select distinct assay_type from file_info where cell_line_id = "${element}"; 
    	</sql:query>
    	<c:forEach var="row" items="${result.rows}">  
			$("#${element}_${row.assay_type}").removeAttr("disabled");
    		$("#${element}_${row.assay_type}_B").css({'color': 'DarkCyan ', 'font-size': '105%', 'font-weight': 'bold' });
    	</c:forEach> 

    	$("#${element}_assays").show();
   	</c:forEach>
});

</script>




<h4 id ="assay_title" onclick="assays()" style="color: Blue; display: none; margin-left: 40px;">
	<b><u>Please select assays:</u></b>
		<a href="#" onclick="show_hide_assays()" id="next_to_phenotypes" style="display: none;">
			<button type="button" class="btn btn-xs btn-success"> Next
 				<span class="glyphicon glyphicon-chevron-right"></span>
				</button>
		</a></h4>
		
<div id="Assays" style = "display:none; margin-left: 40px;">
	<!-- "_" is used to seperate cell line tags and phenotype tags -->
	<div id="CM_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell cardiomyocyte assays:</span><br>
		<input type="checkbox" disabled class="all_assays" id="CM_Ca2" name="CM_Ca2" value='CM_Ca2'>			
			<span id="CM_Ca2_B">Ca2+ flux<br></span>
		<input type="checkbox" disabled class="all_assays" id="CM_Hoechst" name="CM_Hoechst" value='CM_Hoechst'>
			<span id="CM_Hoechst_B">Nuclei staining<br></span>
		<input type="checkbox" disabled class="all_assays" id="CM_Mito" name="CM_Mito" value='CM_Mito'>		
			<span id="CM_Mito_B">Mitochondrial Integrity<br></span>
		<br>
	</div>
	<div id="HEP_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell hepatocyte assays:</span><br>
		<input type="checkbox" disabled class="all_assays" id="HEP_Hoechst" name="HEP_Hoechst" value='HEP_Hoechst'>
			<span id="HEP_Hoechst_B">	Nuclei staining<br></span>
		<input type="checkbox" disabled class="all_assays" id="HEP_Mito" 	name="HEP_Mito" value='HEP_Mito'>
			<span id="HEP_Mito_B">		Mitochondrial Integrity<br></span>
		<input type="checkbox" disabled class="all_assays" id="HEP_CalceinAM" name="HEP_CalceinAM" value='HEP_CalceinAM'>
			<span id="HEP_CalceinAM_B">	Cell Viability<br></span>
		<input type="checkbox" disabled class="all_assays" id="HEP_LipidTOX" name="HEP_LipidTOX" value='HEP_LipidTOX'>
			<span id="HEP_LipidTOX_B">	Lipid Accumulation<br></span>
		<br>
	</div>
	<div id="ENDO_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >ENDO and HUVEC assays:</span><br>
		<input type="checkbox" disabled class="all_assays" id="ENDO_Hoechst" name="ENDO_Hoechst" value='ENDO_Hoechst'>
			<span id="ENDO_Hoechst_B">	Nuclei staining<br></span>
		<input type="checkbox" disabled class="all_assays" id="ENDO_Mito" 	name="ENDO_Mito" value='ENDO_Mito'>
			<span id="ENDO_Mito_B">		Mitochondrial Integrity<br></span>
		<input type="checkbox" disabled class="all_assays" id="ENDO_CalceinAM" name="ENDO_CalceinAM" value='ENDO_CalceinAM'>
			<span id="ENDO_CalceinAM_B">	Cell Viability<br></span>
		<input type="checkbox" disabled class="all_assays" id="ENDO_TubForm" name="ENDO_TubForm" value='ENDO_TubForm'>
			<span id="ENDO_TubForm_B">	Tube Formation<br></span>
		<br>
	</div>
	<div id="HUV_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >HUVEC assays:</span><br>
		<input type="checkbox" disabled class="all_assays" id="HUV_Hoechst" name="HUV_Hoechst" value='HUV_Hoechst'>	
			<span id="HUV_Hoechst_B">	Nuclei staining<br></span>
		<input type="checkbox" disabled class="all_assays" id="HUV_Mito" 	name="HUV_Mito" value='HUV_Mito'>			
			<span id="HUV_Mito_B">		Mitochondrial Integrity<br></span>
		<input type="checkbox" disabled class="all_assays" id="HUV_CalceinAM" name="HUV_CalceinAM" value='HUV_CalceinAM'>
			<span id="HUV_CalceinAM_B">	Cell Viability<br></span>
		<input type="checkbox" disabled class="all_assays" id="HUV_TubForm" name="HUV_TubForm" value='HUV_TubForm'>	
			<span id="HUV_TubForm_B">	Tube Formation<br></span>
		<br>
	</div>
	<div id="Neur_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell neuron assays:</span><br>
		<input type="checkbox" disabled class="all_assays" id="Neur_Hoechst" name="Neur_Hoechst" value='Neur_Hoechst'>
			<span id="Neur_Hoechst_B">	Nuclei staining<br></span>
		<input type="checkbox" disabled class="all_assays" id="Neur_Mito" 	name="Neur_Mito" value='Neur_Mito'>
			<span id="Neur_Mito_B">		Mitochondrial Integrity<br></span>
		<input type="checkbox" disabled class="all_assays" id="Neur_CalceinAM" name="Neur_Neur_CalceinAM" value='CalceinAM'>
			<span id="Neur_CalceinAM_B">Cell Viability<br></span>
		<input type="checkbox" disabled class="all_assays" id="Neur_NeurOut" name="Neur_NeurOut" value='Neur_NeurOut'>
			<span id="Neur_NeurOut_B">	Neurite Outgrowth<br></span>
		<br>
	</div>
	<div id="Macro_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell macrophage assays:</span><br>
		<input type="checkbox" disabled class="all_assays" id="Macro_Hoechst" name="Macro_Hoechst" value='Macro_Hoechst'>
			<span id="Macro_Hoechst_B">	Nuclei staining<br></span>
		<input type="checkbox" disabled class="all_assays" id="Macro_Mito" 	name="Macro_Mito" value='Macro_Mito'>
			<span id="Macro_Mito_B">	Mitochondrial Integrity<br></span>
		<input type="checkbox" disabled class="all_assays" id="Macro_CalceinAM" name="Macro_CalceinAM" value='Macro_CalceinAM'>
			<span id="Macro_CalceinAM_B">Cell Viability<br></span>
		<input type="checkbox" disabled class="all_assays" id="Macro_Phag" name="Macro_Phag" value='Macro_Phag'>
			<span id="Macro_Phag_B">	Phagocytosis<br></span>
		<input type="checkbox" disabled class="all_assays" id="Macro_Cyto" name="Macro_Cyto" value='Macro_Cyto'>
			<span id="Macro_Cyto_B">	Cytokines<br></span>
		<input type="checkbox" disabled class="all_assays" id="Macro_MacroOut" name="Macro_MacroOut" value='Macro_MacroOut'>
			<span id="Macro_MacroOut_B">Macroite Outgrowth<br></span>
		<br>
	</div>
	<c:forEach var="element" items="${England_cell_lines}" varStatus="status">
		<div id="${element}_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
			<span style="color:black; font-weight: bold;" >Cell line ${element} assays:</span><br>
			<input type="checkbox" disabled class="all_assays" id="${element}_CMFDA" name="${element}_CMFDA" value='${element}_CMFDA'>
				<span id="${element}_CMFDA_B">Cell membrane integrity<br></span>
			<input type="checkbox" disabled class="all_assays" id="${element}_ROS" name="${element}_ROS" value='${element}_ROS'>
				<span id="${element}_ROS_B">Reactive Oxygen Species<br></span>
			<input type="checkbox" disabled class="all_assays" id="${element}_CASP" name="${element}_CASP" value='${element}_CASP'>
				<span id="${element}_CASP_B">Apoptosis<br></span>
			<input type="checkbox" disabled class="all_assays" id="${element}_PROT" name="${element}_PROT" value='${element}_PROT'>
				<span id="${element}_PROT_B">Protein synthesis inhibition<br></span>
			<input type="checkbox" disabled class="all_assays" id="${element}_ATP" name="${element}_ATP" value='${element}_ATP'>
				<span id="${element}_ATP_B">ATP Quantitation Assay<br></span>
			<br>
		</div>
	</c:forEach>
</div>	<!-- end of div for assays. -->

</body>
</html>