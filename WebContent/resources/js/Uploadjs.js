<<<<<<< HEAD
function should_alert(){
	alert("hh");
}

function showExcelFiles() {
    jQuery("#pdf").hide();
 }

function getAssayNames(){					// step 1 to 2 (L.D. function)

		var Cellline = $('#cellline option:selected').val();

	// alert("cellline: " + Cellline);

	if(Cellline == "CM"){
		// alert("hello");
		$(".all_assays").hide();	
		$('#CM_assay_select').attr('name', 'assay');
		$("#CM_assays").show();
		}else if (Cellline == "HEP"){
			$(".all_assays").hide();	
			$('#HEP_assay_select').attr('name', 'assay');
			$("#HEP_assays").show();			
			// alert("hello 2");
		} else if (Cellline == "ENDO" || Cellline == "HUV" ){
			$(".all_assays").hide();	
			$('#ENDO_HUV_assay_select').attr('name', 'assay');
			$("#ENDO_HUV_assays").show();	
			// alert("hello 3");
		} else if (Cellline == "Neur"){
			$(".all_assays").hide();	
			$('#Neur_assay_select').attr('name', 'assay');
			$("#Neur_assays").show();	
			// alert("hello 4");
		}else if (Cellline == "Macro"){
			$(".all_assays").hide();	
			$('#Macro_assay_select').attr('name', 'assay');
			$("#Macro_assays").show();	
			// alert("hello 5");
		}else if (Cellline == "A375" || Cellline == "A549" || Cellline == "HepG2" || Cellline == "HepaRG" || 
				Cellline == "MCF7" || Cellline == "HT29" || Cellline == "LN229" || Cellline == "HEK10205f" || 
				Cellline == "HLMVEC" || Cellline == "HMePC" || Cellline == "SH-SY5Y"){
			$(".all_assays").hide();	
			$('#England_assay_select').attr('name', 'assay');
			$("#England_assays").show();	
			$("#step4").append("<input type='hidden' name='timepoint' value='24hr'>");
			// alert("hello 6");
			}
	
	
	$("#step2").show();
	$("#step4").hide();
	$("#step5").hide();
	$("#step6").hide();

/*else if(document.getElementById('processed').checked)

	{
	
	$("#step4").hide();
	$("#step5").hide();
	$("#step6").hide();
	$("#step2").show();
	}
*/}



function selectTimePoint(){							// step 3 to 4
	// alert("select time point.");
	var Cellline = $('#cellline option:selected').val();
	var assay = "";
	// alert("assay: " + assay);
	if (Cellline == "CM"){
		assay = $("#CM_assay_select option:selected").val();
		if(assay =="Ca2"){
			$('#timepoints_4_select').attr('name', 'timepoint');
			$(".all_time_div").hide();	
			$("#timepoints_4").show();	
			// alert("hello 5");
		} else{
		    $('#timepoints_2_select').attr('name', 'timepoint');
			$(".all_time_div").hide();	
			$("#timepoints_2").show();	
			}
		$("#step4").show();
		$("#step5").hide();
		$("#step6").hide();
		
	}else if (Cellline == "ENDO" || Cellline == "HUV" ){
		assay = $("#ENDO_HUV_assay_select option:selected").val();
		if(assay =="Cyto" || assay =="CTG" ){
			$(".all_time_div").hide();	
			$("#timepoints_24").show();	
			$("#step4").append("<input type='hidden' name='timepoint' value='24hr'>");
				// alert("hello 5");
		} else if(assay =="TubForm"){
			$(".all_time_div").hide();	
			$("#timepoints_18").show();	
			$("#step4").append("<input type='hidden' name='timepoint' value='18hr'>");
		} else if(assay =="Seq" ){
			$(".all_time_div").hide();	
			$("#timepoints_24").show();	
			$("#step4").append("<input type='hidden' name='timepoint' value='24hr'>");
		}
		$("#step4").show();

		if (document.getElementById('raw').checked){
			$("#step5").show();
			$("#step6").hide();
			
		}else{
			$("#step5").hide();
			$("#step6").show();
		}

	}else if (Cellline == "Neur"){
		assay = $("#Neur_assay_select option:selected").val();
		if(assay =="Neur"){
			$(".all_time_div").hide();	
			$("#timepoints_72").show();	
			$("#step4").append("<input type='hidden' name='timepoint' value='72hr'>");
				// alert("hello 5");
		} else if(assay =="CTG" ){
			$(".all_time_div").hide();	
			$("#timepoints_24").show();	
			$("#step4").append("<input type='hidden' name='timepoint' value='24hr'>");
		} else if(assay =="Seq" ){
			$(".all_time_div").hide();	
			$("#timepoints_72").show();	
			$("#step4").append("<input type='hidden' name='timepoint' value='72hr'>");
		}
		$("#step4").show();

		if (document.getElementById('raw').checked) {
			$("#step5").show();
			
		}else{
			$("#step5").hide();
		}

		$("#step6").hide();
	} else if (Cellline == "HEP" || Cellline == "Macro"){
		$(".all_time_div").hide();	
		$("#timepoints_48").show();	
		$("#step4").show();
		$("#step4").append("<input type='hidden' name='timepoint' value='48hr'>");
		step4_to_5();
		}
	else{step5_to_6();}	
	if (document.getElementById('processed').checked){
		selectphenotypes();
	} 
	
}						// end of selectTimePoint(){ }



function step4_to_5(){		// step 4 to step 5

	if (document.getElementById('raw').checked) 
	{
	
	$("#step5").show();
	$("#step6").hide();
=======
function step4_to_5(){		// step 4 to step 5
>>>>>>> SS-Master/master
	
 if (document.getElementById('processed').checked) 
	{
		
		$("#description").hide();
		$("#ta").hide();
		
	}	
 else{
		$("#description").show();
		$("#ta").show();
 }
 $("#step6").show();

}

function selectphenotypes(){
	
	var lCellLine=jQuery("#cellline").val();
	var lAssaystring=lCellLine+"_"+"assay_select";
	var lAssay=jQuery("#"+lAssaystring).val();
	jQuery("#phenotypes").html("");
	$.ajax({
        type: "GET",
        url: "Phenotypes",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: { 
            'lCM': lCellLine,
            'lAssay': lAssay
          },
          	 success: function (responseText) {
          		/* alert("Test");*/
        	var lPhenolist = responseText.getElementsByTagName("pheno");
        	for(var i=0;i<lPhenolist.length;i++){
        		$("#phenotypes").append(new Option(
        				lPhenolist[i].childNodes[0].firstChild.nodeValue, lPhenolist[i].childNodes[1].firstChild.nodeValue));
        	}

        }
          
    });
}
function closemessageheader(){
	jQuery(".alert").hide();
}

setTimeout(function() {
    $('#messagebox').fadeOut('slow');
}, 1000);


function getAssaysForCellLines(){
	
	
	$("#CM_assays").hide();
	$("#step2").hide();
	$("#CM_assay_select").html("");
	
	$("#step4").hide();
	$("#timepoints_4").hide();
	$("#timepoints_4_select").html("");
	
	$("#step5").hide();
	
	$("#step6").hide();
	
	$("#step3").hide();
	$("#Ph_div").hide();
	
	
	var lCellLine=jQuery("#cellline").val();
		$.ajax({
        type: "POST",
        url: "AssayNames",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: { 
            'lCM': lCellLine,
          },
          	 success: function (responseText) {
          		
            	var lPhenolist = responseText.getElementsByTagName("assay");
            	for(var i=0;i<lPhenolist.length;i++){
            		$("#CM_assay_select").append(new Option(
            				lPhenolist[i].childNodes[0].firstChild.nodeValue, lPhenolist[i].childNodes[1].firstChild.nodeValue));
            	}
            	$("#CM_assays").show();
            	$("#step2").show();

        }
          
    });
	
}
function getNextAttribute(){
	
	var lCellLine=jQuery("#cellline").val();
	var lAssay=jQuery("#CM_assay_select").val();
	if (document.getElementById('raw').checked){
		
		$("#step4").hide();
    	$("#timepoints_4").hide();
    	$("#timepoints_4_select").html("");
    	
		
		$.ajax({
        type: "POST",
        url: "TimePoint",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: { 
            'lCM': lCellLine,
            'lAssay': lAssay
          },
          	 success: function (responseText) {
          		
            	var lPhenolist = responseText.getElementsByTagName("tp");
            	for(var i=0;i<lPhenolist.length;i++){
            		$("#timepoints_4_select").append(new Option(
            				lPhenolist[i].childNodes[0].firstChild.nodeValue, lPhenolist[i].childNodes[1].firstChild.nodeValue));
            	}
            	$("#step4").show();
            	$("#timepoints_4").show();

        }
          
    });
	}
	
		if (document.getElementById('processed').checked){
			$("#step3").hide();
			$("#Ph_div").hide();
			$("#phenotype").html("");
			$.ajax({
		        type: "GET",
		        url: "Phenotypes",
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        data: { 
		            'lCM': lCellLine,
		            'lAssay': lAssay
		          },
		          	 success: function (responseText) {
		          		
		            	var lPhenolist = responseText.getElementsByTagName("pheno");
		            	for(var i=0;i<lPhenolist.length;i++){
		            		$("#phenotype").append(new Option(
		            				lPhenolist[i].childNodes[0].firstChild.nodeValue, lPhenolist[i].childNodes[1].firstChild.nodeValue));
		            	}
		            	$("#step3").show();
		            	$("#Ph_div").show();
		            	

		        }
		          
		    });
		}

}

function getTimePoints(){
	
	var lCellLine=jQuery("#cellline").val();
	var lAssay=jQuery("#CM_assay_select").val();
	var lPhenoType = jQuery("#phenotype").val();
		
		$("#step4").hide();
    	$("#timepoints_4").hide();
    	$("#timepoints_4_select").html("");
    	
		
		$.ajax({
        type: "POST",
        url: "TimePoint",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: { 
            'lCM': lCellLine,
            'lAssay': lAssay,
            'lPhenotype': lPhenoType
          },
          	 success: function (responseText) {
          		
            	var lPhenolist = responseText.getElementsByTagName("tp");
            	for(var i=0;i<lPhenolist.length;i++){
            		$("#timepoints_4_select").append(new Option(
            				lPhenolist[i].childNodes[0].firstChild.nodeValue, lPhenolist[i].childNodes[1].firstChild.nodeValue));
            	}
            	$("#step4").show();
            	$("#timepoints_4").show();

        }
          
    });
	
	
	
}