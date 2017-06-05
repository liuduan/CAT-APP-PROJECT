function should_alert(){
	alert("hh");
}


function searchFiles(){
	var lCellLines="";
	var lCount=0;
	$. each($("input[name='celllines']:checked"), function(){
		if(lCount==0){
			lCellLines= $(this).val();
		}else{
			lCellLines=lCellLines+","+$(this).val();
			
		}
		lCount++
	});
		
	var lCount1=0;
	var lAssayNames="";
	$. each($("input[name='assaynames']:checked"), function(){
		if(lCount1==0){
			lAssayNames=$(this).val();
		}else{
			lAssayNames=lAssayNames+","+$(this).val();
			
		}
		lCount1++;
	});
	
	var lCount2=0;
	var lPhenoTypes="";
		$. each($("input[name='phenotypes']:checked"), function(){
			if(lCount2==0){
				lPhenoTypes=$(this).val();

			}else{
				
				lPhenoTypes=lPhenoTypes+","+$(this).val();
			}
			
			
			lCount2++;
		});
		
		var lCount3=0;
			
	var lPlate="";
			$. each($("input[name='pd']:checked"), function(){
				if(lCount3==0){
					lPlate = $(this).val();
				}else{
					lPlate=lPlate+","+$(this).val();
				}
				lCount3++;
			});

    
			$.ajax({
		        type: "GET",
		        url: "ViewFilesServlet",
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        data: { 
		            'lCM': lCellLines, 
		            'lAN': lAssayNames,
		            'lPT': lPhenoTypes,
		            'lPD': lPlate
		          },
		        //data: {"lCM": lCellLines, "lAN": lAssayNames, "lPT": lPhenoTypes, "lPD": lPlate},
		        success: function (responseText) {
		        	var lfileList = responseText.getElementsByTagName("file");
		        	
		        	
		        	var lTableBody;
		        	lTableBody ='<br>'+'<form action="DownloadFileServlet">'+'<table class="table" style="width: 70%;">'
		        				+'<thead> <tr>'
						  		+ '<th>Select</th>'
						  		+ '<th>File Name</th>'
						  		+ '<th>Uploaded Date</th>'
						  		+ '<th>Description</th></thead><tbody>';
		        	
		        	var lPagination;
		        	var lLoopCount=0;
		        	var lFileExists=0;
		        	for(var i=0;i<lfileList.length;i++){
		        		lFileExists=1;
		        		lLoopCount=lLoopCount+1;
		        		var lFileName=lfileList[i].childNodes[2].firstChild.nodeValue;
		        		var lFilePath=lfileList[i].childNodes[1].firstChild.nodeValue;
		        		var lUploadTime=lfileList[i].childNodes[3].firstChild.nodeValue;
		        		var lDescription=lfileList[i].childNodes[4].firstChild.nodeValue;
		        		var lClassStyle;
		        		var lTrId;
		        		if(lfileList[i].childNodes[0].firstChild.nodeValue == "xls" || lfileList[i].childNodes[0].firstChild.nodeValue == "xlsx" ){
		        			lClassStyle="success";
		        			lTrId="xls";
		        		}else if(lfileList[i].childNodes[0].firstChild.nodeValue == "pdf"){
		        			lClassStyle="danger";
		        			lTrId="pdf";
		        		}else if(lfileList[i].childNodes[0].firstChild.nodeValue == "jpeg"){
		        			lClassStyle="warning";
		        			lTrId="img";
		        		}else{
		        			lClassStyle="active";
		        		}
		        			
		        			lTableBody=lTableBody+'<tr class='+lClassStyle+'>'
		        								 +'<td>'
		        								 + '<input type="checkbox" name="optradio"  id ='
		     		        					 + lFilePath
		     		        					 + '  value='+lFilePath+ '>'
		    		        					 +'</td>'
		    		        					 +'<td>'
		    		        					 +lFileName+'</td>'
		    		        					 +'<td>'
		    		        					 +lUploadTime+'</td>'
		    		        					 +'<td>'
		    		        					 +lDescription+'</td>'+'</tr>';
		        		}
		        	lPagination=(lLoopCount)%10;
		        	
		        	/// Loop for pagination ///
		        	
		        	/*var lPageHTML ='<ul class="pager">'
		        					+ '<li><a href="#">Next</a></li>'
		        					+ '<li><a href="#">Previous</a></li>';
		        					+'</ul>'*/;
		        	/*for(var i=1;i<=lPagination;i++){
		        		lPageHTML=lPageHTML+'<li><a href="#"> '+i+ '</a></li>'	;
		        	}*/
		        	if(lFileExists==1){
		        		
		        		if(lLoopCount>8){
		        			lTableBody=lTableBody+'<tr class="pager">'+'<td><a href="#">Next</a>&nbsp;&nbsp;<a href="#">Previous</a></td></tr>';
		        		}
		        		lTableBody=lTableBody+'<tr id="button">'+'<td><input type="submit" class="btn btn-lg btn-success btn-block" name="download" style="border-radius: 5px;" value="Download"></td>';
		        		lTableBody=lTableBody+'<td><input type="submit" class="btn btn-lg btn-success btn-block" name="json" style="border-radius: 5px;" value="Convert to JSON"></td>'+'</tr>';
		        		lTableBody=lTableBody+'</tbody>'+'</table>'+'</form>';
		        		lTableBody=lTableBody+'</tbody>'+'</table>'+'</form>';
		        		
		        		jQuery("#allFiles").html(lTableBody);
		        		
		        	}else{
		        		lTableBody=lTableBody+'<br><br>'+'<tr class="info">'+'<td></td><td></td><td><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No Files Exists!!<b></td><td></td>'+'</tr>';
		        		lTableBody=lTableBody+'</tbody>'+'</table>'+'</form>';
		        		jQuery("#allFiles").html(lTableBody);
		        	}				
		        	//jQuery("#pagination").html(lPageHTML);
		        	
		        }
		          
		    });
			
		}



function downloadfiles(){
	
	var lSelectedCheckBox="";
	var lCount=0;
	$. each($("input[name='optradio']:checked"), function(){
		if(lCount==0){
			lSelectedCheckBox= $(this).val();
		}else{
			lSelectedCheckBox=lSelectedCheckBox+","+$(this).val();
			
		}
		lCount++
	});
	if(lSelectedCheckBox.length>0){
		
	}else{
		alert("Please select any file to download.");
	}
	$.ajax({
        type: "GET",
        url: "DownloadFileServlet",
        dataType: 'text',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: { 
            'lSelectedBox': lSelectedCheckBox, 
            
          },
        //data: {"lCM": lCellLines, "lAN": lAssayNames, "lPT": lPhenoTypes, "lPD": lPlate},
        success: function (responseText) {
        	
        	window.location.href = responseText
        }
    });
	
}

function showExcelFiles() {
    jQuery("#pdf").hide();
 }

function getAssayNames(){					// step 1 to 2
	// alert("");
	$("#step2").show();
	
	var Cellline = $('#cellline option:selected').val();
	// alert("cellline: " + Cellline);

	if(Cellline == "CM"){
		// alert("hello");
		$(".assaydata").hide();	
		$("#CM").show();
		}else if (Cellline == "HEP"){
			$(".assaydata").hide();	
			$("#HEP").show();			
			// alert("hello 2");
		} else if (Cellline == "ENDO" || Cellline == "HUV" ){
			$(".assaydata").hide();	
			$("#ENDO_HUV").show();	
			// alert("hello 3");
		} else if (Cellline == "Neur"){
			$(".assaydata").hide();	
			$("#Neur").show();	
			// alert("hello 4");
		}else if (Cellline == "Macro"){
			$(".assaydata").hide();	
			$("#Macro").show();	
			// alert("hello 5");
		}else if (Cellline == "A375" || Cellline == "A549" || Cellline == "HepG2" || Cellline == "HepaRG" || 
				Cellline == "MCF7" || Cellline == "HT29" || Cellline == "LN229" || Cellline == "HEK10205f" || 
				Cellline == "HLMVEC" || Cellline == "HMePC" || Cellline == "SH-SY5Y"){
			$(".assaydata").hide();	
			$("#England").show();	
			// alert("hello 6");
			}
	
	$("#step3").hide();
	$("#step4").hide();
	$("#step5").hide();
	$("#step6").hide();
	 }	


function backRefresh(){
	
	assay.options[1].hidden=false;
	assay.options[1].hidden=false;
	assay.options[2].hidden=false;
	assay.options[3].hidden=false;
	assay.options[4].hidden=false;
	assay.options[5].hidden=false;
	assay.options[6].hidden=false;
	assay.options[7].hidden=false;
	assay.options[9].hidden=false;
	assay.options[10].hidden=false;
	assay.options[11].hidden=false;
	assay.options[12].hidden=false;
	assay.options[13].hidden=false;
	assay.options[14].hidden=false;
	assay.options[15].hidden=false;
	jQuery("#assay").val(0);
	jQuery("#assays").prop('disabled',true);	
}

function selectTimePoint(){							// step 2 to 3
	// alert("select time point.");
	var lCellLines=$('input[name=celllines]:checked').val();
	$("#step3").show();
	$("#step4").hide();
	$("#step5").hide();
	$("#step6").hide();

	if(lCellLines>"6" || lCellLines<"17" ){
		tp.options[1].hidden=true;
		tp.options[2].hidden=true;
		tp.options[3].hidden=true;
		tp.options[4].hidden=true;
		
	}

}
function backRefreshTime(){
	tp.options[1].hidden=false;
	tp.options[2].hidden=false;
	tp.options[3].hidden=false;
	tp.options[4].hidden=false;
	jQuery("#tp").val(0);
	jQuery("#times").prop('disabled',true);
}
	
function selectphenotypes(){		// step 3 to step 4){
	var lAssay=jQuery("#assay").val();
	$("#step4").show();
	$("#step5").hide();
	$("#step6").hide();
	

	ph.options[1].hidden=true;
	ph.options[2].hidden=true;
	ph.options[3].hidden=true;
	ph.options[4].hidden=true;
	ph.options[5].hidden=true;
	ph.options[6].hidden=true;
	ph.options[7].hidden=true;
	ph.options[8].hidden=true;
	ph.options[9].hidden=true;
	ph.options[10].hidden=true;
	ph.options[11].hidden=true;
	ph.options[12].hidden=true;
	ph.options[13].hidden=true;
	ph.options[14].hidden=true;
	ph.options[15].hidden=true;
	ph.options[16].hidden=true;
	ph.options[17].hidden=true;
	ph.options[18].hidden=true;
	ph.options[19].hidden=true;
	ph.options[20].hidden=true;
	ph.options[21].hidden=true;
	ph.options[22].hidden=true;
	ph.options[23].hidden=true;
	ph.options[24].hidden=true;
	ph.options[25].hidden=true;
	ph.options[26].hidden=true;
	ph.options[27].hidden=true;
	
	if(lAssay==1){
		ph.options[1].hidden=false;
		ph.options[2].hidden=false;
		ph.options[3].hidden=false;
		ph.options[4].hidden=false;
		ph.options[5].hidden=false;
		ph.options[6].hidden=false;
		ph.options[7].hidden=false;
		ph.options[8].hidden=false;
		
	}else if(lAssay==2){
		ph.options[8].hidden=false;
		ph.options[9].hidden=false;
		ph.options[28].hidden=false;
		
		
	}else if(lAssay==3){
		ph.options[10].hidden=false;
		ph.options[11].hidden=false;
		ph.options[12].hidden=false;
		
	}else if(lAssay==9){
		ph.options[13].hidden=false;
	
		
	}else if(lAssay==10){
		ph.options[14].hidden=false;
	
		
	}else if(lAssay==11){
		ph.options[15].hidden=false;
		ph.options[16].hidden=false;
		ph.options[17].hidden=false;
		ph.options[18].hidden=false;
	
		
	}else if(lAssay==12){
		ph.options[19].hidden=false;
		ph.options[20].hidden=false;
		ph.options[21].hidden=false;
		ph.options[22].hidden=false;	
	}else if(lAssay==13){
		ph.options[23].hidden=false;	
		
	}else if(lAssay==14){
		ph.options[24].hidden=false;
		ph.options[26].hidden=false;
		
	}else if(lAssay==15){
		ph.options[25].hidden=false;
		ph.options[27].hidden=false;
		
	}
   
	
}

function step4_to_5(){		// step 4 to step 5
	$("#step5").show();
	$("#step6").hide();
}

function step5_to_6(){		// step 5 to step 6
	$("#step6").show();
}


function refreshphenotype(){
	
    ph.options[1].hidden=false;
	ph.options[2].hidden=false;
	ph.options[3].hidden=false;
	ph.options[4].hidden=false;
	ph.options[5].hidden=false;
	ph.options[6].hidden=false;
	ph.options[7].hidden=false;
	ph.options[8].hidden=false;
	ph.options[9].hidden=false;
	ph.options[10].hidden=false;
	ph.options[11].hidden=false;
	ph.options[12].hidden=false;
	ph.options[13].hidden=false;
	ph.options[14].hidden=false;
	ph.options[15].hidden=false;
	ph.options[16].hidden=false;
	ph.options[17].hidden=false;
	ph.options[18].hidden=false;
	ph.options[19].hidden=false;
	ph.options[20].hidden=false;
	ph.options[21].hidden=false;
	ph.options[22].hidden=false;
	ph.options[23].hidden=false;
	ph.options[24].hidden=false;
	ph.options[25].hidden=false;
	ph.options[26].hidden=false;
	ph.options[27].hidden=false;
	ph.options[28].hidden=false;
	jQuery("#ph").val(0);
	jQuery("#pheno").prop('disabled',true);
}




// ====================================================================


function getAssaysForDownload(){
	var lCellLinesArray=[];
	
	$. each($("input[name='celllines']:checked"), function(){
		lCellLinesArray.push($(this).val());
	});
	jQuery("#AssayHead").children().eq(0).hide();
	jQuery("#AssayHead").children().eq(1).hide();
	jQuery("#AssayHead").children().eq(2).hide();
	jQuery("#AssayHead").children().eq(3).hide();
	jQuery("#AssayHead").children().eq(4).hide();
	jQuery("#AssayHead").children().eq(5).hide();
	jQuery("#AssayHead").children().eq(6).hide();
	jQuery("#AssayHead").children().eq(7).hide();
	jQuery("#AssayHead").children().eq(8).hide();
	jQuery("#AssayHead").children().eq(9).hide();
	jQuery("#AssayHead").children().eq(10).hide();
	jQuery("#AssayHead").children().eq(11).hide();
	jQuery("#AssayHead").children().eq(12).hide();
	jQuery("#AssayHead").children().eq(13).hide();
	jQuery("#AssayHead").children().eq(14).hide();
	jQuery("#AssayHead").children().eq(15).hide();
	if(lCellLinesArray==0){
		jQuery("#AssayHead").children().eq(0).show();
		jQuery("#AssayHead").children().eq(1).show();
		jQuery("#AssayHead").children().eq(2).show();
		jQuery("#AssayHead").children().eq(3).show();
		jQuery("#AssayHead").children().eq(4).show();
		jQuery("#AssayHead").children().eq(5).show();
		jQuery("#AssayHead").children().eq(6).show();
		jQuery("#AssayHead").children().eq(7).show();
		jQuery("#AssayHead").children().eq(8).show();
		jQuery("#AssayHead").children().eq(9).show();
		jQuery("#AssayHead").children().eq(10).show();
		jQuery("#AssayHead").children().eq(11).show();
		jQuery("#AssayHead").children().eq(12).show();
		jQuery("#AssayHead").children().eq(13).show();
		jQuery("#AssayHead").children().eq(14).show();
		jQuery("#AssayHead").children().eq(15).show();
		
	}
	
	for(var i=0;i<lCellLinesArray.length;i++){
		var lCellLines=lCellLinesArray[i];
		if(lCellLines==2){
			jQuery("#AssayHead").children().eq(0).show();
			jQuery("#AssayHead").children().eq(1).show();
			jQuery("#AssayHead").children().eq(2).show();
		
			
		} else if (lCellLines==1){
			
			jQuery("#AssayHead").children().eq(9).show();
			jQuery("#AssayHead").children().eq(10).show();
			jQuery("#AssayHead").children().eq(2).show();
			jQuery("#AssayHead").children().eq(3).show();
			jQuery("#AssayHead").children().eq(4).show();
			
			
		}
		else if (lCellLines==3 ){
			
			jQuery("#AssayHead").children().eq(2).show();
			jQuery("#AssayHead").children().eq(3).show();
			jQuery("#AssayHead").children().eq(9).show();
			jQuery("#AssayHead").children().eq(10).show();
			
			
		}
		else if (lCellLines==4 ){

			jQuery("#AssayHead").children().eq(2).show();
			jQuery("#AssayHead").children().eq(3).show();
			jQuery("#AssayHead").children().eq(9).show();
			jQuery("#AssayHead").children().eq(10).show();
					
				}
		else if (lCellLines==5 ){
		
			
			jQuery("#AssayHead").children().eq(2).show();
			jQuery("#AssayHead").children().eq(3).show();
			jQuery("#AssayHead").children().eq(12).show();
			jQuery("#AssayHead").children().eq(13).show();
			jQuery("#AssayHead").children().eq(14).show();
			jQuery("#AssayHead").children().eq(15).show();
			
			
					
				}
		else if (lCellLines>6 || lCellLines<17 ){

			
			jQuery("#AssayHead").children().eq(4).show();
			jQuery("#AssayHead").children().eq(5).show();
			jQuery("#AssayHead").children().eq(6).show();
			jQuery("#AssayHead").children().eq(7).show();
			jQuery("#AssayHead").children().eq(8).show();
			
		}else{
			jQuery("#AssayHead").children().eq(1).show();
			jQuery("#AssayHead").children().eq(2).show();
			jQuery("#AssayHead").children().eq(3).show();
			jQuery("#AssayHead").children().eq(4).show();
			jQuery("#AssayHead").children().eq(5).show();
			jQuery("#AssayHead").children().eq(6).show();
			jQuery("#AssayHead").children().eq(7).show();
			jQuery("#AssayHead").children().eq(8).show();
			jQuery("#AssayHead").children().eq(9).show();
			jQuery("#AssayHead").children().eq(10).show();
			jQuery("#AssayHead").children().eq(11).show();
			jQuery("#AssayHead").children().eq(12).show();
			jQuery("#AssayHead").children().eq(13).show();
			jQuery("#AssayHead").children().eq(14).show();
			jQuery("#AssayHead").children().eq(15).show();
			
		}
	}
	
}
function getPhenotypes(){
	var lPhenotypesArray=[];
	
	$. each($("input[name='assaynames']:checked"), function(){
		lPhenotypesArray.push($(this).val());
	});
	jQuery("#phenohead").children().eq(0).hide();
	jQuery("#phenohead").children().eq(1).hide();
	jQuery("#phenohead").children().eq(2).hide();
	jQuery("#phenohead").children().eq(3).hide();
	jQuery("#phenohead").children().eq(4).hide();
	jQuery("#phenohead").children().eq(5).hide();
	jQuery("#phenohead").children().eq(6).hide();
	jQuery("#phenohead").children().eq(7).hide();
	jQuery("#phenohead").children().eq(8).hide();
	jQuery("#phenohead").children().eq(9).hide();
	jQuery("#phenohead").children().eq(10).hide();
	jQuery("#phenohead").children().eq(11).hide();
	jQuery("#phenohead").children().eq(12).hide();
	jQuery("#phenohead").children().eq(13).hide();
	jQuery("#phenohead").children().eq(14).hide();
	jQuery("#phenohead").children().eq(15).hide();
	jQuery("#phenohead").children().eq(16).hide();
	jQuery("#phenohead").children().eq(17).hide();
	jQuery("#phenohead").children().eq(18).hide();
	jQuery("#phenohead").children().eq(19).hide();
	jQuery("#phenohead").children().eq(20).hide();
	jQuery("#phenohead").children().eq(21).hide();
	jQuery("#phenohead").children().eq(22).hide();
	jQuery("#phenohead").children().eq(23).hide();
	jQuery("#phenohead").children().eq(24).hide();
	jQuery("#phenohead").children().eq(25).hide();
	jQuery("#phenohead").children().eq(26).hide();
	jQuery("#phenohead").children().eq(27).hide();
	jQuery("#phenohead").children().eq(28).hide();
	
	if(lPhenotypesArray==0){
		jQuery("#phenohead").children().eq(0).show();
		jQuery("#phenohead").children().eq(1).show();
		jQuery("#phenohead").children().eq(2).show();
		jQuery("#phenohead").children().eq(3).show();
		jQuery("#phenohead").children().eq(4).show();
		jQuery("#phenohead").children().eq(5).show();
		jQuery("#phenohead").children().eq(6).show();
		jQuery("#phenohead").children().eq(7).show();
		jQuery("#phenohead").children().eq(8).show();
		jQuery("#phenohead").children().eq(9).show();
		jQuery("#phenohead").children().eq(10).show();
		jQuery("#phenohead").children().eq(11).show();
		jQuery("#phenohead").children().eq(12).show();
		jQuery("#phenohead").children().eq(13).show();
		jQuery("#phenohead").children().eq(14).show();
		jQuery("#phenohead").children().eq(15).show();
		jQuery("#phenohead").children().eq(16).show();
		jQuery("#phenohead").children().eq(17).show();
		jQuery("#phenohead").children().eq(18).show();
		jQuery("#phenohead").children().eq(19).show();
		jQuery("#phenohead").children().eq(20).show();
		jQuery("#phenohead").children().eq(21).show();
		jQuery("#phenohead").children().eq(22).show();
		jQuery("#phenohead").children().eq(23).show();
		jQuery("#phenohead").children().eq(24).show();
		jQuery("#phenohead").children().eq(25).show();
		jQuery("#phenohead").children().eq(26).show();
		jQuery("#phenohead").children().eq(27).show();
		jQuery("#phenohead").children().eq(28).show();
		
	}
	
for(var i=0;i<lPhenotypesArray.length;i++){
	var lAssay=lPhenotypesArray[i];
	if(lAssay==1){
		jQuery("#phenohead").children().eq(1).show();
		jQuery("#phenohead").children().eq(2).show();
		jQuery("#phenohead").children().eq(3).show();
		jQuery("#phenohead").children().eq(4).show();
		jQuery("#phenohead").children().eq(5).show();
		jQuery("#phenohead").children().eq(6).show();
		jQuery("#phenohead").children().eq(7).show();
		jQuery("#phenohead").children().eq(8).show();
	
		
	}else if(lAssay==2){
		jQuery("#phenohead").children().eq(8).show();
		jQuery("#phenohead").children().eq(9).show();
		jQuery("#phenohead").children().eq(28).show();
		
		
	}else if(lAssay==3){
		jQuery("#phenohead").children().eq(10).show();
		jQuery("#phenohead").children().eq(11).show();
		jQuery("#phenohead").children().eq(12).show();
		
	}else if(lAssay==6){
		jQuery("#phenohead").children().eq(27).show();
		jQuery("#phenohead").children().eq(28).show();
		
		
	}
	
	else if(lAssay==9){
		jQuery("#phenohead").children().eq(13).show();

	
		
	}else if(lAssay==10){
		jQuery("#phenohead").children().eq(14).show();
	
		
	}else if(lAssay==11){
		jQuery("#phenohead").children().eq(15).show();
		jQuery("#phenohead").children().eq(16).show();
		jQuery("#phenohead").children().eq(17).show();
		jQuery("#phenohead").children().eq(18).show();
		
		
	}else if(lAssay==12){
		jQuery("#phenohead").children().eq(19).show();
		jQuery("#phenohead").children().eq(20).show();
		jQuery("#phenohead").children().eq(21).show();
		jQuery("#phenohead").children().eq(22).show();
	}else if(lAssay==13){
		jQuery("#phenohead").children().eq(23).show();
		
	}else if(lAssay==14){
		jQuery("#phenohead").children().eq(24).show();
		jQuery("#phenohead").children().eq(26).show();
		
	}else if(lAssay==15){
		jQuery("#phenohead").children().eq(25).show();
		jQuery("#phenohead").children().eq(27).show();
		
	}
   
	}
	
	
}
function matchCasNumbers(){
	
	var lCATAPPID1;
	var lCATAPPID2;
	var lCount1=0;
	$. each($("input[name='concawe']:checked"), function(){
		if(lCount1==0){
			lCATAPPID1=$(this).val();
		}else{
			lCATAPPID1=lCATAPPID1+","+$(this).val();
			
		}
		lCount1++;
	});
	var lCount2=0;
	$. each($("input[name='casnames']:checked"), function(){
		if(lCount2==0){
			lCATAPPID2=$(this).val();
		}else{
			lCATAPPID2=lCATAPPID2+","+$(this).val();
			
		}
		lCount2++;
	});

	if(lCATAPPID1==lCATAPPID2){
		
	}else{
		alert("Both the IDs do not match.Kindly select the corresponding CAS number.");
		return false;
	}
}

//function closemessageheader(){
//	jQuery(".alert").hide();
//}