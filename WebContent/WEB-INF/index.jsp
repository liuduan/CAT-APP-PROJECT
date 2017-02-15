<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CAT-APP</title>

    <!-- Bootstrap Core CSS -->
    <link href="/CAT-APP-PROJECT/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/CAT-APP-PROJECT/resources/css/full-width-pics.css" rel="stylesheet">
	<link href="/CAT-APP-PROJECT/resources/css/login.css" rel="stylesheet">
	<link href="/CAT-APP-PROJECT/resources/css/circleAnimation.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	<style type="text/css">
	.bs-example{
    	margin: 20px;
    }
    .read{
    overflow: hidden;
    font-size: 16px !important;
    transition: all 0.3s;
    margin-bottom: 10px;
}
.read-less{
    height: 40px!important;
}

#pswd_info {
    position:absolute;
    bottom:-75px;
    bottom: -115px\9; /* IE Specific */
    right:55px;
    width:250px;
    padding:15px;
    background:#fefefe;
    font-size:.875em;
    border-radius:5px;
    box-shadow:0 1px 3px #ccc;
    border:1px solid #ddd;
}

#pswd_info h4 {
    margin:0 0 10px 0;
    padding:0;
    font-weight:normal;
}

#pswd_info::before {
    content: "\25B2";
    position:absolute;
    top:-12px;
    left:45%;
    font-size:14px;
    line-height:14px;
    color:#ddd;
    text-shadow:none;
    display:block;
}

.invalid {
   	background:url(/CAT-APP-PROJECT/resources/images/cross.png) no-repeat 0 50%;
    padding-left:22px;
    line-height:24px;
    color:#ec3f41;
}
.valid {
    background:url(/CAT-APP-PROJECT/resources/images/tick.png) no-repeat 0 50%;
    padding-left:22px;
    line-height:24px;
    color:#3a7d34;
}

#pswd_info {
    display:none;
}
</style>
</head>

<body>
<jsp:include page="header.jsp" />
    <!-- Navigation -->
    <%
String login_msg=(String)request.getAttribute("error");  
if(login_msg!=null)
out.println("<font color=red size=4px>"+login_msg+"</font>");
%>

    <!-- Full Width Image Header with Logo -->
    <!-- Image backgrounds are set within the full-width-pics.css file. -->
    <div class="container">
    <header class="jumbotron hero-spacer" style="margin-top: 15px">
            
            
            <div class="container">


			

        <!-- Heading Row -->
        <div class="row">
            <div class="col-md-6">
                <img class="img-responsive" src="/CAT-APP-PROJECT/resources/images/logo.JPG" alt="" style="margin-top:10%">
            </div>
            <!-- /.col-md-8 -->
            <div class="col-md-6">
            <p class="read">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque eget ex a lobortis. 
            </p><br>
            <div class="circle circle2" align="center" style="margin-left:40%">
          		<a href="#about"><h3>Read more</h3></a>
        		</div>
             <!-- <a href="#" class="btn btn-success btn-lg" id="readMore">Show Less</a></small><br>-->
                </div>
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->

			
				
   		
		<a href="#login" class="btn btn-lg btn-primary btn-block" style="margin-left: 40%;margin-top:10%;height: 40px; width:300px">Sign in or <font color="purple"><b>Request Access</b></font></a>
        </header>
        
</div>
        <hr>

    <!-- Content Section -->
<section id="login">
<div class="container">

<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		
			<fieldset>
				<h2 align="center">Please Sign In</h2>
				<hr class="colorgraph">
				<form action="LoginServlet" method="post">
				<div class="form-group">
                    <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" required="required">
				</div>
				<div class="form-group">
                    <input type="password" name="password" id="passwordLogin" class="form-control input-lg" placeholder="Password" required="required">
				</div>
				
					<div class="checkbox">
    				<label><input type="checkbox" id="rememberMe"> Remember me</label>
  				</div>
                    <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
					<!-- 
					<a href="#" class="btn btn-link pull-right">Forgot Password?</a>
					 -->
					<button type="button" class="btn btn-link pull-right" data-toggle="modal" data-target="#exampleModal" data-whatever="">Forgot Password?</button>


						
					
					
					
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Sign in">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="#register" class="btn btn-lg btn-primary btn-block" onclick="showRegistration()">Request Access</a>
					</div>
				</div>
				</form>
			</fieldset>
		
	</div>
</div>

</div>

		
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  					<div class="modal-dialog" role="document">
    					<form action="RequestAccessServlet" method="post">		
    					<div class="modal-content">
      						<div class="modal-header">
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        						<h4 class="" id="exampleModalLabel">Forget Password?</h4>
      								</div>
      								<div class="modal-body">
        							
          							<div class="form-group">
            							<label for="recipient-name" class="control-label">Enter email address:</label>
            							<input type="email" class="form-control" id="forgotEmail" name="forgotEmail">
          							</div>
          							
        
      						</div>
      						<div class="modal-footer">
        						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        						<input type="submit" class="btn btn-primary" value="Submit"/>
      						</div>
      						
    				</div>
    				</form>
  				</div>
		</div>
		
    </section>

 <section id = "register">
 <div class="container" id="registration" style="display: none">

<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="SubmittedRequestServlet" method="post">
			<fieldset>
				<h2 align="center">Request access</h2>
				<hr class="colorgraph">
				
				
					<div class="form-group">
                    	<input type="text" id="first_name" name="first_name" class="form-control input-lg" placeholder="First Name">
					</div>
					<div class="form-group">
                   	 	<input type="text" id="last_Name" name="last_Name" class="form-control input-lg" placeholder="Last Name">
					</div>
				
				
					<div class="form-group">
                    	<input type="email" id="email" name="email" class="form-control input-lg" placeholder="Email Address">
				    </div>
					<div class="form-group">
                    	<input type="number" id="phone_number" name="phone_number" class="form-control input-lg" placeholder="Contact No">
				    </div>
				    
				    <div class="form-group">
                    	<input type="text" id="institution" name="institution" class="form-control input-lg" placeholder="Institution">
				    </div>
				
				
					<div class="form-group">
                    	<input type="text" id="supervisor_name" name="supervisor_name" class="form-control input-lg" data-provide="typeahead" placeholder="Supervisor  Name">
					</div>
					<div class="form-group">
                    	<input type="text" id="supervisor_phone" name="supervisor_phone" class="form-control input-lg"  placeholder="Supervisor ContactNo">
					</div>
					<div class="form-group">
                    	<input type="text" id="supervisor_email" name="supervisor_email" class="form-control input-lg" data-provide="typeahead" placeholder="Supervisor Email">
					</div>
					<div class="form-group">
                    <input type="password" id="password" name="password" class="form-control input-lg" placeholder="Desired Password" required="required">
				    </div>
				    <!-- 
				    <div id="pswd_info">
    					<h4>Password must meet the following requirements:</h4>
  						 <ul>
      					 <li id="letter" class="invalid">At least <strong>one letter</strong></li>
       					 <li id="capital" class="invalid">At least <strong>one capital letter</strong></li>
        				<li id="number" class="invalid">At least <strong>one number</strong></li>
        				<li id="length" class="invalid">Be at least <strong>8 characters</strong></li>
   						 </ul>
					</div> -->
				    <div class="form-group">
                    <input type="password" id="repassword" name="repassword" class="form-control input-lg" placeholder="Re-enter Password" required="required">
				    </div>
					
					
					
				
				<!-- 	<div class="form-group">
                    	<input type="email" name="sEmail" id="sEmail" class="form-control input-lg" placeholder="Supervisor Email Address">
				</div>
					<div class="form-group">
                    	<input type="number" name="sContactNo" id="sContactNo" class="form-control input-lg" placeholder="Supervisor Contact No">
				</div> -->
				
				<div class="form-group">
					<div class="dropdown">
                		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="width:100%">Security question 1
                    		<span class="caret"></span>
                		</button>
                		<%-- <ul class="dropdown-menu" id="secqu">
                    		<c:forEach var="sec1" items="${secqu}">
                    		<li value="${sec1.key}">${sec1.value}</li>
                    		</c:forEach>
                		</ul> --%>
                		
                		<select name="sec1" id="secqu">
    					<c:forEach var="sec1" items="${secqu}">
						<option value="${sec1.key}"> ${sec1.value}</option>
						</c:forEach>
					    </select> 
            		</div>
				</div>
				<div class="form-group">
                    	<input type="text" name="ans1" id="ans1" class="form-control input-lg" placeholder="Answer1">
				</div>
				
				<div class="form-group">
					<div class="dropdown">
                		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="width:100%">Security question 2
                    		<span class="caret"></span>
                		</button>
                		<%-- <ul class="dropdown-menu" id="secqu">
                    		<c:forEach var="sec2" items="${secqu}">
                    		<li value="${sec2.key}">${sec2.value}</li>
                    		</c:forEach>
                		</ul> --%>
                		<select name="sec3" id="secqu">
    					<c:forEach var="sec3" items="${secqu}">
						<option value="${sec3.key}"> ${sec3.value}</option>
						</c:forEach>
					    </select> 
                		
            		</div>
				</div>
				<div class="form-group">
                    	<input type="text" name="ans2" id="ans2" class="form-control input-lg" placeholder="Answer2">
				</div>
				<div class="form-group">
					<div class="dropdown">
                		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="width:100%">Security question 3
                    		<span class="caret"></span>
                		</button>
                		<%-- <ul class="dropdown-menu" id="secqu">
                    		<c:forEach var="sec3" items="${secqu}">
                    		<li value="${sec3.key}">${sec3.value}</li>
                    		</c:forEach>
                		</ul> --%>
                		<select name="sec2" id="secqu">
    					<c:forEach var="sec2" items="${secqu}">
						<option value="${sec2.key}"> ${sec2.value}</option>
						</c:forEach>
					    </select> 
            		</div>
				</div>
				<div class="form-group">
                    	<input type="text" name="ans3" id="ans3" class="form-control input-lg" placeholder="Answer3">
				</div>
				<!-- <div class="form-group"> Select your project(s)
					<label class="checkbox-inline">
  						<input type="checkbox" id="catAppP" value="CAT-APP"> CAT-APP
					</label>
					<label class="checkbox-inline">
  						<input type="checkbox" id="analyticalP" value="Analytical"> Analytical
					</label>
					<label class="checkbox-inline">
  						<input type="checkbox" id="ecoToxP" value="ECO-TOX"> ECO-TOX
					</label>
				</div> -->
				
				
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Request Access" style="margin-left: 50%">
					</div>
					
				</div>
				
				
			</fieldset>
		</form>
	</div>
</div>

</div>
 
 </section>   

 <!-- About Section -->
    <section class="success" id="about">
        <div class="container">
            
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>About</h2>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>.......</p>
                </div>
                <div class="col-lg-4">
                    <p>......</p>
                </div>
                
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Contact Me</h2>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Name</label>
                                <input type="text" class="form-control" placeholder="Name" id="name" required data-validation-required-message="Please enter your name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="email" class="form-control" placeholder="Email Address" id="email" required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone Number</label>
                                <input type="tel" class="form-control" placeholder="Phone Number" id="phone" required data-validation-required-message="Please enter your phone number.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Message</label>
                                <textarea rows="5" class="form-control" placeholder="Message" id="message" required data-validation-required-message="Please enter a message."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </footer>

    <!-- jQuery -->
    <script src="/CAT-APP-PROJECT/resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/CAT-APP-PROJECT/resources/js/bootstrap.min.js"></script>
    <script src="/CAT-APP-PROJECT/resources/js/homepage.js"></script>
    

</body>

</html>
