<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header" >
            <font style = "font-color: white; font-size:28px; font-weight:900;">
 				<a class="navbar-brand" href="${pageContext.request.contextPath}"> CAT-APP</a>
 				</font>
    	</div><!-- end of <div class="navbar-header" > -->
 
    	
      	<ul class="nav navbar-nav">
        	<li class="active">
        		<a href="${pageContext.request.contextPath}">
        			<span class="glyphicon glyphicon-home"></span> Home</a></li>
        	<li><a href="${pageContext.request.contextPath}/BackToHomeServlet">
        			<span class="glyphicon glyphicon-home"></span> User Home</a></li>
        	<li><a href="${pageContext.request.contextPath}/ViewDownload">
        		<span class = "glyphicon glyphicon-download-alt"></span> Download </a></li>
        	<li><a href="${pageContext.request.contextPath}/Upload">
        		<span class = "glyphicon glyphicon-upload"></span> Upload </a></li>
        	<li><a href="${pageContext.request.contextPath}/Admin">
        		<span class = "glyphicon glyphicon-lamp"></span> Administration</a></li>
        </ul>
    	<ul class="nav navbar-nav navbar-right">
            <li id="Contact" >
               	<a href="${pageContext.request.contextPath}">
               		<span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        	<li id="Contact" >
               	<a href="${pageContext.request.contextPath}">
               		<span class="glyphicon glyphicon-phone-alt"></span> Contact</a></li>
               		
        	<li><a href="${pageContext.request.contextPath}">
        		<span class="glyphicon glyphicon-info-sign"></span> About</a></li>
 
      	</ul>
    	
 	</div><!-- end of class = container-fluid -->
 </nav>		<!-- end of vav-->


</body>
</html>
