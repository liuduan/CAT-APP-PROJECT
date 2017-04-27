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


<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home"><Gray>Response curve</Gray></a></li>
  <li><a data-toggle="tab" href="#menu1" id="menue_property"><Gray>Chemical properties</Gray></a></li>
  <li><a data-toggle="tab" href="#menu2"><Gray>Assay</Gray></a></li>
  <li><a data-toggle="tab" href="#menu3"><Gray>Assay data</Gray></a></li>
  <li><a data-toggle="tab" href="#menu4"><Gray>Credit</Gray></a></li>
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
        <img  class="img-responsive" src="data:image/jpg;base64, <%=b64%>" style="margin: auto;"/>                            
        <% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 


    %>


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
	Dose 1000x: ${Assay_data_result.rows[0].Dose_1000x}<br>
	Dose 100x: ${Assay_data_result.rows[0].Dose_100x}<br>
	Dose 10x: ${Assay_data_result.rows[0].Dose_10x}<br>
	Dose 1x: ${Assay_data_result.rows[0].Dose_1x}<br>
	
	
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