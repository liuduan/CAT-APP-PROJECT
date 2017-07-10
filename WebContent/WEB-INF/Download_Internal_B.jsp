<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/Download.js"></script>
</head>
<body>

<script>
$(document).ready(function(){
   	// alert("ready function B.");

	$("#Assays").hide();
//	$("#Assays_B").hide();
	$("#phenotype_title").show();
	$("#Phenotypes").show();
	
})		// end of the ready function

</script>

<sql:setDataSource var="snapshot_B" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/catapp"
    user="root"  password="vibscatapp"/>
    
<c:forEach var="element" items="${selected_assays}" varStatus="status">
	<c:set var = "current_assay" value = "${fn:split(element, '_')}" />
	<sql:query dataSource="${snapshot_B}" var="result_B">
    	select 
    		distinct phenotype_id from file_info 
    	where 
    		(cell_line_id = "${current_assay[0]}") AND
    		(assay_type = "${current_assay[1]}"); 
    </sql:query>
    <c:forEach var="row" items="${result_B.rows}">  
		<c:set var = "pheno_id" value = "${element}_${row.phenotype_id}" />	
		<script>
			$("#${pheno_id}").removeAttr("disabled");
    		$("#${pheno_id}_B").css({'color': 'DarkCyan ', 'font-size': '105%', 'font-weight': 'bold' });
    	</script>
    </c:forEach> 
	<script>
	$("#${element}_phenos").show();
	</script>
</c:forEach>


<h4 id ="phenotype_title" style="color: Blue; margin-left: 40px;">
	<b><u>Please select phenotypes:</u> </b> 
		<a href="#" onclick="list_files()" id="after_phenotypes" style="display: none;">
			<button type="button" class="btn btn-xs btn-success"> Next
 				<span class="glyphicon glyphicon-chevron-right"></span>
				</button>
		</a></h4>
		
<div id="Phenotypes" style = "display:; margin-left: 40px;">
	<div id="CM_Ca2_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCardiomyocyte Ca2+ flux phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PF" name="CM_Ca2_PF" value="CM_Ca2_PF"></input>			
			<span id="CM_Ca2_PF_B">Peak Frequency<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PW" name="CM_Ca2_PW" value="CM_Ca2_PW">			
			<span id="CM_Ca2_PW_B">Peak Width<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PW10" name="CM_Ca2_PW10" value="CM_Ca2_PW10">			
			<span id="CM_Ca2_PW10_B">Peak Width at 10% Amplitude<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PA" name="CM_Ca2_PA" value="CM_Ca2_PA">			
			<span id="CM_Ca2_PA_B">Peak Amplitude<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PS" name="CM_Ca2_PS" value="CM_Ca2_PS">			
			<span id="CM_Ca2_PS_B">Peak Spacing<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PRT" name="CM_Ca2_PRT" value="CM_Ca2_PRT">			
			<span id="CM_Ca2_PRT_B">Peak Rise Time<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PDT" name="CM_Ca2_PDT" value="CM_Ca2_PDT">			
			<span id="CM_Ca2_PDT_B">Peak Decay Time<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_SEQ" name="CM_Ca2_SEQ" value="CM_Ca2_SEQ">
			<span id="CM_Ca2_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="CM_Hoechst_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCardiomyocyte Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="CM_Hoechst_TC" name="CM_Hoechst_TC" value="CM_Hoechst_TC">			
			<span id="CM_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Hoechst_NMA" name="CM_Hoechst_NMA" value="CM_Hoechst_NMA">			
			<span id="CM_Hoechst_NMA_B">Nuclei Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Hoechst_SEQ" name="CM_Hoechst_SEQ" value="CM_Hoechst_SEQ">
			<span id="CM_Hoechst_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="CM_Mito_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCardiomyocyte Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="CM_Mito_posMT" name="CM_Mito_posMT" value="CM_Mito_posMT">			
			<span id="CM_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Mito_MTmsa" name="CM_Mito_MTmsa" value="CM_Mito_MTmsa">			
			<span id="CM_Mito_MTmsa_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="CM_Mito_ACMA" name="CM_Mito_ACMA" value="CM_Mito_ACMA">			
			<span id="CM_Mito_ACMA_B">All Cells Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Mito_SEQ" name="CM_Mito_SEQ" value="CM_Mito_SEQ">
			<span id="CM_Mito_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	
	
	
	<div id="HEP_Hoechst_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iHepatocyte Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Hoechst_TC" name="HEP_Hoechst_TC" value="HEP_Hoechst_TC">			
			<span id="HEP_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Hoechst_NI" name="HEP_Hoechst_NI" value="HEP_Hoechst_NI">			
			<span id="HEP_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Hoechst_NMA" name="HEP_Hoechst_NMA" value="HEP_Hoechst_NMA">			
			<span id="HEP_Hoechst_NMA_B">Nuclei Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Hoechst_SEQ" name="HEP_Hoechst_SEQ" value="HEP_Hoechst_SEQ">
			<span id="HEP_Hoechst_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="HEP_Mito_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iHepatocyte Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Mito_posMT" name="HEP_Mito_posMT" value="HEP_Mito_posMT">			
			<span id="HEP_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Mito_MTmsa" name="HEP_Mito_MTmsa" value="HEP_Mito_MTmsa">			
			<span id="HEP_Mito_MTmsa_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="HEP_Mito_ACMA" name="HEP_Mito_ACMA" value="HEP_Mito_ACMA">			
			<span id="HEP_Mito_ACMA_B">All Cells Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Mito_SEQ" name="HEP_Mito_SEQ" value="HEP_Mito_SEQ">
			<span id="HEP_Mito_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	
	
	
	<div id="ENDO_Hoechst_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iEndothelial Cells Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Hoechst_TC" name="ENDO_Hoechst_TC" value="ENDO_Hoechst_TC">			
			<span id="ENDO_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Hoechst_NI" name="ENDO_Hoechst_NI" value="ENDO_Hoechst_NI">			
			<span id="ENDO_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Hoechst_NMA" name="ENDO_Hoechst_NMA" value="ENDO_Hoechst_NMA">			
			<span id="ENDO_Hoechst_NMA_B">Nuclei Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Mito_SEQ" name="CM_Mito_SEQ" value="CM_Mito_SEQ">
			<span id="ENDO_Mito_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="ENDO_Mito_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iEndothelial Cells Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Mito_posMT" name="ENDO_Mito_posMT" value="ENDO_Mito_posMT">			
			<span id="ENDO_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Mito_MTmsa" name="ENDO_Mito_MTmsa" value="ENDO_Mito_MTmsa">			
			<span id="ENDO_Mito_MTmsa_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Mito_ACMA" name="ENDO_Mito_ACMA" value="ENDO_Mito_ACMA">			
			<span id="ENDO_Mito_ACMA_B">All Cells Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Hoechst_SEQ" name="ENDO_Hoechst_SEQ" value="ENDO_Hoechst_SEQ">
			<span id="ENDO_Hoechst_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="ENDO_TubForm_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iEndothelial Cells Tube Formation Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_TubForm_TTL" name="ENDO_TubForm_TTL" value="ENDO_TubForm_TTL">			
			<span id="ENDO_TubForm_TTL_B">Total Tube Length<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_TubForm_MTL" name="ENDO_TubForm_MTL" value="ENDO_TubForm_MTL">			
			<span id="ENDO_TubForm_MTL_B">Mean Tube Length<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_TubForm_TTA" name="ENDO_TubForm_TTA" value="ENDO_TubForm_TTA">			
			<span id="ENDO_TubForm_TTA_B">Total Tube Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_TubForm_BrPt" name="ENDO_TubForm_BrPt" value="ENDO_TubForm_BrPt">			
			<span id="ENDO_TubForm_BrPt_B">Branch Points<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_TubForm_SEQ" name="ENDO_TubForm_SEQ" value="ENDO_TubForm_SEQ">
			<span id="ENDO_TubForm_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	
	
	
	<div id="HUV_Hoechst_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >HUVEC Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Hoechst_TC" name="HUV_Hoechst_TC" value="HUV_Hoechst_TC">			
			<span id="HUV_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Hoechst_NI" name="HUV_Hoechst_NI" value="HUV_Hoechst_NI">			
			<span id="HUV_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Hoechst_NMA" name="HUV_Hoechst_NMA" value="HUV_Hoechst_NMA">			
			<span id="HUV_Hoechst_NMA_B">Nuclei Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Hoechst_SEQ" name="HUV_Hoechst_SEQ" value="HUV_Hoechst_SEQ">
			<span id="HUV_Hoechst_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="HUV_Mito_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >HUVEC Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Mito_posMT" name="HUV_Mito_posMT" value="HUV_Mito_posMT">			
			<span id="HUV_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Mito_MTmsa" name="HUV_Mito_MTmsa" value="HUV_Mito_MTmsa">			
			<span id="HUV_Mito_MTmsa_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="HUV_Mito_ACMA" name="HUV_Mito_ACMA" value="HUV_Mito_ACMA">			
			<span id="HUV_Mito_ACMA_B">All Cells Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Mito_SEQ" name="HUV_Mito_SEQ" value="HUV_Mito_SEQ">
			<span id="HUV_Mito_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="HUV_TubForm_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >HUVEC Tube Formation Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HUV_TubForm_TTL" name="HUV_TubForm_TTL" value="HUV_TubForm_TTL">			
			<span id="HUV_TubForm_TTL_B">Total Tube Length<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_TubForm_MTL" name="HUV_TubForm_MTL" value="HUV_TubForm_MTL">			
			<span id="HUV_TubForm_MTL_B">Mean Tube Length<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_TubForm_TTA" name="HUV_TubForm_TTA" value="HUV_TubForm_TTA">			
			<span id="HUV_TubForm_TTA_B">Total Tube Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_TubForm_BrPt" name="HUV_TubForm_BrPt" value="HUV_TubForm_BrPt">			
			<span id="HUV_TubForm_BrPt_B">Branch Points<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_TubForm_SEQ" name="HUV_TubForm_SEQ" value="HUV_TubForm_SEQ">
			<span id="HUV_TubForm_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	
	
	
	<div id="Neur_Hoechst_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iNeuron Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Hoechst_TC" name="Neur_Hoechst_TC" value="Neur_Hoechst_TC">			
			<span id="Neur_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Hoechst_NI" name="Neur_Hoechst_TC" value="Neur_Hoechst_TC">			
			<span id="Neur_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Hoechst_NMA" name="Neur_Hoechst_NMA" value="Neur_Hoechst_NMA">			
			<span id="Neur_Hoechst_NMA_B">Nuclei Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Hoechst_SEQ" name="Neur_Hoechst_SEQ" value="Neur_Hoechst_SEQ">
			<span id="Neur_Hoechst_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="Neur_Mito_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iNeuron Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Mito_posMT" name="Neur_Mito_posMT" value="Neur_Mito_posMT">			
			<span id="Neur_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Mito_MTmsa" name="Neur_Mito_MTmsa" value="Neur_Mito_MTmsa">			
			<span id="Neur_Mito_MTmsa_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="Neur_Mito_ACMA" name="Neur_Mito_ACMA" value="Neur_Mito_ACMA">			
			<span id="Neur_Mito_ACMA_B">All Cells Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Mito_SEQ" name="Neur_Mito_SEQ" value="Neur_Mito_SEQ">
			<span id="Neur_Mito_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="Neur_NeurOut_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iNeuron Neurite Outgrowth Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Neur_NeurOut_TotOut" name="Neur_NeurOut_TotOut" value="Neur_NeurOut_TotOut">			
			<span id="Neur_NeurOut_TotOut_B">Total Outgrowth<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_NeurOut_MeOutCe" name="Neur_NeurOut_MeOutCe" value="Neur_NeurOut_MeOutCe">			
			<span id="Neur_NeurOut_MeOutCe_B">Mean Outgrowth per Cell<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_NeurOut_TotBra" name="Neur_NeurOut_TotBra" value="Neur_NeurOut_TotBra">			
			<span id="Neur_NeurOut_TotBra_B">Total Branches<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_NeurOut_TotPr" name="Neur_NeurOut_TotPr" value="Neur_NeurOut_TotPr">			
			<span id="Neur_NeurOut_TotPr_B">Total Branches<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_NeurOut_SEQ" name="Neur_NeurOut_SEQ" value="Neur_NeurOut_SEQ">
			<span id="Neur_NeurOut_SEQ_B">TempOseq<br></span>
		<br>
	</div>

	
	
	<div id="Macr_Hoechst_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Hoechst_TC" name="Macr_Hoechst_TC" value="Macr_Hoechst_TC">			
			<span id="Macr_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Hoechst_NI" name="Macr_Hoechst_NI" value="Macr_Hoechst_NI">			
			<span id="Macr_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Hoechst_NMA" name="Macr_Hoechst_NMA" value="Macr_Hoechst_NMA">			
			<span id="Macr_Hoechst_NMA_B">Nuclei Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Hoechst_SEQ" name="Macr_Hoechst_SEQ" value="Macr_Hoechst_SEQ">
			<span id="Macr_Hoechst_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="Macr_Mito_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Mito_posMT" name="Macr_Mito_posMT" value="Macr_Mito_posMT">			
			<span id="Macr_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Mito_MTmsa" name="Macr_Mito_MTmsa" value="Macr_Mito_MTmsa">			
			<span id="Macr_Mito_MTmsa_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="Macr_Mito_ACMA" name="Macr_Mito_ACMA" value="Macr_Mito_ACMA">			
			<span id="Macr_Mito_ACMA_B">All Cells Mean Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Mito_SEQ" name="Macr_Mito_SEQ" value="Macr_Mito_SEQ">
			<span id="Macr_Mito_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="Macr_Phag_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Phagocytosis Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Phag_PhagCe" name="Macr_Phag_PhagCe" value="Macr_Phag_PhagCe">			
			<span id="Macr_Phag_PhagCe_B">Total Outgrowth<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Phag_PhagAr" name="Macr_Phag_PhagAr" value="Macr_Phag_PhagAr">			
			<span id="Macr_Phag_PhagAr_B">Mean Outgrowth per Cell<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Phag_SEQ" name="Macr_Phag_SEQ" value="Macr_Phag_SEQ">
			<span id="Macr_Phag_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="Macr_Cyto_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Cytokine Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Cyto_Il6" name="Macr_Cyto_Il6" value="Macr_Cyto_Il6">			
			<span id="Macr_Cyto_Il6_B">Il-6<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Cyto_Macr_Il1a" name="Macr_Cyto_Il1a" value="Macr_Cyto_Il1a">			
			<span id="Macr_Cyto_Il1a_B">Il-1a<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Cyto_SEQ" name="Macr_Cyto_SEQ" value="Macr_Cyto_SEQ">
			<span id="Macr_Cyto_SEQ_B">TempOseq<br></span>
		<br>
	</div>
	<div id="Macr_MacroOut_phenos" class="all_phenos" style="display: none; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Cytokine Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Macr_MacroOut_MIP1a" name="Macr_MacroOut_MIP1a" value="Macr_MacroOut_MIP1a">			
			<span id="Macr_MacroOut_MIP1a_B">MIP-1a<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_MacroOut_TNFa" name="Macr_MacroOut_TNFa" value="Macr_MacroOut_TNFa">			
			<span id="Macr_MacroOut_TNFa_B">TNF-1a<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_MacroOut_SEQ" name="Macr_MacroOut_SEQ" value="Macr_MacroOut_SEQ">
			<span id="Macr_MacroOut_SEQ_B">TempOseq<br></span>
		<br>
	</div>

</div>	<!-- end of div for phenotypes. -->


<!-- Constructing file search ================================ -->




























</body>
</html>