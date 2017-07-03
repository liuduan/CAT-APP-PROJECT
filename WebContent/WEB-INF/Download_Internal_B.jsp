<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<script>
$(document).ready(function(){
   	alert("ready function B.");
	$("#Assays").hide();
	$("#Assays_B").hide();
	$("#phenotype_title").show();
	$("#Phenotypes").show();
})		// end of the ready function
</script>


<h4 id ="phenotype_title" onclick="assays()" style="color: Blue; margin-left: 40px;">
	<b><u>Please select phenotypes:</u></b>
		<a href="#" onclick="show_hide_phenos()" id="next_to_phenotypes" style="display: none;">
			<button type="button" class="btn btn-xs btn-success"> Next
 				<span class="glyphicon glyphicon-chevron-right"></span>
				</button>
		</a></h4>
		
<div id="Phenotypes" style = "display:; margin-left: 40px;">
	<div id="Ca2_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCardiomyocyte Ca2+ flux phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PF" name="PF" value="PF"></input>			
			<span id="CM_Ca2_PF_B">Peak Frequency<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PW" name="PW" value="PW">			
			<span id="CM_Ca2_PW_B">Peak Width<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PW10" name="PW10" value="PW10">			
			<span id="CM_Ca2_PW10_B">Peak Width at 10% Amplitude<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PA" name="PA" value="PA">			
			<span id="CM_Ca2_PA_B">Peak Amplitude<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PS" name="PS" value="PS">			
			<span id="CM_Ca2_PS_B">Peak Spacing<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PRT" name="PRT" value="PRT">			
			<span id="CM_Ca2_PRT_B">Peak Rise Time<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Ca2_PDT" name="PDT" value="PDT">			
			<span id="CM_Ca2_PDT_B">Peak Decay Time<br></span>
	</div>
	<div id="CM_Hoechst_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCardiomyocyte Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="CM_Hoechst_TC" name="TC" value="TC">			
			<span id="CM_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Hoechst_NMA" name="NMA" value="NMA">			
			<span id="CM_Hoechst_NMA_B">Nuclei Mean Area<br></span>
	</div>
	<div id="CM_Mito_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iCardiomyocyte Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="CM_Mito_posMT" name="posMT" value="posMT">			
			<span id="CM_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="CM_Mito_MSA" name="MSA" value="MSA">			
			<span id="CM_Mito_MSA_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="CM_Mito_ACMA" name="ACMA" value="ACMA">			
			<span id="CM_Mito_ACMA_B">All Cells Mean Area<br></span>
	</div>
	
	
	
	<div id="HEP_Hoechst_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iHepatocyte Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Hoechst_TC" name="TC" value="TC">			
			<span id="HEP_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Hoechst_NI" name="NI" value="NI">			
			<span id="HEP_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Hoechst_NMA" name="NMA" value="NMA">			
			<span id="HEP_Hoechst_NMA_B">Nuclei Mean Area<br></span>
	</div>
	<div id="HEP_Mito_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iHepatocyte Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Mito_posMT" name="posMT" value="posMT">			
			<span id="HEP_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HEP_Mito_MSA" name="MSA" value="MSA">			
			<span id="HEP_Mito_MSA_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="HEP_Mito_ACMA" name="ACMA" value="ACMA">			
			<span id="HEP_Mito_ACMA_B">All Cells Mean Area<br></span>
	</div>
	
	
	
	<div id="ENDO_Hoechst_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iEndothelial Cells Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Hoechst_TC" name="TC" value="TC">			
			<span id="ENDO_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Hoechst_NI" name="NI" value="NI">			
			<span id="ENDO_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Hoechst_NMA" name="NMA" value="NMA">			
			<span id="ENDO_Hoechst_NMA_B">Nuclei Mean Area<br></span>
	</div>
	<div id="ENDO_Mito_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iEndothelial Cells Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Mito_posMT" name="posMT" value="posMT">			
			<span id="ENDO_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Mito_MSA" name="MSA" value="MSA">			
			<span id="ENDO_Mito_MSA_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="ENDO_Mito_ACMA" name="ACMA" value="ACMA">			
			<span id="ENDO_Mito_ACMA_B">All Cells Mean Area<br></span>
	</div>
	<div id="ENDO_TubForm_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iEndothelial Cells Tube Formation Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_TubForm_TTL" name="TTL" value="TTL">			
			<span id="ENDO_TubForm_TTL_B">Total Tube Length<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_TubForm_MTL" name="MTL" value="MTL">			
			<span id="ENDO_TubForm_MTL_B">Mean Tube Length<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_TubForm_TTA" name="TTA" value="TTA">			
			<span id="ENDO_TubForm_TTA_B">Total Tube Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="ENDO_TubForm_BrPt" name="BrPt" value="BrPt">			
			<span id="ENDO_TubForm_BrPt_B">Branch Points<br></span>
	</div>
	
	
	
	<div id="HUV_Hoechst_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >HUVEC Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Hoechst_TC" name="TC" value="TC">			
			<span id="HUV_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Hoechst_NI" name="NI" value="NI">			
			<span id="HUV_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Hoechst_NMA" name="NMA" value="NMA">			
			<span id="HUV_Hoechst_NMA_B">Nuclei Mean Area<br></span>
	</div>
	<div id="HUV_Mito_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >HUVEC Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Mito_posMT" name="posMT" value="posMT">			
			<span id="HUV_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_Mito_MSA" name="MSA" value="MSA">			
			<span id="HUV_Mito_MSA_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="HUV_Mito_ACMA" name="ACMA" value="ACMA">			
			<span id="HUV_Mito_ACMA_B">All Cells Mean Area<br></span>
	</div>
	<div id="HUV_TubForm_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >HUVEC Tube Formation Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="HUV_TubForm_TTL" name="TTL" value="TTL">			
			<span id="HUV_TubForm_TTL_B">Total Tube Length<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_TubForm_MTL" name="MTL" value="MTL">			
			<span id="HUV_TubForm_MTL_B">Mean Tube Length<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_TubForm_TTA" name="TTA" value="TTA">			
			<span id="HUV_TubForm_TTA_B">Total Tube Area<br></span>
		<input type="checkbox" disabled class="all_phenos" id="HUV_TubForm_BrPt" name="BrPt" value="BrPt">			
			<span id="HUV_TubForm_BrPt_B">Branch Points<br></span>
	</div>
	
	
	
	<div id="Neur_Hoechst_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iNeuron Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Hoechst_TC" name="TC" value="TC">			
			<span id="Neur_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Hoechst_NI" name="NI" value="NI">			
			<span id="Neur_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Hoechst_NMA" name="NMA" value="NMA">			
			<span id="Neur_Hoechst_NMA_B">Nuclei Mean Area<br></span>
	</div>
	<div id="Neur_Mito_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iNeuron Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Mito_posMT" name="posMT" value="posMT">			
			<span id="Neur_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_Mito_MSA" name="MSA" value="MSA">			
			<span id="Neur_Mito_MSA_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="Neur_Mito_ACMA" name="ACMA" value="ACMA">			
			<span id="Neur_Mito_ACMA_B">All Cells Mean Area<br></span>
	</div>
	<div id="Neur_NeurOut_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iNeuron Neurite Outgrowth Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Neur_TotOut" name="TotOut" value="TotOut">			
			<span id="Neur_TotOut_B">Total Outgrowth<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_MeOutCe" name="MeOutCe" value="MeOutCe">			
			<span id="Neur_MeOutCe_B">Mean Outgrowth per Cell<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_TotBra" name="TotBra" value="TotBra">			
			<span id="Neur_TotBra_B">Total Branches<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Neur_TotPr" name="TotPr" value="TotPr">			
			<span id="Neur_TotPr_B">Total Branches<br></span>
	</div>

	
	
	<div id="Macr_Hoechst_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Nuclei Staining phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Hoechst_TC" name="TC" value="TC">			
			<span id="Macr_Hoechst_TC_B">Total cell number<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Hoechst_NI" name="NI" value="NI">			
			<span id="Macr_Hoechst_NI_B">Nuclei Intensity<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Hoechst_NMA" name="NMA" value="NMA">			
			<span id="Macr_Hoechst_NMA_B">Nuclei Mean Area<br></span>
	</div>
	<div id="Macr_Mito_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Mitochondrial Integrity phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Mito_posMT" name="posMT" value="posMT">			
			<span id="Macr_Mito_posMT_B">Number of Cells with Intact Mitochondria<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Mito_MSA" name="MSA" value="MSA">			
			<span id="Macr_Mito_MSA_B">Mitochondria Mean Stain Area<br></span>		
		<input type="checkbox" disabled class="all_phenos" id="Macr_Mito_ACMA" name="ACMA" value="ACMA">			
			<span id="Macr_Mito_ACMA_B">All Cells Mean Area<br></span>
	</div>
	<div id="Macr_Phag_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Phagocytosis Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="Macr_PhagCe" name="PhagCe" value="PhagCe">			
			<span id="Macr_PhagCe_B">Total Outgrowth<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_PhagAr" name="PhagAr" value="PhagAr">			
			<span id="Macr_PhagAr_B">Mean Outgrowth per Cell<br></span>
	</div>
	<div id="Macr_Cyto_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Cytokine Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="_Il6" name="Il6" value="Il6">			
			<span id="Macr_Cyto_Il6_B">Il-6<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_Il1a" name="Il1a" value="Il1a">			
			<span id="Macr_Il1a_B">Il-1a<br></span>
	</div>
	<div id="Macr_MacroOut_phenos" class="all_phenos" style="display:; color:LightSteelBlue; margin-left: 20px;">
		<span style="color:black; font-weight: bold;" >iMacrophage Cytokine Phenotypes:</span><br>
		<input type="checkbox" disabled class="all_phenos" id="_MIP1a" name="MIP1a" value="MIP1a">			
			<span id="Macr_MacroOut_MIP1a_B">MIP-1a<br></span>
		<input type="checkbox" disabled class="all_phenos" id="Macr_TNFa" name="TNFa" value="TNFa">			
			<span id="Macr_MacroOut_TNFa_B">TNF-1a<br></span>
	</div>

</div>	<!-- end of div for phenotypes. -->

</body>
</html>