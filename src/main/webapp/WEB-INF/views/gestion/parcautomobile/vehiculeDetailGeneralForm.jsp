<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/init.jsp"%>

<script>
	
	$(document).ready(function() {
		
		$("#save").button();
		
		$("#save").click(function(){
			var dataForm = $( "#formVehiculeGeneral" ).serializeArray();
			dataForm.push({name:"idVehicule",value:"${vehicule.identifiant}"})
			
			$.ajax({
				  method: "POST",
				  url: "<spring:url value="/gestion/parcautomobile/saveVehicule" />",
				  data: dataForm,
			}).done(function( msg ) {
			
				if (msg == "") {
					loadTabGeneral();
				}else{
					$("#tab-general").html(msg);
				}
			});
		});
	
	});

</script>

<head>
<script type="text/javascript" src="<c:url value="/resources/js/util.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css" />" />
</head>

<div class="buttonArea">
	<input type="button" id="save" value="Sauvegarder" />
</div>


<form:form id="formVehiculeGeneral" modelAttribute="vehicule" method="POST" style="padding:20px;">
	<table style="width: 100%;">
		<form:hidden path="identifiant"/>

		<tr>
			<td class="fieldLabel">Immatriculation</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="immatriculation" />
			<form:errors path="immatriculation" class="error"></form:errors></td>
		</tr>
		
		<tr>
			<td class="fieldLabel">Marque</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="marque" />
			<form:errors path="marque" class="error"></form:errors></td>
		</tr>

		<tr>
			<td class="fieldLabel">Modèle</td>
			<td><form:input cssErrorClass="errorField" path="modele" />
			<form:errors path="modele" class="error"></form:errors></td>
		</tr>

		<tr>
			<td class="fieldLabel">Capacité</td>
			<td><form:input cssErrorClass="errorField" path="capacite"  />
			<form:errors path="capacite" class="error"></form:errors></td>
		</tr>
		

		<tr >
			<td class="fieldLabel" style="padding-top: 5px;">Dernier controle technique :</td>
			<td><fmt:formatDate value="${dernierControle}"  pattern="dd/MM/yyyy" /></td>
		</tr>
		

		
		
	</table>
</form:form>