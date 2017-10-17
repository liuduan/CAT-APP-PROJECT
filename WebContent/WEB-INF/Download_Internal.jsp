<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>






<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/Download.js"></script>
<style type="text/css">
#page-wrapper {
	/* background: RGBA(24, 161, 196, 0.2); */
	background: url('${pageContext.request.contextPath}/resources/images/bgLight.jpg') repeat
		center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}
</style>
</head>
<body onload="myFunction()" 
	background="${pageContext.request.contextPath}/resources/images/Catapp_logo_full-blur.svg"
	style="background-size:250%">
	
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/catapp"
    user="root"  password="vibscatapp"/>

	<sql:setDataSource var="snapshot_C" 
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/CATAPP?autoReconnect=true&useSSL=false" user="root" password="ashima" />

<script>
$(document).ready(function(){

    var selected_cell_lines;
    // alert("still ready function.");
    <c:forEach var="element" items="${selected_cell_lines}" varStatus="status">
    	// alert("element (cell line): " + "${element}");
    	<sql:query dataSource="${snapshot}" var="result">
    		select distinct assay_type from file_info where cell_line_id = "${element}"; 

    	</sql:query>
    	<c:forEach var="row" items="${result.rows}">  
    		// alert("assay: ${element}_${row.assay_type}");
			$("#${element}_${row.assay_type}").removeAttr("disabled");

    		$("#${element}_${row.assay_type}_B").css({'color': 'DarkCyan ', 'font-size': '105%', 'font-weight': 'bold' });
    	</c:forEach> 
<<<<<<< HEAD

    	$("#${element}_assays").show();
=======
    	
>>>>>>> SS-Master/master
   	</c:forEach>
});


</script>





	<h4 id="assay_head"
		style="color: Blue; display: none; margin-left:0px;">
		<a href="#" id="assay_title" onclick="click_assay_title()"><b>Please
					select assays:</b></a> <a href="#" id="assay_button"
			onclick="click_assay_button()" style="display: none;">
			<button type="button" class="btn btn-xs btn-primary">
				Next <span class="fa fa-chevron-right"></span>
			</button>
		</a>
	</h4>

	<div id="assay_list" style="display: none; margin-left: 40px;">
		<!-- "_" is used to seperate cell line tags and phenotype tags -->
		
		<c:forEach var="element" items="${assaydata}"
			varStatus="status">
			
		<div id="${element.key}_assays" class="all_assays"
				 color: Gray; margin-left: 20px;">
			<span style="color: black; font-weight: bold;"><c:out value="${element.key}"/> assay:
			</span><br> 
			<c:forEach var="assays" items="${element.value}">
			
			<input type="checkbox" disabled
				class="all_assays" id=<c:out value="${element.key}"/>_<c:out value="${assays.key}"/>
				 name=<c:out value="${element.key}"/>_<c:out value="${assays.key}"/> value=<c:out value="${element.key}"/>_<c:out value="${assays.key}"/>>
			<span id=<c:out value="${element.key}"/>_<c:out value="${assays.key}_B"/> ><c:out value="${assays.value}"/><br></span>
			
			</c:forEach>
		</div>
		<br>
		</c:forEach>

	</div>
	<!-- end of div for assays. -->

</body>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<!-- JQUERY SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Download.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/catAppDown.js"></script>
<!-- <script src="${pageContext.request.contextPath}/resources/js/easyPaginate.js"></script> -->
<script type="text/plain"
	src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>



<script src="${pageContext.request.contextPath}/resources/js/metisMenu.min.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.js"></script>

</html>