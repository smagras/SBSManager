<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.sbsmanager.enumeration.*" %>

<%@ include file="/WEB-INF/views/init.jsp"%>


<form:form id="formFacture" modelAttribute="transaction" method="POST" style="padding:20px;">
	<table style="width: 100%;">

		<form:hidden path="identifiant"/>
		
		<tr>
			<td class="fieldLabel">Date</td>
			<td><form:input class="inDate"  path="date"  />
			<form:errors path="date" class="error"></form:errors></td>
		</tr>
		
		<tr>
			<td class="fieldLabel">Type de facture</td>
			<td>
			<form:select path="type" >
				<c:forEach items="<%=EnumTypeTransaction.values()%>" var="types">
					<option id="${types.name()}">${types.name()}</option>
				</c:forEach>
			</form:select>

		</tr>
		
		
		<tr>
			<td class="fieldLabel">Entreprise</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="entreprise" />
			<form:errors path="entreprise" class="error"></form:errors></td>
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
		
		<tr>
			<td class="fieldLabel">Taux</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="taux" />
			<form:errors path="taux" class="error"></form:errors></td>
		</tr>
		
	</table>
</form:form>