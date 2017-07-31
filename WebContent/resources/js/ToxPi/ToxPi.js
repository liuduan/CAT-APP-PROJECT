
// Search functions ////////////////////////////////////////////////////////////////////////////////////////////
function Search_name() {
  var input, filter, table, tr, td, i;
  
  input = document.getElementById("name_Input");

  filter = input.value.toUpperCase();
  // alert("hi" + filter);
  table = document.getElementById("table_1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];		// here indicate which column to search.
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function Search_cas() {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("cas_Input");
	  filter = input.value.toUpperCase();
	  // alert("hi" + filter);
	  table = document.getElementById("table_1");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[2];		// here indicate which column to search.
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}



// about open and close menus //////////////////////////////////////////////////////////////////////////////////
var leftMenu_on = true;
var rightMenu_on = true;

function openLeftMenu() {
	leftMenu_on = true;
	if(rightMenu_on == true){
		$("#central_area").css("width", "58%");
		}
	else{$("#central_area").css("width", "78%");
		}
	$("#central_area").css("marginLeft", "22%");
	$("#leftMenu").css("width", "22%");
    // $("$leftMenu").show();
    document.getElementById("leftMenu").style.display = "block";  
    $("#button-open-left").hide();
    $("#button-close-left").show();
    
}
function closeLeftMenu() {
	leftMenu_on = false;
	if(rightMenu_on == true){
		$("#central_area").css("width", "80%");
		}
	else{$("#central_area").css("width", "100%");
		}
    document.getElementById("leftMenu").style.display = "none";
    document.getElementById("central_area").style.marginLeft = "0%";
    $("#button-open-left").show();
    $("#button-close-left").hide();
}

function openRightMenu() {
	// document.getElementById("central_area").style.marginRight = "25%";
	rightMenu_on = true;
	if(leftMenu_on == true){
		$("#central_area").css("width", "58%");
		}
	else{$("#central_area").css("width", "80%");}
	
	$("#central_area").css("margin-right", "20%");
    document.getElementById("rightMenu").style.display = "block";    
	document.getElementById("rightMenu").style.width = "20%";
    $("#button-open-right").hide();
    $("#button-close-right").show();
	
}
function closeRightMenu() {
	rightMenu_on = false;
	if(leftMenu_on == true){
		$("#central_area").css("width", "78%");
		}
	else{$("#central_area").css("width", "100%");}
	
    document.getElementById("rightMenu").style.display = "none";
    document.getElementById("central_area").style.marginRight = "0%";
    $("#button-open-right").show();
    $("#button-close-right").hide();
}

////////////////////////////////////////////////////////////////////////////////////////////////////
// column response.

var chem_row_n = 0;
var chem_row_n2 = 0;
var endpoint_row_n;
var source_div ="";
var background_A = "-webkit-gradient(linear, left top, left bottom, from(Purple), to(RebeccaPurple))";
var background_B = "-webkit-gradient(linear, left top, left bottom, from(DarkCyan), to(DarkBlue))";
var background = background_A;
var chemical_selected = false;
var endpoint_selected = false;

$(document).ready(function(){
	
	
	$("#table_1 tr").not(':first-child').click(
		function () {
			// alert("" + column3_data[2]);
			chemical_selected = true;
			if (!endpoint_selected){
		    	// $("#table_1 tr").removeClass("Highlighted_rows");
				$(this).addClass("Highlighted_rows");
				chem_row_n = $(this).index()-2;	//$(this).find(".row_number").text();
				// alert(chem_row_n);
				jQuery('#inside-C').html('');
				// var row_n = Number(chem_row_n);
				jQuery('#inside-C').html(column3_data[chem_row_n]);
				}
			else{
				// alert("chem_row_n: " + chem_row_n + ", endpoint_row_n: " + endpoint_row_n);
				$("#chem_properties").removeClass("Highlighted_rows");
				$("#table_1 tr").removeClass("Highlighted_rows");
				$(this).addClass("Highlighted_rows");
				chem_row_n = $(this).index()-2;	//$(this).find(".row_number").text();
				// alert("in click, chem_row_n: " + chem_row_n);
				column_3_curve(chem_row_n, endpoint_row_n)
				}
			});
	


	$("#table_1 tr").not(':first-child').hover(
	  function () {								// mouse on function
		if (chemical_selected == false){
	    	// $(this).css("background","yellow");
	    	$(this).addClass("Highlighted_rows");
	    
	    	$("#chem_properties").addClass("Highlighted_rows");
	    	chem_row_n = Number($(this).find(".row_number").text());
			// alert(chem_row_n);
			source_div = "c" + String(chem_row_n);
			jQuery('#inside-C').html('');
			jQuery('#inside-C').html(column3_data[chem_row_n]);
			// alert("remainder: " + chem_row_n%3);
		
			if (chem_row_n%3 == 0) {
				background = "-webkit-gradient(linear, left top, left bottom, from(DarkSlateBlue), to(DarkBlue))";} 
			if (chem_row_n%3 == 1) {
				background = "-webkit-gradient(linear, right top, left bottom, from(DarkSlateGray), to(MidnightBlue))";} 
			if (chem_row_n%3 == 2) {
				background = "-webkit-gradient(linear, left top, right bottom, from(Black), to(DarkGrey))";} 
		
			$('#Column-C').css({
		    	background: background });
			// alert("end of over " + column3_data[2]);
		}		// end of if chemical selected == false
	  },		// end of mouse over chemicals
	  	function () {						// mouse out function
		// alert("start leaving " + column3_data[2]);
		  if (chemical_selected == false){
			  	// $(this).css("background","");
	    		$(this).removeClass("Highlighted_rows");
	    		$("#chem_properties").removeClass("Highlighted_rows");
				}
				// alert("end of leaving " + column3_data[2]);
	  		}
		);		// end of $table_1 tr mouse out function
	
	$("#table_2 tr").not(':first-child').hover(
		function () {
			if(endpoint_selected == false){
				// $(this).css("background","yellow");
				$(this).addClass("Highlighted_rows");
		    	
		    	endpoint_row_n = $(this).index();
				// alert(endpoint_row_n);
				
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html(endpoint_data[endpoint_row_n]);
				// alert("remainder: " + chem_row_n%3);
  
				if (background == background_A) {
					background = background_B;
					} else {
						background = background_A;}
				
				$('#Column-C').css({background: background });
				}		// end of endpoint selected == false
			},			// end of mouse over table 2 function part 1.
			function () {
				if(endpoint_selected == false){
			    // $(this).css("background","");
			    $(this).removeClass("Highlighted_rows");
			    $("#chem_properties").removeClass("Highlighted_rows");
			  	}}
			);		// end of mouse over table 2 leaving function

	$("#table_2 tr").not(':first-child').click(
		function () {
			endpoint_selected = true;
			if (!chemical_selected){
				// $("#table_2 tr").removeClass("Highlighted_rows");
				$(this).addClass("Highlighted_rows");
	    		endpoint_row_n = $(this).index();
				// alert(endpoint_row_n);
			
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html(endpoint_data[endpoint_row_n]);
				// alert("remainder: " + chem_row_n%3);
				if (background == background_A) {
					background = background_B;
					} else {
						background = background_A;}
			
				$('#Column-C').css({background: background });
				}		//end of if (!chemical_selected){}
			else{
				// alert("chem_row_n: " + chem_row_n + ", endpoint_row_n: " + endpoint_row_n);
				$("#chem_properties").removeClass("Highlighted_rows");
				$("#table_2 tr").removeClass("Highlighted_rows");
				$(this).addClass("Highlighted_rows");
				endpoint_row_n = $(this).index();
				column_3_curve(chem_row_n, endpoint_row_n)
				}		// end of else
			});		// end of $("#table_2 tr").not(':first-child').click()
			
	$("#chem_properties").hover(
		function () {
			if (!chemical_selected || !endpoint_selected){
				//alert("yes");
				$('#Column-C').css({
    				background: "-webkit-gradient(linear, left top, left bottom, from(DarkGrey), to(Black))" 
					});
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html(column3_data[chem_row_n]);
				}},		// end of the hover function
		function () {
			    //$(this).removeClass("button blue");
			  }
			);			// end of the $("#chem_properties").hover()
});		//end of $(document).ready(function(){}


function ToxPi(){
	
	var selected_endpoints = [];
	var data_string = '';
	$('.phenotypes:checkbox:checked').each(function (){
		selected_endpoints[$(this).prop('name')] = $(this).prop('value');
		data_string += $(this).prop('name') + "=" + $(this).prop('value') + "&";
	});
	$('.chemicals:checkbox:checked').each(function (){
		selected_endpoints[$(this).prop('name')] = $(this).prop('value');
		data_string += $(this).prop('name') + "=" + $(this).prop('value') + "&";
	});
	
	alert(data_string);
}

function column_3_curve(chem_row_n, endpoint_row_n){
	// alert(chem_row_n + "===================================" + column3_data[chem_row_n-1]);
    $.post("Column_3",{				// "Column_3" is the url
   		chemical: chem_row_n + 1,
    	endpoint: endpoint_row_n,
    	chemical_properties: column3_data[chem_row_n],
    	endpoint_data: endpoint_data[endpoint_row_n]
    	},
    	function(data, status){
    		jQuery('#inside-C').html('');
			jQuery('#inside-C').html(data);
    		});			// end of seccessful function and $.post()
	}		// end of function column_3_curve()





	
var endpoint_data = [];
endpoint_data[1] = "<br><br><br><papaya>" + 
	' <p  style="text-align: center;">iCadiomyocyte peak frequency 90 minutes. </p><br>' + 
	'<p style ="text-indent: 50px; text-align: justify;">iCell cardiomyocytes (Catalogue #: CMC-100-010-001) including their respective plating ' +
	"and maintenance media were obtained from Cellular Dynamics International (Madison, WI). " +
	"EarlyTox Cardiotoxicity kits were purchased from Molecular Devices LLC (Sunnyvale, CA). </p>"+
	"<br><br><br><br><br>";
endpoint_data[2] = "<br><br><br><papaya>" + 
	' <p  style="text-align: center;">iCadiomyocyte peak frequency 24 hours. </p><br>' + 
	'<p style ="text-indent: 50px; text-align: justify;">iCell cardiomyocytes (Catalogue #: CMC-100-010-001) including their respective plating ' +
	"and maintenance media were obtained from Cellular Dynamics International (Madison, WI). " +
	"EarlyTox Cardiotoxicity kits were purchased from Molecular Devices LLC (Sunnyvale, CA). </p>"+
	"<br><br><br><br><br>";
endpoint_data[3] = "<br><br><br><papaya>" + 
	' <p  style="text-align: center;">iCardiomyocyte total cell number </p><br>' + 
	'<p style ="text-indent: 50px; text-align: justify;">' + 
	"Human umbilical vein endothelical cells (HUVEC) are derived from the endothelium of veins from the " +
	"umbillical cord. HUVEC used in this assay is pooled Human Umbilical Vein endothelial cells, purchased from Lonza" + 
	"Cat# C2519A, Lot# 0000433795. Total viable HUVEC cells were numerated 24 hours after chemical treatment with different " +
	"concentrations." +
	"<br><br><br><br><br>"; 
	
endpoint_data[4] = "<br><br><br><papaya>" + 
	' <p  style="text-align: center;">HUVEC total cells </p><br>' + 
	'<p style ="text-indent: 50px; text-align: justify;">' +
	"Human umbilical vein endothelical cells (HUVEC) are derived from the endothelium of veins from the " +
	"umbillical cord. HUVEC used in this assay is pooled Human Umbilical Vein endothelial cells, purchased from Lonza" + 
	"Cat# C2519A, Lot# 0000433795. " +
	"In this assay, 18 hours after chemical treatment, " + 
	"cell culture images were captured, and the total viable cell numbers were calculated" +
	"by a trained computer software."+
	"<br><br><br><br><br>";

endpoint_data[5] = "<br><br><br><papaya>" + 
	' <p  style="text-align: center;">HUVEC tube area </p><br>' + 
	'<p style ="text-indent: 50px; text-align: justify;">' +
	"Human umbilical vein endothelical cells (HUVEC) are derived from the endothelium of veins from the " +
	"umbillical cord. HUVEC used in this assay is pooled Human Umbilical Vein endothelial cells, purchased from Lonza" + 
	"Cat# C2519A, Lot# 0000433795. " +
	"In this assay, 24 hours after chemical treatment, " + 
	"cell culture images were captured, and the tube area were calculated" +
	"by a trained computer software."+
	"<br><br><br><br><br>";

endpoint_data[6] = "<br><br><br><papaya>" + 
	' <p  style="text-align: center;">HUVEC 24hr mitochondira </p><br>' + 
	'<p style ="text-indent: 50px; text-align: justify;">' +
	"Human umbilical vein endothelical cells (HUVEC) are derived from the endothelium of veins from the " +
	"umbillical cord. HUVEC used in this assay is pooled Human Umbilical Vein endothelial cells, purchased from Lonza" + 
	"Cat# C2519A, Lot# 0000433795. " +
	"In this assay, 18 hours after chemical treatment, " + 
	"cell culture images were captured, and the mitochondria were stained. Total cell area is calculated by" +
	"by a trained computer software."+
	"<br><br><br><br><br>";

endpoint_data[7] = "<br><br><br><papaya>" + 
	' <p  style="text-align: center;">Fly & Fly, iCadiomyocyte peak frequency 90 minutes. </p><br>' + 
	'<p style ="text-indent: 50px; text-align: justify;">Fly & Fly. The Dose-Response data are read from database. '+ 
	'Also, the Dose-Response data are loaded from the upload web page to the database.<br>' +
	'<p style ="text-indent: 50px; text-align: justify;">iCell cardiomyocytes (Catalogue #: CMC-100-010-001) including their respective plating ' +
	"and maintenance media were obtained from Cellular Dynamics International (Madison, WI). " +
	"EarlyTox Cardiotoxicity kits were purchased from Molecular Devices LLC (Sunnyvale, CA). </p>"+
	"<br><br><br><br><br>";


	


