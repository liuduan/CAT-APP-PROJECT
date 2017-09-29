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

<%@ page import="com.catapp.entity.User"%>
<%@ page import="com.catapp.action.smallTools"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<<<<<<< HEAD
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


	
	// out.print(" " + User_ID);
		
%>

<<<<<<< HEAD
=======
	<sql:setDataSource var="snapshot"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/CATAPP?autoReconnect=true&useSSL=false" />
>>>>>>> 180f8eca364d8ed4b57417a630d104ad2dc6cd2d

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
<title>Authorization</title>

<link rel="shortcut icon"
	href="/CAT-APP-PROJECT/resources/images/logo2.ico" />


<link href="/CAT-APP-PROJECT/resources/css/bootstrap.min.css"
	rel="stylesheet">

	<!-- MetisMenu CSS -->
	<link href="/CAT-APP-PROJECT/resources/css/metisMenu.min.css"
		rel="stylesheet">

		<!-- Custom CSS -->
		<link href="/CAT-APP-PROJECT/resources/css/sb-admin-2.css"
			rel="stylesheet">

			<!-- Custom Fonts -->
			<link
				href="/CAT-APP-PROJECT/resources/css/font-awesome/css/font-awesome.min.css"
				rel="stylesheet" type="text/css">
</head>
<style>
#page-wrapper {
	/* background: RGBA(24, 161, 196, 0.2); */
	background: url('/CAT-APP-PROJECT/resources/images/bgLight.jpg') repeat
		center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}
</style>
<body>

	<div id="wrapper">
		<%
			String isAdmin = ((User) request.getSession().getAttribute("edituser")).getIs_admin();
			if (null == isAdmin || "" == isAdmin.trim()) {
		%>
		<jsp:include page="headerUserHome.jsp" />
		<%
			}
			if ("Y".equalsIgnoreCase(isAdmin)) {
		%>
		<jsp:include page="headerAdminHome.jsp" />
		<%
			}
		%>

		<div id="page-wrapper">

			<%
				String First_name = smallTools
						.safeString(((User) request.getSession().getAttribute("edituser")).getFirst_name());
				String Last_name = smallTools.safeString(((User) request.getSession().getAttribute("edituser")).getLast_name());
				String Email2 = smallTools.safeString(((User) request.getSession().getAttribute("edituser")).getEmail());
				String Approved = smallTools.safeString(((User) request.getSession().getAttribute("edituser")).getApproved());
				String Supervisorname = smallTools
						.safeString(((User) request.getSession().getAttribute("edituser")).getSupervisorname());
				String Phone_number = smallTools
						.safeString(((User) request.getSession().getAttribute("edituser")).getPhone_number());
				String Institution = smallTools
						.safeString(((User) request.getSession().getAttribute("edituser")).getInstitution());
				String Supervisorphone = smallTools
						.safeString(((User) request.getSession().getAttribute("edituser")).getSupervisorphone());
				String Supervisoremail = smallTools
						.safeString(((User) request.getSession().getAttribute("edituser")).getSupervisoremail());
			%>


			<%
				String Email = (String) request.getAttribute("Email"); // receiving value from servlet

				// out.print(" " + User_ID);
			%>


			<sql:setDataSource var="snapshot"
				driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
				url="jdbc:sqlserver://IRUSYN1LAP\\SQLEXPRESS;databaseName=CATAPP;integratedSecurity=true" />


			<sql:query dataSource="${snapshot}" var="result">
SELECT * from users where email = '${Email}';
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
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Grant/Revoke Permissions</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="row">
				<div class="panel panel-default">

					<div class="panel-body">
						<c:set var="Approved" scope="session" value='<%=Approved%>' />
						<form action="${pageContext.request.contextPath}/ManageAction"
							Method="POST">
							<input type="hidden" name="Email" value="${result.rows[0].Email}">
								<b>First Name: <span class="text-primary"><%=First_name%>
								</span></b>
								<p></p> <b>Last Name: <span class="text-primary"><%=Last_name%>
								</span></b>
								<p></p> <b>Institution: </b> <%=Institution%><p></p> <b>Phone
									Number: </b> <%=Phone_number%><p></p> <b>E-mail address: </b><%=Email2%><p></p>
								<input type="hidden" name="approved"
								value='${result.rows[0].approved}' /> <b>Request Approved:
									<span class="text-primary"><%=Approved%> </span>
							</b>
								<p></p>



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
	
	
	
	
=======

    				<b>: <span class="text-primary">${row.answer}</span></b>
									<p></p>

								</c:forEach> <c:choose>
									<c:when test="${Approved == 'Y'}">

										<p style="margin: auto; text-align: center">
											<input type="submit" class="btn btn-primary"
												value="Revoke Permission"></input>
									</c:when>
									<c:otherwise>
										<p style="margin: auto; text-align: center">
											<input type="submit" class="btn btn-primary"
												value="Grant Permission"></input>
									</c:otherwise>
								</c:choose> <a href="${pageContext.request.contextPath}/Admin"> <input
									type="button" class="btn btn-default" value="Go Back"></input></a>
								</p>
						</form>
					</div>
					</div>
				</div>

			</div>
		</div>



		<script src="/CAT-APP-PROJECT/resources/js/jquery.min.js"></script>

		<script src="/CAT-APP-PROJECT/resources/js/metisMenu.min.js"></script>



		<!-- Bootstrap Core JavaScript -->
		<script src="/CAT-APP-PROJECT/resources/js/bootstrap.min.js"></script>

		<!-- METISMENU SCRIPTS -->
		<script src="/CAT-APP-PROJECT/resources/js/jquery.metisMenu.js"></script>
		<!-- CUSTOM SCRIPTS -->
		<script src="/CAT-APP-PROJECT/resources/js/sb-admin-2.js"></script>
>>>>>>> SS-Master/master
</body>
</html>


