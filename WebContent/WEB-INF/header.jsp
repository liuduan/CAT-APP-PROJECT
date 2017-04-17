
 
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

	<div class="container-fluid">
		<div class="navbar-header" >
            <font style = "font-color: white; font-size:28px; font-weight:900;">
 				<a class="navbar-brand" href="${pageContext.request.contextPath}"> CAT-APP</a>
 				</font>
    	</div><!-- end of <div class="navbar-header" > -->
 
    	
      	<ul class="nav navbar-nav">
        	<li><a href="${pageContext.request.contextPath}/BackToHomeServlet">
        			<span class="glyphicon glyphicon-home"></span> User Home</a></li>
        </ul>
    	<ul class="nav navbar-nav navbar-right">
  			<li>
        		<a href="UserDisplayController"><span class="glyphicon glyphicon-user"></span> User profile</a></li>

            <li id="Contact" >
               	<a href="LogoutServlet">
               		<span class="glyphicon glyphicon-log-out"></span> Logout</a></li> 
      	</ul>
    	
 	</div><!-- end of class = container-fluid -->
 </nav>		<!-- end of vav-->
