
<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
<<<<<<< HEAD
    pageEncoding="ISO-8859-1"%>
    
=======
	pageEncoding="ISO-8859-1"%>

>>>>>>> SS-Master/master
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<<<<<<< HEAD
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.catapp.action.Login" %>

<%@ page import="com.catapp.entity.User" %>
<%@ page import="com.catapp.action.smallTools" %>

=======
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.catapp.action.Login"%>
>>>>>>> SS-Master/master



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<<<<<<< HEAD
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
			<title>Authorization</title>

			<!-- Bootstrap core CSS -->
			<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body background="${pageContext.request.contextPath}/resources/images/Catapp_logo_full-blur.svg"
	style="background-size:250%">


<% 
String First_name = smallTools.safeString(((User)request.getSession().getAttribute("user")).getFirst_name()); 
String Last_name = smallTools.safeString(((User)request.getSession().getAttribute("user")).getLast_name());
String Email2 = smallTools.safeString(((User)request.getSession().getAttribute("user")).getEmail());
String Approved = smallTools.safeString(((User)request.getSession().getAttribute("user")).getApproved());
String Supervisorname = smallTools.safeString(((User)request.getSession().getAttribute("user")).getSupervisorname());
String Phone_number = smallTools.safeString(((User)request.getSession().getAttribute("user")).getPhone_number());
String Institution = smallTools.safeString(((User)request.getSession().getAttribute("user")).getInstitution());
String Supervisorphone = smallTools.safeString(((User)request.getSession().getAttribute("user")).getSupervisorphone());
String Supervisoremail = smallTools.safeString(((User)request.getSession().getAttribute("user")).getSupervisoremail());
%>  

  
<%
	String Email = (String) request.getAttribute("Email");	// receiving value from servlet

=======

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Authorization</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<%
	String Email = (String) request.getAttribute("email");	// receiving value from servlet
>>>>>>> SS-Master/master
	
	// out.print(" " + User_ID);
		
%>

<<<<<<< HEAD

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/catapp"
     user="root"  password="vibscatapp"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from users where Email = "${Email}";
</sql:query>

<sql:query dataSource="${snapshot}" var="answers_result">
SELECT * from security_questions_answers where user_id = "${result.rows[0].entity_id}";
</sql:query>

<sql:query dataSource="${snapshot}" var="questions_result">
=======
	<sql:setDataSource var="snapshot"
		driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
		url="jdbc:sqlserver://IRUSYN1LAP\\SQLEXPRESS;databaseName=CATAPP;integratedSecurity=true" />

	<sql:query dataSource="${snapshot}" var="result">
SELECT * from users where Email = '<%=Email%>';
</sql:query>

	<sql:query dataSource="${snapshot}" var="answers_result">
SELECT * from security_questions_answers where user_id = '${result.rows[0].entity_id}';
</sql:query>

	<sql:query dataSource="${snapshot}" var="questions_result">
>>>>>>> SS-Master/master
SELECT * from security_questions;
</sql:query>



<<<<<<< HEAD
<div id="New_Window_content" style="margin:auto;">
	<div style="margin:auto; width:700px; background-color: AntiqueWhite; padding: 50px;
		margin-top:50px;
		margin-bottom:50px;
-webkit-box-shadow: 0 0 6px 4px black;
   -moz-box-shadow: 0 0 6px 4px black;
        box-shadow: 0 0 16px 4px black;">
        <head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
			<title>Authorization</title>

			<!-- Bootstrap core CSS -->
			<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

		</head>
    	<h3 style="text-align: center;" class = "text-danger"><b>
    	Authorization and Password Reset</b></h2><br>
    	
    	<c:set var="Approved" scope = "session" value = '<%=Approved%>' />
    	<form action="${pageContext.request.contextPath}/ManageAction" Method="POST">
      		<input type="hidden" name="Email" value="${result.rows[0].Email}">
    		<b>Name: <span class="text-primary"><%=First_name%> <%=Last_name%> </span></b><p></p>
    		<c:choose>
    			<c:when test="${Approved == 'Y'}">

        			<c:set var="checked" scope="session" value="checked"/> 
    			</c:when>    
    			<c:otherwise>
    				<c:set var="checked" scope="session" value=""/> 
    				</c:otherwise>
				</c:choose>
    		
  			<input type="checkbox" name="Authorization" value="Yes_authorizing" ${checked}><b>Authorization</b><p></p>
			<input type="checkbox" name="Change_password" value="Change_password"><b>Change Password</b><p></p>
			
    		<b>New Password: </b><input name="Passowrd_1" ></input> <br></br>
    		<b>Repeat Password: </b><input name="Password_2" ></input><p></p>

    		<b>Institution: </b> <%=Institution %><p></p>
    		<b>Phone Number: </b> <%=Phone_number %><p></p>
    		<b>E-mail address: </b><%=Email2%><p></p>
    		<b>Supervisor Name: </b><%=Supervisorname%> <p></p>
    		<b>Supervisor Phone number: </b><%=Supervisorphone%> <p></p>
    		<b>Supervisor Email: </b><%=Supervisoremail%> <p></p><br></br>

      		
          	<p  style="text-align:center"><b>Security Questions: </b></p>
          	
    			<c:forEach var="row" items="${answers_result.rows}">  
=======
	<div id="New_Window_content" style="margin: auto;">
		<div
			style="margin: auto; width: 700px; background-color: AntiqueWhite; padding: 50px; margin-top: 50px; margin-bottom: 50px; -webkit-box-shadow: 0 0 6px 4px black; -moz-box-shadow: 0 0 6px 4px black; box-shadow: 0 0 16px 4px black;">




			<h3 style="text-align: center;" class="text-danger">
				<b> Authorization and Password Reset</b>
			</h3>


			<form action="${pageContext.request.contextPath}/ManageAction"
				Mehtod="post">
				<input type="hidden" name="Email" value="${result.rows[0].Email}">
					<b>Name: <span class="text-primary">${result.rows[0].First_name}
							${result.rows[0].Last_name}</span></b>
				<p></p> <c:choose>
						<c:when test="${result.rows[0].Approved == 'Y'}">
							<c:set var="checked" scope="session" value="checked" />
						</c:when>
						<c:otherwise>
							<c:set var="checked" scope="session" value="" />
						</c:otherwise>
					</c:choose> <input type="checkbox" name="Authorization"
					value="Yes_authorizing" ${checked}><b>Authorization</b>
					<p></p> <input type="checkbox" name="Change_password"
						value="Change_password"><b>Change Password</b>
						<p></p> <b>New Password: </b><input name="Passowrd_1"></input> <br></br>
							<b>Repeat Password: </b><input name="Password_2"></input>
						<p></p> <b>Phone Number: </b><c:out
								value="${result.rows[0].Phone_Number}" />
							<p></p> <b>E-mail address: </b><c:out
								value="${result.rows[0].Email}" />
							<p></p> <b>Supervisor Username: </b><c:out
								value="${result.rows[0].Supervisor_ID}" />
							<p></p> <b>Supervisor Name: </b><c:out
								value="${result.rows[0].Supervisor_name}" />
							<p></p> <b>Supervisor Phone number: </b><c:out
								value="${result.rows[0].Supervisor_phone}" />
							<p></p> <b>Supervisor Email: </b><c:out
								value="${result.rows[0].Supervisor_Email}" />
							<p></p>
							<br>





								<p style="text-align: center">
									<b>Security Questions: </b>
								</p> <c:forEach var="row" items="${answers_result.rows}">  
>>>>>>> SS-Master/master
    			
    				
    			
    				${questions_result.rows[row.question_id - 1].security_question}
    		
<<<<<<< HEAD
    				<b>: <span class="text-primary">${row.answer}</span></b><p></p>	

      			</c:forEach>  
    		
    		
    		
    		
    		
    		
    		
    		
    		<p style="margin:auto; text-align:center">
    		<input type="submit" class="btn btn-primary" value ="Save"></input>
  
  
  
  			<a href="${pageContext.request.contextPath}/Admin">
  			<input type="button" class="btn btn-danger" value ="Cancel"></input></a></p>
  		</form>
    </div>
</div>	
	
	
	
	
</body>
</html>

=======
    				<b>: <span class="text-primary">${row.answer}</span></b>
									<p></p>

								</c:forEach>








								<p style="margin: auto; text-align: center">
									<input type="submit" class="btn btn-primary" value="Save"></input>



									<a href="${pageContext.request.contextPath}/Admin"> <input
										type="button" class="btn btn-danger" value="Cancel"></input></a>
								</p>
			</form>
		</div>
	</div>




</body>
</html>
>>>>>>> SS-Master/master
