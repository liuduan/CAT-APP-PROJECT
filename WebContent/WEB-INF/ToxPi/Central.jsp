<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@page import="java.io.File"%>
    <%@page import="java.io.IOException"%>
    <%@page import="java.awt.image.BufferedImage"%>
    <%@page import="javax.imageio.ImageIO"%>
    <%@page import="java.io.ByteArrayOutputStream"%>

    <%@page import="java.math.BigInteger"%>
    <%@page import="javax.xml.bind.DatatypeConverter"%>
    <%@page import="java.awt.image.BufferedImage"%>
    <%@page import="sun.misc.BASE64Decoder"%>
    <%@page import="java.awt.image.BufferedImage"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
Central
<%
String endpoint_string = (String)pageContext.getAttribute("endpoint_string");
String chemical_string = (String)request.getAttribute("chemical");

String image_path = "C:\\4_R\\ToxPi\\ToxPi_Temp\\ToxPi.png";
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
      byte[] imageByte;

      String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
      
  
      BASE64Decoder decoder = new BASE64Decoder();
      imageByte = decoder.decodeBuffer(b64);
      
      
      baos.close();                                   


      
        
%>
<div id = "draggable" style="text-align: center;">
	<img  id="response-curve" src="data:image/jpg;base64, <%=b64%>" />
</div>
<% 
    }catch(IOException e){
      	System.out.println("Error: "+e);
    	} 
%>
</body>
</html>