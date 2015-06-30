<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<form:form id="formFacture" modelAttribute="transaction" method="POST" style="padding:20px;">
	<table style="width: 100%;">

		<form:hidden path="identifiant"/>
		
		<tr>
			<td class="fieldLabel">Date</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="date" />
			<form:errors path="date" class="error"></form:errors></td>
		</tr>
		
		
		<tr>
			<td class="fieldLabel">Descrition</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="description" />
			<form:errors path="description" class="error"></form:errors></td>
		</tr>
		
		<tr>
			<td class="fieldLabel">Valeur</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="valeur" />
			<form:errors path="valeur" class="error"></form:errors></td>
		</tr>

		<tr>
			<td class="fieldLabel">Nombre de paiments</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="nombreDePaiment" />
			<form:errors path="nombreDePaiment" class="error"></form:errors></td>
		</tr>
		
	</table>
</form:form>