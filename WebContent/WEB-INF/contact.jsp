<<<<<<< HEAD

<!DOCTYPE html>
<html lang="en">

 <%-- <jsp:include page="../views/fragments/header.jsp" /> --%>

    <head>

        <title>CAT-APP</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" />
     <!--    <link rel="stylesheet" href="/database_project/scripts/assets/bootstrap/css/bootstrap.min.css"> -->
        <link rel="stylesheet" href="resources/css/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/css/form-elements.css">
        <link rel="stylesheet" href="resources/css/style.css"> 

        
        <link rel="shortcut icon" href="resources/images/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/images/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/images/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/images/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="resources/images/apple-touch-icon-57-precomposed.png"> 

    </head>

    <body>
		<!-- 	<div align="right"><a href = "/database_project/Protected/ID_home">
		<img src="/database_project/scripts/images/MB__home.png"/></a>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;</div> -->
		<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					 <a class="navbar-brand" >Upload Files</a> 
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="top-navbar-1">
					
				</div>
			</div>
		</nav>

        <!-- Top content -->
        <!-- <div class="top-content"> -->
        	
           <!--  <div class="inner-bg"> -->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>UPLOAD</strong> Files in CAT-APP</h1>
                            <div class="description">
                            	<p>
	                            	Give us Cell Types,Assay Name,Time Point, Phenotype name and Plate Id and you are <strong>good</strong> to go!
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	
                        	<form role="form" action="" method="post" class="registration-form">
                        		
                        		<fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 1 / 5</h3>
		                            		<h4>Tell us Cell Type:</h4><p>Somewhere to Start &#9786;</p>
		                        		</div>
		                        		
		                            </div>
		                            <div class="form-bottom">
				                    	<div class="form-group">
				                    		
											  <input type="radio" name="form-CellType1" id="form-CellType1"  value="Macrophages" checked> dad<br>
											  <input type="radio" name="form-CellType1" id="form-CellType2"  value="Cardiomycytes"> Cardiomycytes<br>
											  <input type="radio" name="form-CellType1" id="form-CellType3"  value="Hepatocytes"> Hepatocytes
				                 
				                        </div>
				                        
				                        <button type="button" class="btn btn-next">Next</button>
				                    </div>
			                    </fieldset>
			                    
			                    <fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 2 / 5</h3>
		                            		<h4>Input Assay Name:</h4>
		                            		<p> A step ahead &#x1f44d;</p>
		                        		</div>
		                        		
		                            </div>
		                            <div class="form-bottom">
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-email">Assay Name</label>
				                        	<input type="text" name="form-email" placeholder="Assay..." class="form-email form-control" id="form-email">
				                        </div>
				                      
				                        <button type="button" class="btn btn-previous">Previous</button>
				                        <button type="button" class="btn btn-next">Next</button>
				                    </div>
			                    </fieldset>
			                    
			                    <fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 3 / 5</h3>
		                            		<h4> Select a Time Point:</h4>
		                            		<p> Bear with us &#x1f612;</p>
		                        		</div>
		                        		
		                            </div>
		                            <div class="form-bottom">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-facebook">Time-Point</label>
				                        	<select id="tpdrop" name="timepoints">
											  <option value="15 Min">15 Min</option>
											  <option value="30 Min">30 Min</option>
											  <option value="60 Min">60 Min</option>
											  <option value="90 Min">90 Min</option>
											</select>
				                        </div>
				                       
				                        <button type="button" class="btn btn-previous">Previous</button>
										<button type="button" class="btn btn-next">Next</button>
				                        
				                    </div>
			                    </fieldset>
								
								<fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 4 / 5</h3>
		                            		<h4>Select Phenotype & Plate Id: </h4>
		                            		<p>We are close &#x1f64c;</p>
		                        		</div>
		                        		
		                        		
		                            </div>
		                            <div class="form-bottom">
				                       <div class="form-group">
				                    		<label class="sr-only" for="form-facebook">Phenotype</label>
				                        	<select id="phetype" name="timepoints">
											  <option value="Phenotype1">Phenotype1</option>
											  <option value="Phenotype2">Phenotype2</option>
											  <option value="Phenotype3">Phenotype3</option>
											  <option value="Phenotype4">Phenotype4</option>
											</select>
				                        </div>
										<div class="form-group">
											  <label class="sr-only" for="form-facebook">Select a Plate</label>
											  <input type="radio" name="form-Plate1" id="form-Plate1"  value="Plate1" checked> Plate 1<br>
											  <input type="radio" name="form-Plate1" id="form-Plate2"  value="Plate2"> Plate 2<br>
											  <input type="radio" name="form-Plate1" id="form-Plate3"  value="Plate3"> Plate 3 <br>
											  <input type="radio" name="form-Plate1" id="form-Plate3"  value="Plate3"> Plate 4 <br>
				                        </div>
				                      
				                        <button type="button" class="btn btn-previous">Previous</button>
				                        <button type="button" class="btn btn-next">Next</button>
				                    </div>
			                    </fieldset>
								<fieldset>
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>Step 5 / 5</h3>
		                        			<h4>Upload Files: </h4>
		                            		<p>Here you are,Finally!!!</p>
		                        		</div>
		                        		
		                            </div>
		                            <div class="form-bottom">
				                       <div class="form-group">
				                    		<label class="sr-only" for="form-facebook">Upload File:</label>
				                        	<input type="file"  id="uploadfile" name="file" size="40">
				                        	<input type="hidden" name="hiddenfield" id="hideval" value="">
				                        </div>
										
										<button type="button" class="btn btn-previous">Previous</button>
				                        <button type="button" class="btn btn-submit" onclick="javascript:upload();">Upload</button>
				                        
				                    </div>
			                    </fieldset>
		                    
		                    </form>
		                    
                        </div>
                    </div>
                <!-- </div> -->
           <!--  </div> -->
            
        </div>


        <!-- Javascript -->
       	<script src="resources/js/Uploadjs.js"></script>
        <script src="resources/js/jquery-1.11.1.min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery.backstretch.min.js"></script>
        <script src="resources/js/retina-1.1.0.min.js"></script>
        <script src="resources/js/scripts.js"></script>
		
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>
=======
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Contact Us</title>

<!-- Bootstrap Core CSS -->
<link href="/CAT-APP-PROJECT/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/CAT-APP-PROJECT/resources/css/business-casual.css"
	rel="stylesheet">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="brand"
		style="width: 100% height=20px; padding: 25px; margin: 0px;">
		<img src="/CAT-APP-PROJECT/resources/images/cat-app-design.jpg"
			style="border: 1px solid #ddd; padding: 3px;" />




		<p
			style="font family: Open Sans, Arial, sans-serif; font-size: 20px; color: #FFF;">Category
			Approaches and Read-across in Regulatory Programmes (Cat-App)</p>
	</div>
	<!--
    <div class="address-bar" style="width: 100%;
    
    ">Category Approaches and Read-across in Regulatory Programmes</div>-->

	<!-- Navigation -->
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
				<a class="navbar-brand" href="index.html">Business Casual</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/CAT-APP-PROJECT/redirect?destination=home">Home</a>
					</li>
					<li><a href="/CAT-APP-PROJECT/redirect?destination=about">About</a>
					</li>
					<li><a href="/CAT-APP-PROJECT/redirect?destination=contact">Contact</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<div class="container">


		<div class="row">
			<div class="box">

				<div class="col-lg-8 col-lg-offset-2">
				
				
				<div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Ivan Rusyn
                        </div>
                        <div class="panel-body">
                            <h6>irusyn@tamu.edu</h6>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Hans Ketelslegers
                        </div>
                        <div class="panel-body">
                            <h6 style="font:wrap;">hans.ketelslegers@concawe.org</h6>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Klaus Lenz
                        </div>
                        <div class="panel-body">
                            <h6>K.Lenz@syn-com.com</h6>
                        </div>
                        
                    </div>
                </div>
                </div>
				
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
					<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
					<!-- <form name="sentMessage" id="contactForm" data-toggle="validator">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Name</label> <input type="text" class="form-control"
									placeholder="Name" id="name" required
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Email Address</label> <input type="email"
									class="form-control" placeholder="Email Address" id="email"
									required
									data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Phone Number</label> <input type="tel"
									class="form-control" placeholder="Phone Number" id="phone"
									required
									data-validation-required-message="Please enter your phone number.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label>Message</label>
								<textarea rows="5" class="form-control" placeholder="Message"
									id="message" required
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<button type="submit" class="btn btn-primary btn-lg">Send</button>
							</div>
						</div>

						<a href="#about" class="btn btn-circle page-scroll"> <i
							class="fa fa-angle-double-down animated"></i>
						</a>

					</form> -->
				</div>
			</div>

		</div>

		<!--
        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Beautiful boxes
                        <strong>to showcase your content</strong>
                    </h2>
                    <hr>
                    <p>Use as many boxes as you like, and put anything you want in them! They are great for just about anything, the sky's the limit!</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                </div>
            </div>
        </div>
        -->

	</div>
	<!-- /.container -->

	<jsp:include page="footer.jsp" />



</body>

</html>
>>>>>>> SS-Master/master
