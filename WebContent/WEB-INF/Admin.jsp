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
    	For user authorization and password reset.</h4></br><br>
    
    
    
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
        <td><button type="button" class="btn btn-primary">Manage</button></td>
      </tr>      
      <tr class="success">
      	<td>Test-ID-2</td>
      	<td>Yes</td>
        <td>Isabella Jones</td>
        <td>Supervisor-1</td>
        <td>Super Name</td>
        <td>Texas A&M University </td>
        <td><button type="button" class="btn btn-primary">Manage</button></td>
      </tr>
      <tr class="danger">
      	<td>Supervisor-1</td>
      	<td>Yes</td>
        <td>Super Name</td>
        <td>Supervisor-1</td>
        <td>Super Name</td>
        <td>Texas A&M University </td>
        <td><button type="button" class="btn btn-primary">Manage</button></td>
      </tr>
      <tr class="info">
      	<td>Test-ID-3</td>
      	<td>Yes</td>
        <td>Divaid Wilson</td>
        <td>Supervisor-2</td>
        <td>Super Name2</td>
        <td>Public Health England </td>
        <td><button type="button" class="btn btn-primary">Manage</button></td>
      </tr>
      <tr class="warning">
      	<td>Test-ID-4</td>
      	<td>No</td>
        <td>Emily White</td>
        <td>Supervisor-2</td>
        <td>Super Name2</td>
        <td>Public Health England </td>
        <td><button type="button" class="btn btn-primary">Manage</button></td>
      </tr>
      <tr class="active">
      	<td>Supervisor-2</td>
      	<td>Yes</td>
        <td>Super Name 2</td>
        <td>Supervisor-2</td>
        <td>Super Name 2</td>
        <td>Public Health England  </td>
        <td><button type="button" class="btn btn-primary">Manage</button></td>
      </tr>
       <tr>
      	<td>Admin</td>
      	<td>Yes</td>
        <td>Robert Lopez</td>
        <td>Admin</td>
        <td>Admin Name</td>
        <td>Texas A&M University </td>
        <td><button type="button" class="btn btn-primary">Manage</button></td>
      </tr>      
    </tbody>
  </table>
    
    <br></br><br></br>
</div>

<script>

$(".btn").click(function(){
    alert("The paragraph was clicked.");
});

function normalImg(x) {
	$(".cas64741-43-1").css("font-size","20px");
	$(".cas64741-43-1").css("background-color","white");
    // x.style.width = "232px";
}
    

// alert("here");
$(".cas64741-43-1").hover(function(e) {
	// alert("here");
    $("#foo").css({
        left: e.pageX + 1,
        top: e.pageY + 1
        }).stop().show(100);},
 		// alert("here 2");}, 
     function() {$("#foo").hide(100);}
     );	// end of hover    
</script>


</body>
</html>