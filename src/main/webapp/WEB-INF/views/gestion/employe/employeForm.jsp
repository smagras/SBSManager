<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<script type="text/javascript" src="<c:url value="/resources/js/util.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css" />" />
</head>

<form:form id="formEmploye" modelAttribute="employe" method="POST" style="padding:20px;">
	<table style="width: 100%;">
		<form:hidden path="identifiant"/>

		<tr>
			<td class="fieldLabel">Nom</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="nom" />*
		</tr>
		
		<tr>
			<td class="fieldLabel">Prenom</td>
			<td><form:input  cssErrorClass="errorField" path="prenom" />*
		</tr>
		<tr>
			<td class="fieldLabel">Adresse</td>
			<td><form:input  cssErrorClass="errorField" path="adresse" />
		</tr>
		<tr>
			<td class="fieldLabel">Telephone</td>
			<td><form:input  cssErrorClass="errorField" path="telephone" />
		</tr>
		<tr>
			<td class="fieldLabel">Email</td>
			<td><form:input  cssErrorClass="errorField" path="email" />
		</tr>
		<tr>
			<td class="fieldLabel">Compte Banquaire</td>
			<td><form:input  cssErrorClass="errorField" path="compteBancaire" />
		</tr>
		
		
	</table>
</form:form>