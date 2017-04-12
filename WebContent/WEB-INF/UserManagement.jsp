
<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.catapp.action.Login" %>

<%@ page import="com.catapp.entity.User" %>
<%@ page import="com.catapp.action.smallTools" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
			<title>Authorization</title>

			<!-- Bootstrap core CSS -->
			<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body background="${pageContext.request.contextPath}/resources/images/Catapp_logo_full.jpg"
	style="background-size: cover;">


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

	
	// out.print(" " + User_ID);
		
%>


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
SELECT * from security_questions;
</sql:query>



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
    			
    				
    			
    				${questions_result.rows[row.question_id - 1].security_question}
    		
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

