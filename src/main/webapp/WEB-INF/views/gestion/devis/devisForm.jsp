<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<script type="text/javascript" src="<c:url value="/resources/js/util.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css" />" />
</head>

<form:form id="formDevis" modelAttribute="devis" method="POST" style="padding:20px;">
	<table style="width: 100%;">
		<form:hidden path="identifiant"/>

		<tr>
			<td class="fieldLabel">Titre</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="titre" />*
		</tr>
		
		<tr>
			<td class="fieldLabel">Description</td>
			<td><form:input  cssErrorClass="errorField" path="description" />*
		</tr>
		
		<tr>
			<td class="fieldLabel">Cout horraire</td>
			<td><form:input  cssErrorClass="errorField" path="coutHorraire" />
		</tr>
		
		
	</table>
</form:form>