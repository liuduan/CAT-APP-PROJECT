<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page session="false"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>


<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css" rel="stylesheet" />


<style>
/* unvisited link */
a:link {
    color: black;
    text-decoration: none;
}
/* visited link */
a:visited {
    color: black;
    text-decoration: none;
}
/* mouse over link */
a:hover {
    color: black;
    text-decoration: none;
}
/* selected link */
a:active {
    color: black;
    text-decoration: none;
}
/* Highlighted_rows*/
.Highlighted_rows{
	background-color: lightblue;
	border-width: 8px;
	border-color: CornflowerBlue;
	border-style: solid;
	border-radius: 10px;
	height: 50px;
	text-align: center;
	text-shadow:2px 2px 5px SkyBlue;
	font-size: 14;
	font-weight: bold;
}
.c-invis {
    display: none;
}
.row_number {
    display: none;
}
/*font colours*/
Papaya{	color: PapayaWhip; }
Gray{	color: #9c9d9d; }
	
data{color: LightGreen;  }
data2{color: DarkGreen; font-size: 20px;  }
</style>
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body background="${pageContext.request.contextPath}/resources/images/Catapp_logo_full-blur.svg"
	style="background-size:250%">
	

CAT-APP Data
 <a href="#" style="text-align: right;"><button type="button">User Home</button>  
          <span class="glyphicon glyphicon-home"></span>
        </a>
<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left" style="display:none" id="leftMenu">
  <button onclick="closeLeftMenu()" class="w3-bar-item w3-button w3-large">Close &times;</button>
  <a href="#" class="w3-bar-item w3-button">Link 1</a>
  <a href="#" class="w3-bar-item w3-button">Link 2</a>
  <a href="#" class="w3-bar-item w3-button">Link 3</a>
</div>

<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-right" style="display:none;right:0;" id="rightMenu">
  <button onclick="closeRightMenu()" class="w3-bar-item w3-button w3-large">Close &times;</button>
  <a href="#" class="w3-bar-item w3-button">Link 1</a>
  <a href="#" class="w3-bar-item w3-button">Link 2</a>
  <a href="#" class="w3-bar-item w3-button">Link 3</a>
</div>

<div class="w3-teal">
  <button class="w3-button w3-teal w3-xlarge w3-left" onclick="openLeftMenu()">&#9776;</button>
  <button class="w3-button w3-teal w3-xlarge w3-right" onclick="openRightMenu()">&#9776;</button>
  <div class="w3-container">
    <h1>My Page</h1>
  </div>
</div>

<div class="w3-container">
<p>In this example, we demonstrate how to use two side navigations.</p>
<p>We have created two "menu" buttons: one to open the side navigation from the left and one to open it from the right.</p>
</div>





	
	
	
	
	
	
	
	
	
<div class="main" >




	<!--  search_term = ${search_term}-->
	<spring:url value="/profile" var="urlProfile" />
	<spring:url value="/import" var="urlImport" />
	<spring:url value="/export" var="urlExport" />
	<spring:url value="/analysis/${projectId}" var="urlDisplayAnalysis" />
                
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/response"
     user="root"  password="vibscatapp"/>
     <br></br>
<h3 align="center" style="color: DarkSlateBlue; font-weight: bold;">Data Analysis Dashboard</h3>
<div class="container">
	<div class="row">
		<div class="col-lg-3" id="Column-A" style="background-color:lavender;height:600px;">
		


 <div data-Chemicals-Search>
<% String search_term = "87"; %>

 <sql:query dataSource="${snapshot}" var="Chemicals_result">
SELECT * from chemicals;
</sql:query>

<c:set var="Chemicals_first_row_id" value="${Chemicals_result.rows[0].entity_id}"/>
<c:if test="${Chemicals_first_row_id != null}">

<br />
<table id = "table_1" style="display: block;  height: 550px;  overflow-y: scroll;">
  <tr>
  	<th style="width:90px;">CAS</th>
    <th>Substance Name</th>
  </tr>
  
 <%! int i = 0; %> 
 <script> var column3_data = ["a", "b", "c"];</script>
  <c:forEach var="Chemicals" items="${Chemicals_result.rows}">
  	<!-- var="user"	// can be any variable name. -->
  	<!-- "result" is the object name from search results. -->
  	
 	<tr>
 		<td class="row_number"><%=i %></td>
 		<td>${Chemicals.CAS}</td>
 		<td>${fn:substring(Chemicals.substance_name, 0, 20)}</td>
 	
 	<div class="c-invis">
 		<script>
 			column3_data[<%=i %>] = "<br><h4><Papaya>CATAPP sample ID: </Papaya><data>${Chemicals.catapp_id}" + 
 				"</data><br></h4>" + 
 				"<h4><Papaya>Concawe ID: </Papaya><data>${Chemicals.concawe_id} </data><br></h4>" +
 				"<h4><Papaya>Category: </Papaya><data>${Chemicals.category} </data><br></h4>" +
 				"<h4><Papaya>CAS Number: </Papaya><data>${Chemicals.CAS}</data><br></h4>" + 
 				" <h4><Papaya>Ec Number: </Papaya><data>${Chemicals.ec}</data><br></h4>" + 
 				" <h4><Papaya>Substance Name: </Papaya><data>${Chemicals.substance_name}</data><br></h4>" + 
 				" <h4><Papaya>Chemical Name: </Papaya><data>${Chemicals.chem_name}</data><br></h4>" + 
 				" <h4><Papaya>Source: </Papaya><data>${Chemicals.chem_source}</data><br></h4>" + 
 				" <h4><Papaya>Substance Description: <br></Papaya></h4> <data>" + 
 				" <h4 style = 'text-align: justfy'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${Chemicals.substance_description}</h4></data><br>";
 		</script>
 	</div>
  <% i=i+1; %>
  	
  </tr>
  </c:forEach>
   <% i = 0; %> 
</table> 
 		
 </c:if>
 
</div> <!-- End of Chemicals Search -->


		<!-- end of class="col-lg-3"  -->
		</div>
		<div class="col-lg-3" id="Column-B" style="background-color:lavenderblush; height:600px;">
			<br><br><span style = "font-size: 13px; font-weight: bold;">
			<table id = "table_2" >
			<tr><td><div id = "chem_properties">Chemical & physic properties.<br></div></td></tr>
			
			<tr><td><div id = "cardio90">iCardiomyocyte 90 min Peak Frequency <br></div></td></tr>
			<tr><td><div id = "cardio24">iCardiomyocyte 24 hr Peak Frequency<br></div></td></tr>
			<tr><td><div id = "HUVEC_TC">HUVEC total cells <br></div></td></tr>
			<tr><td><div id = "HUVEC_TA">HUVEC Tube Area<br></div></td></tr>
			</table>
			<span style = "color: #909191;">
			iMacrophages test<br>
			iHepatocytes test<br>

			iEndothelial Cell test<br>
			iNeuron test<br>
			iSkeletal Myoblast test<br>
			iLymphoblast test<br>
			===========<br>
			A-375 Skin Melanoma<br>
			A549 Lung Carcinoma<br>
			HepG2 Hepatocyte Carcinoma<br>
			HepaRG Hepatocyte Carcinoma<br>
			MCF7 Breast Adenocarcinoma<br>
			
			HT-29 Colon Adenocarcinoma<br>
			LN-229 Glioblastoma<br>
			HEK10205f Human Epidermal Keratinocytes; Foetal<br>
			HLMVEC Human Lung Microvascular Endothelial Cells<br>
			HMePC Human Mammary Epithelial Cell<br>
			SH-SY5Y Neuroblastoma<br>
			
			
			
			
			</span></span>
			<br><br><br><br><br><br><br><br>
		</div>
		<div class="col-lg-6" id="Column-C" style="background-color:lavender; height:600px; border-radius: 25px;">
			<div id="inside-C"> <br><br><br><br>
				<data2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Chemical details<br>				
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assay methods<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Dose response curves<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Project files<br><br>
				
				&nbsp; &nbsp; &nbsp;  More to come: <br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Departure point data<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assay images<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Benchmark Dose Software processing<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Toxpie comparison for chemicals and assays<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Comparison to commonly known chemicals<br>
				
				
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		</div>

	<!-- end of class="row" -->
	</div>
<!-- end of class="container" -->


<br></br>

<button type="button" id="reset-2" class="btn btn-primary">Reset</button>
...



<script>
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
		    	$("#table_1 tr").removeClass("Highlighted_rows");
				$(this).addClass("Highlighted_rows");
				chem_row_n = $(this).index()-2;	//$(this).find(".row_number").text();
				// alert((typeof chem_row_n2) + "-----" + chem_row_n2 + column3_data[2]);
				jQuery('#inside-C').html('');
				// var row_n = Number(chem_row_n);
				jQuery('#inside-C').html(column3_data[chem_row_n]);
				}
			else{
				// alert("chem_row_n: " + chem_row_n + ", endpoint_row_n: " + endpoint_row_n);
				$("#chem_properties").removeClass("Highlighted_rows");
				$("#table_1 tr").removeClass("Highlighted_rows");
				$(this).addClass("Highlighted_rows");
				chem_row_n = $(this).index()-1;	//$(this).find(".row_number").text();
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
	  function () {
		// alert("start leaving " + column3_data[2]);
		if (chemical_selected == false){
	    	// $(this).css("background","");
	    	$(this).removeClass("Highlighted_rows");
	    	$("#chem_properties").removeClass("Highlighted_rows");
			}
		// alert("end of leaving " + column3_data[2]);
	  	}
	);		// end of $table_1 tr
	
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
				$("#table_2 tr").removeClass("Highlighted_rows");
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


	$("#reset-2").click(
		function () {
			//alert("a");
			endpoint_selected = false;
			chemical_selected = false;
			$("#table_2 tr").removeClass("Highlighted_rows");
			$("#table_1 tr").removeClass("Highlighted_rows");
			// window.location.reload(true);
			});		// end of $("#reset").click()



	
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
	' <p  style="text-align: center;">HUVEC total cell number </p><br>' + 
	'<p style ="text-indent: 50px; text-align: justify;">' + 
	"Total viable HUVEC cells were numerated 24 hours after chemical treatment with different concentrations." +
	""+
	"<br><br><br><br><br>"; 
	
endpoint_data[4] = "<br><br><br><papaya>" + 
	' <p  style="text-align: center;">HUVEC tube area </p><br>' + 
	'<p style ="text-indent: 50px; text-align: justify;">' +
	"Human umbilical vein cells were used in this assay, and 18 hours after chemical treatment, " + 
	"cell culture images were captured, and the tube area were calculated" +
	"by a trained computer software."+
	"<br><br><br><br><br>";

</script>



</body>

</html>