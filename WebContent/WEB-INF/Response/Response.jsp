<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page session="false"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<link rel="stylesheet" type="text/css" href=
	"/database_project/scripts/external/font-awesome/css/font-awesome.min.css" />
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>



<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link href="/CAT-APP-PROJECT/resources/css/font-awesome.css" rel="stylesheet" />
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
Papaya{	color: PapayaWhip; font-size: 20px; }
	
data{color: LightGreen; font-size: 20px;  }
data2{color: DarkGreen; font-size: 20px;  }

</style>
<title>Insert title here</title>
</head>
<body background="${pageContext.request.contextPath}/resources/images/Catapp_logo_full-blur.svg"
	style="background-size:250%">
<div class="main" >
<jsp:directive.include file="${pageContext.request.contextPath}/header.jsp" />
	<!--  search_term = ${search_term}-->
	<spring:url value="/profile" var="urlProfile" />
	<spring:url value="/import" var="urlImport" />
	<spring:url value="/export" var="urlExport" />
	<spring:url value="/analysis/${projectId}" var="urlDisplayAnalysis" />
                
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/response"
     user="root"  password="vibscatapp"/>
     
<h3 align="center" style="color: DarkSlateBlue; font-weight: bold;">CAT-APP Data Dashboard</h3>
<div class="container">
	<div class="row">
		<div class="col-lg-3" id="Clumn-A" style="background-color:lavender;height:500px;">
		


 <div data-Chemicals-Search>
<% String search_term = "87"; %>

 <sql:query dataSource="${snapshot88}" var="Chemicals_result">
SELECT * from response;
</sql:query>

<c:set var="Chemicals_first_row_id" value="${Chemicals_result.rows[0].entity_id}"/>
<c:if test="${Chemicals_first_row_id != null}">

<br />
<table id = "table_1" style="display: block;  height: 460px;  overflow-y: scroll;">
  <tr>
  	<th style="width:90px;">CAS</th>
    <th>Substance Name</th>
  </tr>
  
 <%! int i = 0; %> 
 <script> var column3_data = [];</script>
  <c:forEach var="Chemicals" items="${Chemicals_result.rows}">
  	<!-- var="user"	// can be any variable name. -->
  	<!-- "result" is the object name from search results. -->
  	
 	<tr>
 		<td class="row_number"><%=i %></td>
 		<td>${Chemicals.CAS}</td>
 		<td>${Chemicals.substance_name}</td>
 	
 	<div class="c-invis">
 		<script>
 			column3_data[<%=i %>] = "<h3><Papaya>Sample Number: </Papaya><data>${Chemicals.sample_number}" + 
 				"</data><br></h3><h3><Papaya>Category: </Papaya><data>${Chemicals.category} </data><br></h3>" +
 				"<h3><Papaya>CAS Number: </Papaya><data>${Chemicals.CAS}</data><br></h3>" + 
 				" <h3><Papaya>Ec Number: </Papaya><data>${Chemicals.ec_number}</data><br></h3>" + 
 				" <h3><Papaya>Substance Name: </Papaya><data>${Chemicals.substance_name}</data><br></h3>" + 
 				" <h3><Papaya>Substance Description: <br></Papaya><data>" + 
 				" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${Chemicals.substance_description}</data><br></h3>" + 
 				"<h3><Papaya>Availability: </Papaya><data>${Chemicals.availability}</data><br></h3>";
 		</script>
 	</div>
  <% i=i+1; %>
  	
  </tr>
  </c:forEach>
</table> 
 		
 </c:if>
 
</div> <!-- End of Chemicals Search -->


		<!-- end of class="col-lg-3"  -->
		</div>
		<div class="col-lg-3" id="Clumn-B" style="background-color:lavenderblush;">
			<br><br><br><br>
			<table id = "table_2" style = "font-size: 16px; font-weight: bold;">
			<tr><td><div id = "properties">Chemical & physic properties.<br></div></td></tr>
			<tr><td><div id = "macro">Macrophages test<br></div></td></tr>
			<tr><td><div id = "cardio">Cardiomyocyte test<br></div></td></tr>
			<tr><td><div id = "hepa">Hepatocytes test<br></div></td></tr>
			<tr><td><div id = "endo">Endothelial Cell test<br></div></td></tr>
			<tr><td><div id = "neuro">Neuron test<br></div></td></tr>
			<tr><td><div id = "skelet">Skeletal Myoblast test<br></div></td></tr>
			<tr><td><div id = "lymph">Lymphoblast test<br></div></td></tr>
			</table>
			<br><br><br><br><br><br><br><br>
		</div>
		<div class="col-lg-6" id="Clumn-C" style="background-color:lavender; height:500px; border-radius: 25px;">
			<div id="inside-C"> <br><br><br><br>
				<data2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Chemical details<br><br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Benchmark doses<br><br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Endpoints<br><br>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Project files<br><br><br></data>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		</div>

	<!-- end of class="row" -->
	</div>
<!-- end of class="container" -->

<br/>





<script>
var js_row_number = "";
var source_div ="";
var background_A = "-webkit-gradient(linear, left top, left bottom, from(Purple), to(RebeccaPurple))";
var background_B = "-webkit-gradient(linear, left top, left bottom, from(DarkCyan), to(DarkBlue))";
var background = background_A;
$(document).ready(function(){
	$("#table_1 tr").not(':first-child').hover(
	  function () {
	    // $(this).css("background","yellow");
	    $(this).addClass("Highlighted_rows");
	    
	    $("#properties").addClass("Highlighted_rows");
	    js_row_number = $(this).find(".row_number").text();
		// alert(js_row_number);
		source_div = "c" + js_row_number;

		jQuery('#inside-C').html('');
		jQuery('#inside-C').html(column3_data[js_row_number]);

		// alert("remainder: " + js_row_number%3);
		
		if (js_row_number%3 == 0) {
			background = "-webkit-gradient(linear, left top, left bottom, from(DarkSlateBlue), to(DarkBlue))";} 
		if (js_row_number%3 == 1) {
			background = "-webkit-gradient(linear, right top, left bottom, from(DarkSlateGray), to(MidnightBlue))";} 
		if (js_row_number%3 == 2) {
			background = "-webkit-gradient(linear, left top, right bottom, from(Black), to(DarkGrey))";} 

		
		$('#Clumn-C').css({
		    background: background 
		});

		
	  },
	  function () {
	    // $(this).css("background","");
	    $(this).removeClass("Highlighted_rows");
	    $("#properties").removeClass("Highlighted_rows");
	  }
	);		// end of $table_1 tr


	$("#table_2 tr").hover(
		function () {
			// $(this).css("background","yellow");
			$(this).addClass("Highlighted_rows");
			    
			if (background == background_A) {
				background = background_B;
				} else {
					background = background_A;
			}

				
			$('#Clumn-C').css({
				background: background 
				});

				
			  },
			  function () {
			    // $(this).css("background","");
			    $(this).removeClass("Highlighted_rows");
			    $("#properties").removeClass("Highlighted_rows");
			  }
			);		// end of $table_2 tr

	
	$("#properties").hover(
		function () {
			//alert("yes");
			$('#Clumn-C').css({
    			background: "-webkit-gradient(linear, left top, left bottom, from(DarkGrey), to(Black))" 
				});
			jQuery('#inside-C').html('');
			jQuery('#inside-C').html(column3_data[js_row_number]);
			},
		function () {
			    //$(this).removeClass("button blue");
			  }
			);

	$("#macro").hover(
			function () {
				//alert("yes");
				$('#Clumn-C').css({
	    			background: "-webkit-gradient(linear, left top, left bottom, from(SeaGreen), to(MidnightBlue))" 
					});
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html("<br><br><br><papaya>Macrophage benchmark dose is not available. <br>" + 
					"Macrophage endpoint experiment is not available.<br>" + 
					"Sample data files: <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 
"<a href ='/database_project/test_data/macro-1.pdf'>"+
"<papaya><u>Macrophage Sample file 1.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 

"<a href ='/database_project/test_data/macro-2.pdf'>"+
"<papaya><u>Macrophage Sample file 2.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +

'<a href="/database_project/test_data/macro-3.txt">' + 
'<papaya><u>Macrophage Sample file 3.txt</u></papaya></a>'+
	
					"<br><br><br><br><br>");
					
				},
			function () {
				    //$(this).removeClass("button blue");
				  }
				);



	$("#cardio").hover(
			function () {
				//alert("yes");
				$('#Clumn-C').css({
	    			background: "-webkit-gradient(linear, left top, left bottom, from(DarkSlateBlue), to(DarkBlue))" 
					});
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html("<br><br><br><papaya>Cardiomyocyte benchmark dose is not available. <br>" + 
					"Cardiomyocyte endpoint experiment is not available.<br>" + 
					"Sample data files: <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 
"<a href ='/database_project/test_data/cardio-1.pdf'>"+
"<papaya><u>Cardiomyocyte Sample file 1.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 

"<a href ='/database_project/test_data/cardio-2.pdf'>"+
"<papaya><u>Cardiomyocyte Sample file 2.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +

'<a href="/database_project/test_data/cardio-3.txt">' + 
'<papaya><u>Cardiomyocyte Sample file 3.txt</u></papaya></a>'+
	
					"<br><br><br><br><br>");
					
				},
			function () {
				    //$(this).removeClass("button blue");
				  }
				);


	$("#hepa").hover(
			function () {
				//alert("yes");
				$('#Clumn-C').css({
	    			background: "-webkit-gradient(linear, left top, left bottom, from(Purple), to(RebeccaPurple))" 
					});
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html("<br><br><br><papaya>Hepatocyte benchmark dose is not available. <br>" + 
					"Hepatocyte endpoint experiment is not available.<br>" + 
					"Sample data files: <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 
"<a href ='/database_project/test_data/hepa-1.pdf'>"+
"<papaya><u>Hepatocyte Sample file 1.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 

"<a href ='/database_project/test_data/hepa-2.pdf'>"+
"<papaya><u>Hepatocyte Sample file 2.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +

'<a href="/database_project/test_data/hepa-3.txt">' + 
'<papaya><u>Hepatocyte Sample file 3.txt</u></papaya></a>'+
	
					"<br><br><br><br><br>");
					
				},
			function () {
				    //$(this).removeClass("button blue");
				  }
				);


	$("#endo").hover(
			function () {
				//alert("yes");
				$('#Clumn-C').css({
	    			background: "-webkit-gradient(linear, left top, left bottom, from(Purple), to(RebeccaPurple))" 
					});
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html("<br><br><br><papaya>Endothelial cell benchmark dose is not available. <br>" + 
					"Endothelial cell endpoint experiment is not available.<br>" + 
					"Sample data files: <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 
"<a href ='/database_project/test_data/endo-1.pdf'>"+
"<papaya><u>Endothelial cell Sample file 1.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 

"<a href ='/database_project/test_data/endo-2.pdf'>"+
"<papaya><u>Endothelial cell Sample file 2.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +

'<a href="/database_project/test_data/endo-3.txt">' + 
'<papaya><u>Endothelial cell Sample file 3.txt</u></papaya></a>'+
	
					"<br><br><br><br><br>");
					
				},
			function () {
				    //$(this).removeClass("button blue");
				  }
				);



	$("#neuro").hover(
			function () {
				//alert("yes");
				$('#Clumn-C').css({
	    			background: "-webkit-gradient(linear, left top, left bottom, from(Purple), to(RebeccaPurple))" 
					});
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html("<br><br><br><papaya>Neuron benchmark dose is not available. <br>" + 
					"Neuron endpoint experiment is not available.<br>" + 
					"Sample data files: <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 
"<a href ='/database_project/test_data/neuro-1.pdf'>"+
"<papaya><u>Neuron Sample file 1.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 

"<a href ='/database_project/test_data/neuro-2.pdf'>"+
"<papaya><u>Neuron Sample file 2.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +

'<a href="/database_project/test_data/neuro-3.txt">' + 
'<papaya><u>Neuron Sample file 3.txt</u></papaya></a>'+
	
					"<br><br><br><br><br>");
					
				},
			function () {
				    //$(this).removeClass("button blue");
				  }
				);


	$("#skele").hover(
			function () {
				//alert("yes");
				$('#Clumn-C').css({
	    			background: "-webkit-gradient(linear, left top, left bottom, from(Purple), to(RebeccaPurple))" 
					});
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html("<br><br><br><papaya>Skeletal Myoblast benchmark dose is not available. <br>" + 
					"Skeletal Myoblast endpoint experiment is not available.<br>" + 
					"Sample data files: <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 
"<a href ='/database_project/test_data/skele-1.pdf'>"+
"<papaya><u>Skeletal Myoblast Sample file 1.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 

"<a href ='/database_project/test_data/skele-2.pdf'>"+
"<papaya><u>Skeletal Myoblast Sample file 2.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +

'<a href="/database_project/test_data/skele-3.txt">' + 
'<papaya><u>Skeletal Myoblast Sample file 3.txt</u></papaya></a>'+
	
					"<br><br><br><br><br>");
					
				},
			function () {
				    //$(this).removeClass("button blue");
				  }
				);


	$("#lymph").hover(
			function () {
				//alert("yes");
				$('#Clumn-C').css({
	    			background: "-webkit-gradient(linear, right top, left bottom, from(SaddleBrown), to(Maroon))" 
					});
				jQuery('#inside-C').html('');
				jQuery('#inside-C').html("<br><br><br><papaya>Lymphoblast benchmark dose is not available. <br>" + 
					"Lymphoblast endpoint experiment is not available.<br>" + 
					"Sample data files: <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 
"<a href ='/database_project/test_data/lymph-1.pdf'>"+
"<papaya><u>Lymphoblast Sample file 1.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + 

"<a href ='/database_project/test_data/lymph-2.pdf'>"+
"<papaya><u>Lymphoblast Sample file 2.pdf</u></papaya></a><br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +

'<a href="/database_project/test_data/lymph-3.txt">' + 
'<papaya><u>Lymphoblast Sample file 3.txt</u></papaya></a>'+
	
					"<br><br><br><br><br>");
					
				},
			function () {
				    //$(this).removeClass("button blue");
				  }
				);





	


	

});		//end of $(document).ready(function(){}
</script>

</div><!-- end of class main -->
</body>

</html>