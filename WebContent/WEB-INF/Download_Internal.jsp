<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script>
function myFunction() {
    alert("Page is loaded");
}
</script>
<div id="Assays" style = "display:none; margin-left: 40px;">
	
	Hello, Download_Internal
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

</body>
</html>