<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
<<<<<<< HEAD
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
=======
	pageEncoding="ISO-8859-1"%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
>>>>>>> SS-Master/master
<!DOCTYPE html>
<html lang="en">

<head>

<<<<<<< HEAD
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
	
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

	
	<link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	
	
    
</head>

<body>
<jsp:directive.include file="HeaderCover.jsp" />
<br><br><br><br>

    <!-- Navigation -->
   <div class="container" id="registration">
 <c:if test="${param.page eq 1}">
<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    
		<form action="ForgotPasswordServlet" method="post">
			<input type="hidden" name ="forgotEmail" value ="${forgotEmail}">
			<fieldset>
				<h2 align="center">Security Questions</h2>
				<hr class="colorgraph">		
				
				<div class="form-group">
					<div class="dropdown">
                		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="width:100%">Security question 1
                    		<span class="caret"></span>
                		</button>
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
                		<select name="sec2" id="secqu">
    					<c:forEach var="sec2" items="${secqu}">
						<option value="${sec2.key}"> ${sec2.value}</option>
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
                		<select name="sec3" id="secqu">
    					<c:forEach var="sec3" items="${secqu}">
						<option value="${sec3.key}"> ${sec3.value}</option>
						</c:forEach>
					    </select>
            		</div>
				</div>
				<div class="form-group">
                    	<input type="text" name="ans3" id="ans3" class="form-control input-lg" placeholder="Answer3">
				</div>
				
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
						
                        <input type="submit" class="btn btn-lg btn-success btn-block" name="pwd" value="Validate" style="margin-left: 50%">
					</div>
					
				</div>
				
			</fieldset>
		</form>
	</div>
</div>
</c:if>
<c:if test="${param.page eq 2}">
<div class="row" style="margin-top:20px">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="ForgotPasswordServlet" method="post">
			<fieldset>
				<h2 align="center">Change Password</h2>
				<hr class="colorgraph">		
				<div class="form-group">
                    <input type="password" id="password" name="password" class="form-control input-lg" placeholder="New Password" required="required">
				    </div>
				    <div class="form-group">
                    <input type="password" id="repassword" name="repassword" class="form-control input-lg" placeholder="Re-enter Password" required="required">
				    </div>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
					   
                        <input type="submit" class="btn btn-lg btn-success btn-block" name="pwd" value="Change" style="margin-left: 50%">
					</div>
					
				</div>
				
			</fieldset>
		</form>
	</div>
</div>
</c:if>

<c:if test="${param.page eq 3}">
<br><br><br><br><br><br>
This e-mail address is not authorized to access.
</c:if>
</div>
 

 

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
=======
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>CAT-APP</title>

<!-- Bootstrap Core CSS -->
<link href="/CAT-APP-PROJECT/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/CAT-APP-PROJECT/resources/css/full-width-pics.css"
	rel="stylesheet">
<link href="/CAT-APP-PROJECT/resources/css/login.css" rel="stylesheet">
<style>
body {
	font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
	background: url('/CAT-APP-PROJECT/resources/images/bg.jpg') repeat
		center center fixed;
	/*background-color: #18a1c4;*/
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}
</style>
</head>

<body>

	<!-- Navigation -->
	<div class="container" id="registeration">
		<c:if test="${param.page eq 1}">
			<div class="row">
				<div class="col-lg-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-heading text-center">Security Questions</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-8 col-sm-offset-2">
									<form role="form" action="ForgotPasswordServlet" method="post">



										<div class="form-group">

											<select name="sec1" id="secqu" class="form-control">
												<c:forEach var="sec1" items="${secqu}">
													<option value="${sec1.key}">${sec1.value}</option>
												</c:forEach>
											</select>

										</div>
										<div class="form-group">
											<input type="text" name="ans1" id="ans1"
												class="form-control input-lg" placeholder="Answer1">
										</div>

										<div class="form-group">

											<select name="sec2" id="secqu" class="form-control">
												<c:forEach var="sec2" items="${secqu}">
													<option value="${sec2.key}">${sec2.value}</option>
												</c:forEach>
											</select>

										</div>
										<div class="form-group">
											<input type="text" name="ans2" id="ans2"
												class="form-control input-lg" placeholder="Answer2">
										</div>
										<div class="form-group">

											<select name="sec3" id="secqu" class="form-control">
												<c:forEach var="sec3" items="${secqu}">
													<option value="${sec3.key}">${sec3.value}</option>
												</c:forEach>
											</select>

										</div>
										<div class="form-group">
											<input type="text" name="ans3" id="ans3"
												class="form-control input-lg" placeholder="Answer3">
										</div>

										<div class="row">
											<div class="col-xs-6 col-sm-6 col-md-6">

												<input type="submit"
													class="btn btn-lg btn-primary btn-block" name="pwd"
													value="Validate" style="margin-left: 50%">
											</div>

										</div>


									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${param.page eq 2}">
			<div class="row" style="margin-top: 20px">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<form action="ForgotPasswordServlet" method="post">
						<fieldset>
							<h2 align="center">Change Password</h2>
							<div class="form-group">
								<input type="password" id="password" name="password"
									class="form-control input-lg" placeholder="New Password"
									required="required">
							</div>
							<div class="form-group">
								<input type="password" id="repassword" name="repassword"
									class="form-control input-lg" placeholder="Re-enter Password"
									required="required">
							</div>
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">

									<input type="submit" class="btn btn-lg btn-primary btn-block"
										name="pwd" value="Change" style="margin-left: 50%">
								</div>

							</div>

						</fieldset>
					</form>
				</div>
			</div>
		</c:if>
	</div>




	<%--    	<jsp:include page="footer.jsp" />
 --%>

	<!-- jQuery -->
	<script src="/CAT-APP-PROJECT/resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/CAT-APP-PROJECT/resources/js/bootstrap.min.js"></script>
	<script src="/CAT-APP-PROJECT/resources/js/homepage.js"></script>
>>>>>>> SS-Master/master

</body>

</html>
