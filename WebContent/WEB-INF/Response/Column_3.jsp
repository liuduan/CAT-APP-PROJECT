<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  <li><a data-toggle="tab" href="#menu3"><Gray>Credit</Gray></a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
   
<Papaya>
<p style="text-align: right; font-size: 11px;">(chemical #: ${chemical}, endpoint #: ${endpoint})</p>


<c:choose>
    <c:when test="${endpoint == '1'}">
       <c:set var="endpoint_string" scope="page" value="Peak_freq_90min" />
       <c:set var="endpoint_name" scope="page" value="iCardiomyocyte Peak frequency 90 minutes" />
    </c:when>
    <c:when test="${endpoint == '2'}">
       <c:set var="endpoint_string" scope="page" value="Peak_freq_24hr" />
       <c:set var="endpoint_name" scope="page" value="iCardiomyocyte Peak frequency 24 hours" />
    </c:when>
    <c:when test="${endpoint == '3'}">
       <c:set var="endpoint_string" scope="page" value="HUVEC_total_cell" />
       <c:set var="endpoint_name" scope="page" value="HUVEC viable cell 24 hours" />
    </c:when>
    <c:when test="${endpoint == '4'}">
       <c:set var="endpoint_string" scope="page" value="HUVEC_tube_area" />
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
    <papaya><h3>Chemical properties</h3>
    <p>Chemical properties should be here.</p></papaya>
  </div>
  

  <div id="menu2" class="tab-pane fade">
  
    <papaya>${endpoint_data}. Assay method
    </papaya>
  </div>
  <div id="menu3" class="tab-pane fade">
    <papaya><h3></h3><br><br>
    <p style="text-indent: 50px;">The assays were done in Dr. Ivan Rusyn lab at Texas A&M University. </p>
    <p>The R program for dose response curves is from Dr. Fred Wright at the North Carolina State University. </p></papaya>
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