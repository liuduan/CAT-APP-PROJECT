<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Insert title here</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/Download.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
   	// alert("ready function B.");

	$("#assay_list").hide();
	// $("#Phenotypes").hide();
	$("#pheno_title").show();
	$("#file_button").show();
	
})		// end of the ready function

</script>


<sql:setDataSource var="snapshot_C" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/catapp"
    user="root"  password="vibscatapp"/>

<sql:query dataSource="${snapshot_C}" var="result_C">
	SELECT
  		entity_id, file_name, cell_line_id, assay_type, phenotype_id
	FROM
  		file_info 
	WHERE 

	<c:forEach var="element" items="${selected_phenos}" varStatus="status">
		<c:set var = "current_pheno" value = "${fn:split(element, '_')}" />	
		(cell_line_id = "${current_pheno[0]}" AND phenotype_id = "${current_pheno[2]}") OR
	</c:forEach>
	
	<c:forEach var="element" items="${selected_assay_1_pheno}" varStatus="status">
		<c:set var = "current_assay" value = "${fn:split(element, '_')}" />	
		(cell_line_id = "${current_assay[0]}" AND assay_type = "${current_assay[1]}") OR 
	</c:forEach>
	(cell_line_id = "hello");

</sql:query>


<table id = "file-table" class="table  table-bordered table-hover" 
	style="width: auto; margin:auto; text-align: center;" >
    <thead>
      <tr>
        <th></th>
        <th>File Name</th> 
        <th>Cell Line</th>       
        <th>Assay</th>
        <th>Phenotype</th>

      </tr>
    </thead>
    <tbody>
    	<c:set var="i" scope="session" value="${1}"/>
		<c:forEach var="row" items="${result_C.rows}">  
			<c:if test="${i > 6}">
   				<c:set var="i" scope="session" value="${1}"/>
			</c:if>
			<c:choose>
				<c:when test="${i == '1'}"><c:set var="tr_color" scope="application" value=""/></c:when>
				<c:when test="${i == '2'}"><c:set var="tr_color" scope="application" value="success"/></c:when>
				<c:when test="${i == '3'}"><c:set var="tr_color" scope="application" value="danger"/></c:when>
				<c:when test="${i == '4'}"><c:set var="tr_color" scope="application" value="info"/></c:when>
				<c:when test="${i == '5'}"><c:set var="tr_color" scope="application" value="warning"/></c:when>
				<c:when test="${i == '6'}"><c:set var="tr_color" scope="application" value="active"/></c:when>
    		</c:choose>
			<tr class='<c:out value="${tr_color}" />'>
				<td>
					<input type="checkbox" name ="optradio" value="${row.entity_id}">
				</td>
				<td>${row.file_name}</td>
				<td>${row.cell_line_id}</td>
				<td>${row.assay_type}</td>
				<td>${row.phenotype_id}</td>
			</tr>
			<c:set var="i" scope="session" value="${i +1}"/>
		</c:forEach> 
    </tbody>
</table>


</body>
</html>