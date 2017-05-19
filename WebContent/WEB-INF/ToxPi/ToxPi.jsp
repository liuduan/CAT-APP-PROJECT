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

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src = "https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>






<script type="text/javascript" src="http://www.kunalbabre.com/projects/table2CSV.js" > </script> 





<script src="${pageContext.request.contextPath}/resources/js/Response/Response.js"></script>

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
	background-color: #add2ed; /* EPA lightblue */
	border-width: 8px;
	border-color: #157fcc;	/* EPA deep blue */
	border-style: solid;
	border-radius: 4px;
	height: 50px;
	text-align: center;
	text-shadow:2px 2px 5px SkyBlue;
	font-size: 14;
	font-weight: bold;
	padding: 0px;
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
<title>Response Curves</title>

</head>
<body style="background-color: #157fcc">

<span class="pull-right">&nbsp; &nbsp; </span>
<a href="${pageContext.request.contextPath}/BackToHomeServlet" class="btn btn-info btn-sm pull-right"
	style="background-color:#3892d3; color: white; font-weight: bold; position: relative; z-index: 2;">
<span class="glyphicon glyphicon-home"></span> User Home</a> 

<div style="background-color: #157fcc; width: 100%; height: 85px; position: absolute; top: 0px; z-index: 1; ">
</div>
<h3 align="center" style="color: white; font-weight: bold; position: relative; z-index: 1; 
	background-color: #157fcc;">	CAT-APP ToxPi </h3>



																							<!-- Left Menu -->
<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left" id="leftMenu" 				
	style="width:22%; height:90%; border-radius: 10px;">							
  	

  
  	
  	<div id="Column-A" style=" min-height:600px; padding: 9px;">
		

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/response"
     user="root"  password="vibscatapp"/>



 <div id="data-Chemicals-Search">
<% String search_term = "87"; %>

 <sql:query dataSource="${snapshot}" var="Chemicals_result">
SELECT * from chemicals;
</sql:query>

<c:set var="Chemicals_first_row_id" value="${Chemicals_result.rows[0].entity_id}"/>
<c:if test="${Chemicals_first_row_id != null}">

<input type="text" id="cas_Input" onkeyup="Search_cas()" placeholder="Search cas.." 
	title="Type in a name" style="width: 80px;">
	
<input type="text" id="name_Input" onkeyup="Search_name()" placeholder="Search for names.." 
	title="Type in a name" style="width: 150px;">

<table id = "table_1" style="display: block;  height: 90%;  ">
  <tr>
  	<th style="width:90px;">CAS</th>
    <th>Substance Name</th>
  </tr>
  
 <% int i = 0; %> 
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
		</div><!-- end of class="col-lg-3" id="Column-A" -->
</div>

<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-right" style="right:0; width:20%; 
	height:90%; border-radius: 10px; position:absolute; z-index: 2;" id="rightMenu">
																							<!-- right menu -->

  		
	<div id="Column-B" style="padding-left: 9px">
			<br><span style = "font-size: 13px; font-weight: bold;">
			<table id = "table_2" >
			<tr><td><div id = "chem_properties">Chemical & physic properties<br></div></td></tr>
			
			<tr><td><div id = "cardio90">iCardio. 90 min Peak Frequency <br></div></td></tr>
			<tr><td><div id = "cardio24">iCardio. 24 hr Peak Frequency<br></div></td></tr>
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
			
		</div><!-- end of class="col-lg-6" id="Column-B" -->
</div>

				
<div id="central_area" style="height: 90vh; width:58%; margin-left:22%; margin-right:20%; z-index: 1; 	
	background-color: #157fcc;">				<!-- background-color: #157fcc;  -->								
																							<!-- Central Area -->
	
  	<button class="btn btn-info btn-sm" onclick="openLeftMenu()" id="button-open-left"
  		style="background-color: #3892d3; display: none; position: relative; z-index: 1;">
  		<span class="glyphicon glyphicon-chevron-right"></span> Open left menu</button>
  	<button class="btn btn-info btn-sm" id="button-close-left"
  		onclick="closeLeftMenu()" style="background-color: #3892d3; position: relative; z-index: 1;">
  		<span class="glyphicon glyphicon-chevron-left"></span> Close</button>
  		
  	<button class="btn btn-info btn-sm pull-right" id="button-open-right"  	
  		onclick="openRightMenu()" style="background-color: #3892d3; display: none; position: relative; z-index: 1;">
  		<span class="glyphicon glyphicon-chevron-left"></span> Open right menu</button>
  		
  	<button class="btn btn-info btn-sm pull-right" onclick="closeRightMenu()" id="button-close-right"
  		style="background-color: #3892d3; position: relative; z-index: 1;">
  		<span class="glyphicon glyphicon-chevron-right"></span> Close</button>
  		
  	<div id="Column-C" style="background-color: white; height: 96%; border-radius: 25px; padding: 9px; 
  		z-index: 1; border:5px solid #157fcc;">
  	
  	
  	<!--  
<div style="background-color: #157fcc; width: 100%; height: 50px; position: absolute; top: 94px; 
	padding: -9px; margin: -9px; border-radius: 15px; z-index: 1; " id="blocking-piece">
</div>-->

		<div id="inside-C" style=""> 
				<br></br><br>
				<data2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Chemical details<br>				
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assay methods<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Dose response curves<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Point of departure<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Project files<br><br>
				
				&nbsp; &nbsp; &nbsp;  More to come: <br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Assay images<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Benchmark Dose Software processing<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Toxpie comparison for chemicals and assays<br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Comparison to commonly known chemicals<br>
				
				</data2>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div><!--  end of id="inside-C" -->
		</div>	<!--  end of id="Column-C" -->	
  </div>

<br></br>
<div class="w3-container">


</div>





	
	
	
	
	
	
	
	





                










 


</body>

</html>