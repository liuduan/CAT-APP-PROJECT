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




<Papaya>
Column 3<br>
chemical: ${chemical}<br>
endpoint: ${endpoint}<br>


<c:choose>
    <c:when test="${endpoint == '1'}">
    	1
       <c:set var="endpoint_string" scope="session" value="Peak_freq_90min" />
    </c:when>
    <c:when test="${endpoint == '2'}">
    	2
       <c:set var="endpoint_string" scope="session" value="Peak_freq_24hr" />
    </c:when>
    <c:when test="${endpoint == '3'}">
    	 3
       <c:set var="endpoint_string" scope="session" value="HUVEC_total_cell" />
    </c:when>
    <c:when test="${endpoint == '4'}">
    	 4
       <c:set var="endpoint_string" scope="session" value="HUVEC_tube_area" />
    </c:when>
</c:choose>
<br>
endpoint_string: ${endpoint_string}<br>

<img src="${pageContext.request.contextPath}/resources/R-images/${endpoint_string}${chemical}.png">
</Papaya>






<%
    //write image
    try{
      String imgName="C:\\4_R\\Demonstration\\Peak_Freq_24hr\\Figs\\Oil.jpg";
      BufferedImage bImage = ImageIO.read(new File(imgName));//give the path of an image
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write( bImage, "jpg", baos );
        baos.flush();
        byte[] imageInByteArray = baos.toByteArray();
        baos.close();                                   
        String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
        %>
        <img  class="img-responsive" src="data:image/jpg;base64, <%=b64%>"/>                            
        <% 
    }catch(IOException e){
      System.out.println("Error: "+e);
    } 


    %>






