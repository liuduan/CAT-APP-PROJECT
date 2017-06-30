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
 
<sql:query dataSource="${snapshot}" var="result">
	select distinct assay_type from file_info where cell_line_id = 'HT29'; 
</sql:query>


<c:forEach var="row" items="${result.rows}">  
	Assay found for HT29: <c:out value="${row.assay_type}"/>, 
</c:forEach> 



<script>
$(document).ready(function(){
    alert("ready function.");
    $("#Assays").show();
    // $(".all_assays").hide();

    var selected_cell_lines;
    alert("${N_cell_lines}");
    <c:forEach var="element" items="${selected_cell_lines}" varStatus="status">

    	<sql:query dataSource="${snapshot}" var="result2">
    		select distinct assay_type from file_info where cell_line_id = 'HT29'; 
    	</sql:query>
    	<c:forEach var="row" items="${result2.rows}">  
    		Assay found for HT29: <c:out value="${row.assay_type}"/>, 
    		$("#${element}_${row.assay_type}").removeAttr("disabled");
			$("#${element}_${row.assay_type}_B").css({'color': 'DarkCyan ', 'font-size': '105%', 'font-weight': 'bold' });
    	</c:forEach> 


    
    	$("#${element}_assays").show();
   	</c:forEach>
});



function myFunction() {
    alert("Page is loaded");
}
</script>





<div id="Assays" style = "display:none; margin-left: 40px;">
	
	<div id="CM_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell cardiomyocyte assays:</span><br>
		<input type="checkbox" disabled id="CM_Ca2" name="CM_Ca2" value='CM_Ca2'>			<span id="CM_Ca2_B">Ca2+ flux<br></span>
		<input type="checkbox" disabled id="CM_Hoechst" name="CM_Hoechst" value='CM_Hoechst'><span id="CM_Hoechst_B">Nuclei staining<br></span>
		<input type="checkbox" disabled id="CM_Mito" name="CM_Mito" value='CM_Mito'>		<span id="CM_Mito_B">Mitochondrial Integrity<br></span>
	</div><br>
	<div id="HEP_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell hepatocyte assays:</span><br>
		<span id="Hoechst_B">	<input type="checkbox" disabled id="Hoechst" name="Hoechst" value='Hoechst'>Nuclei staining<br></span>
		<span id="Mito_B">		<input type="checkbox" disabled id="Mito" 	name="Mito" value='Mito'>Mitochondrial Integrity<br></span>
		<span id="CalceinAM_B">	<input type="checkbox" disabled id="CalceinAM" name="CalceinAM" value='CalceinAM'>Cell Viability<br></span>
		<span id="LipidTOX_B">	<input type="checkbox" disabled id="LipidTOX" name="LipidTOX" value='LipidTOX'>Lipid Accumulation<br></span>
	</div>	<br>
	<div id="ENDO_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >ENDO and HUVEC assays:</span><br>
		<span id="Hoechst_B">	<input type="checkbox" disabled id="Hoechst" name="Hoechst" value='Hoechst'>Nuclei staining<br></span>
		<span id="Mito_B">		<input type="checkbox" disabled id="Mito" 	name="Mito" value='Mito'>Mitochondrial Integrity<br></span>
		<span id="CalceinAM_B">	<input type="checkbox" disabled id="CalceinAM" name="CalceinAM" value='CalceinAM'>Cell Viability<br></span>
		<span id="TubForm_B">	<input type="checkbox" disabled id="TubForm" name="TubForm" value='TubForm'>Tube Formation<br></span>
	</div>	<br>
	<div id="HUV_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >HUVEC assays:</span><br>
		<input type="checkbox" disabled id="HUV_Hoechst" name="HUV_Hoechst" value='HUV_Hoechst'>	
			<span id="HUV_Hoechst_B">	Nuclei staining<br></span>
		<input type="checkbox" disabled id="HUV_Mito" 	name="HUV_Mito" value='HUV_Mito'>			
			<span id="HUV_Mito_B">		Mitochondrial Integrity<br></span>
		<input type="checkbox" disabled id="HUV_CalceinAM" name="HUV_CalceinAM" value='HUV_CalceinAM'>
			<span id="HUV_CalceinAM_B">	Cell Viability<br></span>
		<input type="checkbox" disabled id="HUV_TubForm" name="HUV_TubForm" value='HUV_TubForm'>	
			<span id="HUV_TubForm_B">	Tube Formation<br></span>
	</div>	<br>
	<div id="Neur_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell neuron assays:</span><br>
		<span id="Hoechst_B">	<input type="checkbox" disabled id="Hoechst" name="Hoechst" value='Hoechst'>Nuclei staining<br></span>
		<span id="Mito_B">		<input type="checkbox" disabled id="Mito" 	name="Mito" value='Mito'>Mitochondrial Integrity<br></span>
		<span id="CalceinAM_B">	<input type="checkbox" disabled id="CalceinAM" name="CalceinAM" value='CalceinAM'>Cell Viability<br></span>
		<span id="NeurOut_B">	<input type="checkbox" disabled id="NeurOut" name="NeurOut" value='NeurOut'>Neurite Outgrowth<br></span>
	</div>	<br>
	<div id="Macro_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCell macrophage assays:</span><br>
		<span id="Hoechst_B">	<input type="checkbox" disabled id="Hoechst" name="Hoechst" value='Hoechst'>Nuclei staining<br></span>
		<span id="Mito_B">		<input type="checkbox" disabled id="Mito" 	name="Mito" value='Mito'>Mitochondrial Integrity<br></span>
		<span id="CalceinAM_B">	<input type="checkbox" disabled id="CalceinAM" name="CalceinAM" value='CalceinAM'>Cell Viability<br></span>
		<span id="Phag_B">	<input type="checkbox" disabled id="Phag" name="Phag" value='Phag'>Phagocytosis<br></span>
		<span id="Cyto_B">	<input type="checkbox" disabled id="Cyto" name="Cyto" value='Cyto'>Cytokines<br></span>
		<span id="MacroOut_B">	<input type="checkbox" disabled id="MacroOut" name="MacroOut" value='MacroOut'>Macroite Outgrowth<br></span>
	</div>	<br>
	<c:forEach var="element" items="${England_cell_lines}" varStatus="status">
		<div id="${element}_assays" class="all_assays" style="display:none; color:LightSteelBlue; margin-left: 20px;">
			<span style="color:black; font-weight: bold;" >Cell line ${element} assays:</span><br>
			<input type="checkbox" disabled id="${element}_CMFDA" name="${element}_CMFDA" value='${element}_CMFDA'>
				<span id="${element}_CMFDA_B">Cell membrane integrity<br></span>
			<input type="checkbox" disabled id="${element}_ROS" name="${element}_ROS" value='${element}_ROS'>
				<span id="${element}_ROS_B">Reactive Oxygen Species<br></span>
			<input type="checkbox" disabled id="${element}_CASP" name="${element}_CASP" value='${element}_CASP'>
				<span id="${element}_CASP_B">Apoptosis<br></span>
			<input type="checkbox" disabled id="${element}_PROT" name="${element}_PROT" value='${element}_PROT'>
				<span id="${element}_PROT_B">Protein synthesis inhibition<br></span>
			<input type="checkbox" disabled id="${element}_ATP" name="${element}_ATP" value='${element}_ATP'>
				<span id="${element}_ATP_B">ATP Quantitation Assay<br></span>
		</div>
	</c:forEach>
</div>	<!-- end of div for assays. -->

</body>
</html>