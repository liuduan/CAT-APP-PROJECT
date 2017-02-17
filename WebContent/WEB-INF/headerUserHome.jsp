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
	<div class="container">
		<div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                 <form action="BackToMainServlet" method="get">
                 <a class="navbar-brand" href="">CAT-APP</a>
            	</form>
            </div><!-- end of <div class="navbar-header" > -->
 
    	
      	
    	
    	<ul class="nav navbar-nav navbar-right">
          <li class="active">
        		<a href="BackToHomeServlet">
        			 Home</a></li>
        <li>
        		<a href="#">
        			 User profile</a></li>
        	<li>
        		<a href="#">
        			 Contact us</a></li>
        	<li>
        		<a href="LogoutServlet">
        			 Logout</a></li>
        	
            
 
      	</ul>
    	
 	</div><!-- end of class = container-fluid -->
 </nav>		<!-- end of vav-->
</body>
</html>