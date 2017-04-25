<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<Papaya>
Column 3<br>
chemical: ${chemical}<br>
endpoint: ${endpoint}<br>


<c:choose>
    <c:when test="${endpoint == '1'}">
    	1
       <c:set var="endpoint_string" scope="session" value="Peak_freq_90min" />
    </c:when>
    <c:when test="${endpoint == '2'}">
    	2
       <c:set var="endpoint_string" scope="session" value="Peak_freq_24hr" />
    </c:when>
    <c:when test="${endpoint == '3'}">
    	 3
       <c:set var="endpoint_string" scope="session" value="HUVEC_total_cell" />
    </c:when>
    <c:when test="${endpoint == '4'}">
    	 4
       <c:set var="endpoint_string" scope="session" value="HUVEC_tube_area" />
    </c:when>
</c:choose>
<br>
endpoint_string: ${endpoint_string}<br>

<img src="${pageContext.request.contextPath}/resources/R-images/${endpoint_string}${chemical}.png">
</Papaya>