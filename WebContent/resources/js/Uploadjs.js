function searchFiles(){
	
	var lCellLines="";
	var lCount=0;
	$. each($("input[name='CL']:checked"), function(){
		if(lCount==0){
			lCellLines= $(this).val();
		}else{
			lCellLines=lCellLines+","+$(this).val();
			
		}
		lCount++
	});
		
	var lCount1=0;
	var lAssayNames="";
	$. each($("input[name='AN']:checked"), function(){
		if(lCount1==0){
			lAssayNames=$(this).val();
		}else{
			lAssayNames=lAssayNames+","+$(this).val();
			
		}
		lCount1++;
	});
	
	var lCount2=0;
	var lPhenoTypes="";
		$. each($("input[name='pt']:checked"), function(){
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
		        	var lExcel;
		        	var lImages;
		        	var lAllFiles;
		        	var lTotalHtml;
		        	for(var i=0;i<lfileList.length;i++){
		        		
		        		if(lfileList[i].childNodes[0].firstChild.nodeValue == "xls"){
		        			if(lExcel==null){
		        				lExcel="";
		        				lExcel='<div class="row well well-sm span12 spacer" style="width:50%;margin-left: 5%">'
		        		  		+'<label><input type="checkbox" name="optradio" id ='+lfileList[i].childNodes[1].firstChild.nodeValue+ '>&nbsp;'+lfileList[i].childNodes[2].firstChild.nodeValue+ '</label>'+
		        				'</div>';
		        			}else{
		        				lExcel=lExcel+'<div class="row well well-sm span12 spacer" style="width:50%;margin-left: 5%">'
		        		  		+'<label><input type="checkbox" name="optradio" id ='+lfileList[i].childNodes[1].firstChild.nodeValue+ '>&nbsp;'+lfileList[i].childNodes[2].firstChild.nodeValue+'</label>'+
		        				'</div>';
		        			}
		        		}else if(lfileList[i].childNodes[0].firstChild.nodeValue=="pdf"){
		        			if(lImages==null){
		        				lImages='<div class="row well well-sm span12 spacer" style="width:50%;margin-left: 5%">'
		        		  		+'<label><input type="checkbox" name="optradio" id ='+lfileList[i].childNodes[1].firstChild.nodeValue+ '>&nbsp;' +lfileList[i].childNodes[2].firstChild.nodeValue+ '</label>'+
		        				'</div>';
		        			}else{
		        				lImages=lImages+'<div class="row well well-sm span12 spacer" style="width:50%;margin-left: 5%">'
		        		  		+'<label><input type="checkbox" name="optradio" id ='+lfileList[i].childNodes[1].firstChild.nodeValue+ '>&nbsp;'+lfileList[i].childNodes[2].firstChild.nodeValue+'</label>'+
		        				'</div>';
		        			}
		        			
		        		}
		        		if(lTotalHtml==null){
	        				lTotalHtml='<div class="row well well-sm span12 spacer" style="width:50%;margin-left: 5%">'
	        		  		+'<label><input type="checkbox" name="optradio" id ="optradio" value ='+lfileList[i].childNodes[1].firstChild.nodeValue+ '>&nbsp;'+lfileList[i].childNodes[2].firstChild.nodeValue+ '</label>'+
	        				'</div>';
	        			}else{
	        				lTotalHtml=lTotalHtml+'<div class="row well well-sm span12 spacer" style="width:50%;margin-left: 5%">'
	        		  		+'<label><input type="checkbox" name="optradio" id="optradio" value ='+lfileList[i].childNodes[1].firstChild.nodeValue+ '>&nbsp;'+lfileList[i].childNodes[2].firstChild.nodeValue+'</label>'+
	        				'</div>';
	        			}
		        	}
		        	lExcel = lExcel+ '<div class="row">'+
					'<div class="col-xs-3 col-sm-3 col-md-3">'+
                        '<input type="submit" class="btn btn-lg btn-success btn-block" value="Download">'+
					'</div>'+
						'</div>';
		        	jQuery("#excelFiles").html(lExcel);
		        	
		        	lImages = lImages+ '<div class="row">'+
					'<div class="col-xs-3 col-sm-3 col-md-3">'+
                        '<input type="submit" class="btn btn-lg btn-success btn-block" value="Download">'+
					'</div>'+
						'</div>';
		        	jQuery("#images").html(lImages);
		        	
		        	lTotalHtml= lTotalHtml+ '<div class="row">'+
					'<div class="col-xs-3 col-sm-3 col-md-3">'+
                    '<input type="submit" class="btn btn-lg btn-success btn-block" onclick="downloadfiles()" value="Download">'+
				'</div>'+
					'</div>';
				jQuery("#allFiles").html(lTotalHtml);
				
		          
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
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: { 
            'lSelectedBox': lSelectedCheckBox, 
            
          },
        //data: {"lCM": lCellLines, "lAN": lAssayNames, "lPT": lPhenoTypes, "lPD": lPlate},
        success: function (responseText) {}
    });
	
}
