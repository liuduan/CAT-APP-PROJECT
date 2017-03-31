<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>CAT-APP</title>

	<!-- Bootstrap core CSS -->
<link rel="stylesheet" 
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body style="background-color: Azure">

<jsp:directive.include file="header.jsp" />



 <div class="container">
 	<br></br><br></br>
    <h1 style="text-align: center;" class = "text-danger">
    	Category Read-across Approaches For (Petroleum) UVCBs</h1>
    	
    <br></br>	<br></br>
 		

  <!-- <form class="form-horizontal" action="${pageContext.request.contextPath}/UserHome" method="POST"> -->
  <form class="form-horizontal" action="LoginServlet" method="post">
    <div class="form-group">

      <label class="control-label col-sm-5" for="Username">User email:</label>
      <div class="col-sm-3">
      	
        <input type="email" class="form-control" id="email" placeholder="Enter user email" name="email" >
      </div>
    </div>
    
    <div class="form-group">
    	<c:if test="${Message == 'IncorrectPassword'}">
   			<h5 class="text-danger" style="text-align: center;"><b>Incorrect password or user email.</b></h5>
		</c:if>
      <label class="control-label col-sm-5" for="pwd">Password:</label>
      <div class="col-sm-3">          
        <input type="password" class="form-control" id="pwd" name="password" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-5 col-sm-5">
        <div class="checkbox">
          <label><input type="checkbox"> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-5 col-sm-5">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </form>
  			
  <h4 style="text-align: center;" class = "text-primary">
  	<a href="${pageContext.request.contextPath}/Upload">
         New user application. </a></h4>		

    
    
    <br /> <br />	<br /> <br />	
    <h4 style="text-align: center;" class = "text-primary">
    	This website is currently designed for file exchange in CAT-APP project, 
    	although a lot more functions may be included in the future.</h4>
</div>
<br />
<div class="footer">
	<div class="text-primary" style="text-align: center;" >
    	This web site is created and maintained by Dr. Ivan Rusyn's Lab at Texas A&M University 
        For questions about this site, please contact dliu@cvm.tamu.edu.
    </div>
</div>

</body>
</html>