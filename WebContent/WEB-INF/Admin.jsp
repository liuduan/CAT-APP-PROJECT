<?xml version="1.0" encoding="ISO-8859-1" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Administration</title>

	<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body style="background-color: Azure">
<jsp:directive.include file="Header.jsp" />

<div class="container">
 	<br></br>
 	
    <h1 style="text-align: center;" class = "text-danger">
    	CAT-APP Administration</h1>
    	
    <br>	    <h4 style="text-align: center;" class="text-primary">
    	For user authorization and password reset.</h4><br><br>
    
    
    
    <table class="table  table-bordered table-hover" 
    	style="width: auto; margin:auto; text-align: center;" >
    <thead>
      <tr>
        <th>Username</th>
        <th>Approval</th> 
        <th>Name</th>       
        <th>Supervisor UserID</th>
        <th>Supervisor Name</th>
        <th>Institution</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Test-ID-1</td>
        <td>Yes</td>
        <td>John Williams</td>
        <td>Supervisor-1</td>
        <td>Super Name</td>
        <td>Texas A&M University </td>
        <td><button type="button" class="btn btn-primary users">Manage</button></td>
      </tr>      
      <tr class="success">
      	<td>Test-ID-2</td>
      	<td>Yes</td>
        <td>Isabella Jones</td>
        <td>Supervisor-1</td>
        <td>Super Name</td>
        <td>Texas A&M University </td>
        <td><button type="button" class="btn btn-primary users">Manage</button></td>
      </tr>
      <tr class="danger">
      	<td>Supervisor-1</td>
      	<td>Yes</td>
        <td>Super Name</td>
        <td>Supervisor-1</td>
        <td>Super Name</td>
        <td>Texas A&M University </td>
        <td><button type="button" class="btn btn-primary users">Manage</button></td>
      </tr>
      <tr class="info">
      	<td>Test-ID-3</td>
      	<td>Yes</td>
        <td>Divaid Wilson</td>
        <td>Supervisor-2</td>
        <td>Super Name2</td>
        <td>Public Health England </td>
        <td><button type="button" class="btn btn-primary users">Manage</button></td>
      </tr>
      <tr class="warning">
      	<td>Test-ID-4</td>
      	<td>No</td>
        <td>Emily White</td>
        <td>Supervisor-2</td>
        <td>Super Name2</td>
        <td>Public Health England </td>
        <td><button type="button" class="btn btn-primary users">Manage</button></td>
      </tr>
      <tr class="active">
      	<td>Supervisor-2</td>
      	<td>Yes</td>
        <td>Super Name 2</td>
        <td>Supervisor-2</td>
        <td>Super Name 2</td>
        <td>Public Health England  </td>
        <td><button type="button" class="btn btn-primary users" >Manage</button></td>
      </tr>
       <tr>
      	<td>Admin</td>
      	<td>Yes</td>
        <td>Robert Lopez</td>
        <td>Admin</td>
        <td>Admin Name</td>
        <td>Texas A&M University </td>
        <td><button type="button" class="btn btn-primary users">Manage</button></td>
      </tr>      
    </tbody>
  </table>
    
    <br></br><br></br>
</div>

<div style="display: none;">
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
    	<form action="http://localhost:8080/CAT-APP-PROJECT/Admin">
    		<b>Username: </b>Test-ID-4</b><p></p>
    		<b>Name: Emily White</b><p></p>
    		<div class="checkbox">
  				<label><input type="checkbox" value=""><b>Authorization</b></label>
			</div>
    		<div class="checkbox">
  				<label><input type="checkbox" value=""><b>Change Password</b></label>
			</div>
    		<b>New Password: </b><input></input> 
    		<b>&nbsp; &nbsp; Repeat Password: </b><input></input><p></p>
    		
    		<b>Phone Number: </b>1-234-567-8901<p></p>
    		<b>E-mail address: </b>Emily.White@Public.Health.England.org<p></p>
    		<b>Supervisor Username: </b>Supervisor-2	<p></p>
    		<b>Supervisor Name: </b>Super Name2	<p></p>
    		<b>Supervisor Phone number: </b>1-234-567-8902<p></p>
    		<b>Supervisor Email: </b>Super.Name2@Public.Health.England.org<p></p>
    		<p style="margin:auto; text-align:center">
    			<input type="submit" class="btn btn-primary" value ="Save"></input>
    			<input type="submit" class="btn btn-danger" value ="Cancel"></input></p>
    	</form>
    </div>
</div>
</div> <!-- end of display none -->

<script>

$(".users").click(function(){
    // alert("The paragraph was clicked.");
    nWin();
});




function nWin() {
	  var New_Window = window.open();
	  var New_html = $("#New_Window_content").html();

	    $(New_Window.document.body).html(New_html);
	}

</script>


</body>
</html>