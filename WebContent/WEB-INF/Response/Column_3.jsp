<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    <%@page import="java.io.File"%>
    <%@page import="java.io.IOException"%>
    <%@page import="java.awt.image.BufferedImage"%>
    <%@page import="javax.imageio.ImageIO"%>
    <%@page import="java.io.ByteArrayOutputStream"%>

    <%@page import="java.math.BigInteger"%>
    <%@page import="javax.xml.bind.DatatypeConverter"%>
    <%@page import="java.awt.image.BufferedImage"%>

<head>
<style>
.nav.nav-tabs  {
    border-bottom: 6px solid #add2ed; 
    zIndex: 1;
}

.nav.nav-tabs>li>a {
	height: 30px;
	margin-top: 0px;
	padding-top: 6px;
	color: white;
	font-weight: bold;
	background-color: #3892d3;
}

.nav.nav-tabs>li.active>a, .nav.nav-tabs>li.active>a:hover, 
	nav.nav-tabs>li.active>a:focus, .nav.nav-tabs>li>a:hover {
    color: #157fcc;
    background-color: #add2ed;
}
</style>

</head>




<ul class="nav nav-tabs" >
  <li class="active"><a data-toggle="tab" href="#home">Response curve</a></li>
  <li><a data-toggle="tab" href="#menu1" id="menue_property">Chemical properties</a></li>
  <li><a data-toggle="tab" href="#menu2">Assay</a></li>
  <li><a data-toggle="tab" href="#menu3">Assay data</a></li>
  <li><a data-toggle="tab" href="#menu4">Credit</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
   
<Papaya>
<p style="text-align: right; font-size: 11px;">(chemical #: ${chemical}, endpoint #: ${endpoint})</p>


<c:choose>
    <c:when test="${endpoint == '1'}">
       <c:set var="endpoint_string" scope="page" value="Peak_freq_90min" />
       <c:set var="endpoint_string2" scope="page" value="Cardio_peak_freq_90min" />
       <c:set var="endpoint_name" scope="page" value="iCardiomyocyte Peak frequency 90 minutes" />
    </c:when>
    <c:when test="${endpoint == '2'}">
       <c:set var="endpoint_string" scope="page" value="Peak_freq_24hr" />
       <c:set var="endpoint_string2" scope="page" value="Cardio_peak_freq_24hr" />
       <c:set var="endpoint_name" scope="page" value="iCardiomyocyte Peak frequency 24 hours" />
    </c:when>
    <c:when test="${endpoint == '3'}">
       <c:set var="endpoint_string" scope="page" value="HUVEC_total_cell" />
       <c:set var="endpoint_string2" scope="page" value="HUVEC_total_cell" />
       <c:set var="endpoint_name" scope="page" value="HUVEC viable cell 24 hours" />
    </c:when>
    <c:when test="${endpoint == '4'}">
       <c:set var="endpoint_string" scope="page" value="HUVEC_tube_area" />
       <c:set var="endpoint_string2" scope="page" value="HUVEC_tube_area" />
       <c:set var="endpoint_name" scope="page" value="HUVEC tube area 18 hours" />
    </c:when>
</c:choose>



<%
String endpoint_string = (String)pageContext.getAttribute("endpoint_string");
String chemical_string = (String)request.getAttribute("chemical");

String image_path = "C:\\4_R\\Demonstration\\" + endpoint_string;
image_path = image_path + "\\Figs\\" + endpoint_string + chemical_string + ".png";
System.out.println("String: " + image_path);
%>



<p style="text-align: center">${endpoint_name}</p>

<%
    //write image
    try{
      // String imgName="C:\\4_R\\Demonstration\\Peak_Freq_24hr\\Figs\\Peak_freq_24hr1.png";
      String imgName = image_path;
      BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        // ImageIO.write( bImage, "jpg", baos );
        ImageIO.write( bImage, "png", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
        <div id = "draggable" style="margin: auto; text-align: center; z-index: 0;">
         <img  id="response-curve" src="data:image/jpg;base64, <%=b64%>" />
      </div>
      
      
      
      
      
           
        <% 
    }catch(IOException e){
      	System.out.println("Error: "+e);
    	} 
%>



<a href="#" ><span class="glyphicon glyphicon-plus" onclick="magnify()"
	style="padding-left: 7px; position: absolute; top: 160px; left:23%;"></span></a>
<a href="#" ><span class="glyphicon glyphicon-minus" onclick="shrink()"
	style="padding-left: 5px; position: absolute; top: 190px; left: 23%;"></span></a>
<a href="#" ><span class="glyphicon glyphicon-download-alt" 
	style="padding-left: 5px; position: absolute; top: 220px; left: 23%;"></span></a>


<script>
var fig_width = 500;
function magnify() {
	// alert("hello");
	fig_width = fig_width * 1.2;
	$( "#response-curve" ).width(fig_width);
	// class="img-responsive" 
	}

function shrink() {
	// alert("hello");
	fig_width = fig_width * 0.8;
	$( "#response-curve" ).width(fig_width);
	// class="img-responsive" 
	}

$(function() {
    $( "#draggable" ).draggable(
    	    { zIndex: 0});
    
 });



</script>




</div> <!-- end of id="home" -->
  
  <div id="menu1" class="tab-pane fade">
    ${chemical_properties}
    
  </div>
  

  <div id="menu2" class="tab-pane fade">
  
    <papaya>${endpoint_data}
    </papaya>
  </div>
  <div id="menu3" class="tab-pane fade">
	<papaya>
	
	
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/response"
     user="root"  password="vibscatapp"/>
	
<sql:query dataSource="${snapshot}" var="Assay_data_result">
SELECT * from assay_data where (phenotype = "${endpoint_string2}" AND catapp_id = "${chemical}");
</sql:query>
	<br><br>
	
	
	Catapp Sample ID: ${Assay_data_result.rows[0].catapp_id}<br>
	Chemical name: ${Assay_data_result.rows[0].chem_name}<br>
	Assay: ${Assay_data_result.rows[0].phenotype}<br>
	<table border=0>
	<tr><td>Dose 1000x: </td><td> ${fn:substring(Assay_data_result.rows[0].Dose_1000x, 0, 6)}</td><tr>
	<tr><td>Dose 100x: </td><td> ${fn:substring(Assay_data_result.rows[0].Dose_100x, 0, 6)}</td><tr>
	<tr><td>Dose 10x: </td><td> ${fn:substring(Assay_data_result.rows[0].Dose_10x, 0, 6)}</td><tr>
	<tr><td>Dose 1x: </td><td> ${fn:substring(Assay_data_result.rows[0].Dose_1x, 0, 6)}</td><tr>
	</table>
	
	
<sql:query dataSource="${snapshot}" var="Control_data_result">
SELECT * from assay_controls where phenotype = "${endpoint_string2}";
</sql:query>
	<br>
	
	Control values:<br>
<c:forEach var="row" items="${Control_data_result.rows}">  		
   ${fn:substring(row.control_value, 0, 6)},
</c:forEach>    
   
    </papaya>
  </div>
  <div id="menu4" class="tab-pane fade">
    <papaya><h3></h3><br><br>
    <p style="text-indent: 50px;">The assays were conducted in Dr. Ivan Rusyn lab at Texas A&M University. </p>
    <p>The R program for dose-response curves was written by Dr. Fred Wright at the North Carolina State 
    University, and minor modifications were made in Dr. Ivan Rusyn lab. </p></papaya>
  </div>
</div>


</Papaya>
<script>



$("menue_property").click(
	function () {
		// alert("It is: "+ ${chemical});
		// jQuery('#menu1').html('');
		jQuery('#menu1').html("${chemical_properties}");
		
		})







</script>