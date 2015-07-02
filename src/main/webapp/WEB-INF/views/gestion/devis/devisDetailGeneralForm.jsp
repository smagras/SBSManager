<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<div id="formArea">

	<form:form id="formDevis" modelAttribute="devis" method="POST" style="padding:20px;">
	
	
		
		<table style="width: 100%;">
			<form:hidden path="identifiant"/>
	
			
			<tr>
				<td class="fieldLabel">Titre</td>
				<td><form:input class="inputMAJ" cssErrorClass="errorField" path="titre" />*
			</tr>
			
			<tr>
				<td class="fieldLabel">Description</td>
				<td><form:textarea  cssErrorClass="errorField" path="description" style="width:500px;height:80px;" />
			</tr>
			

		</table>
	</form:form>
	</div>



