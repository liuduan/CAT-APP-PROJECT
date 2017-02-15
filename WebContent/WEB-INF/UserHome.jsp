<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
	<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body style="background-color: Azure" onload="Wrong_password()">
<jsp:directive.include file="Header.jsp" />


<!--  
Received variables: 
Email: ${Email}<br></br>
Email: ${Email2}<br></br>
${Password}<br></br>
-->
<div style="position: absolute;
    top: 70px;
    right: 20px;"><!-- picture div -->
<img src="https://www.advantagetesting.com/tutors/rushi-talati/_res/id=Picture" 
	class="img-rounded" alt="Cinque Terre" width="150" height="160">	
	
		

</div >		<!-- end of picture div -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/catapp"
     user="root"  password="root"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from users where Email ="${Email}";
</sql:query>

<%
   String name = request.getParameter( "username" );
   session.setAttribute( "theName", name );
%>

<!--  x
Received Password: ${Password}<br></br>
Password from db: ${result.rows[0].Password}
-->

<c:if test="${result.rows[0].Password != Password}">
	<script type="text/javascript">
    	function Wrong_password() {
    		window.location = "${pageContext.request.contextPath}/Cover?Message=IncorrectPassword"}    
    </script>
   <p>Incorrect password.<p>
</c:if>






<br></br>
<h1 style="text-align: center;" class = "text-danger">
    Welcome ${result.rows[0].First_name} ${result.rows[0].Last_name}

</h1>
<h4 style="text-align: center;" class="text-primary">
   	From ${result.rows[0].Supervisor_First_Name} ${result.rows[0].Supervisor_Last_Name} group at
	${result.rows[0].Institution}
</h4><br><br><br><br><br><br><br><br><br><br>



<div style="text-align: center;">		<!-- div for buttons -->
	<form action="${pageContext.request.contextPath}/ViewDownload" Method="post" style="display: inline;">
		<input type="hidden" name="Email" value="${result.rows[0].Email}"/>
		<input type="submit" class="btn btn-primary btn-lg" value ="View and Download Files"></input>
	</form>
	<form action="${pageContext.request.contextPath}/Upload" Method="post" style="display: inline;">
		<input type="hidden" name="Email" value="${result.rows[0].Email}"/>
		<input type="submit" class="btn btn-danger btn-lg" value ="Upload Files"></input>
	</form>
	<form action="${pageContext.request.contextPath}/UserHome" Method="post" style="display: inline;">
		<input type="hidden" name="Email" value="${result.rows[0].Email}"/>
		<input type="submit" class="btn btn-info btn-lg" value ="Update User Info"></input>
	</form>
</div>		<!-- end of div for buttons -->

</body>
</html>