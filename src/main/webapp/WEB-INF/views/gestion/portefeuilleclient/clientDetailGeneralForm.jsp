<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
	
	$(document).ready(function() {
		
		$("#save").button();
		
		$("#save").click(function(){
			var dataForm = $( "#formClientGeneral" ).serializeArray();
			dataForm.push({name:"idClient",value:"${client.identifiant}"})
			
			$.ajax({
				  method: "POST",
				  url: "<spring:url value="/gestion/portefeuilleclient/saveClient" />",
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


<form:form id="formClientGeneral" modelAttribute="client" method="POST" style="padding:20px;">
	<table style="width: 100%;">
		<form:hidden path="identifiant"/>

		<tr>
			<td class="fieldLabel">Nom</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="nom" />
			<form:errors path="nom" class="error"></form:errors></td>
		</tr>
		
		<tr>
			<td class="fieldLabel">Prenom</td>
			<td><form:input class="inputMAJ" cssErrorClass="errorField" path="prenom" />
			<form:errors path="prenom" class="error"></form:errors></td>
		</tr>

		<tr>
			<td class="fieldLabel">Adresse</td>
			<td><form:input cssErrorClass="errorField" path="adresse" />
			<form:errors path="adresse" class="error"></form:errors></td>
		</tr>

		<tr>
			<td class="fieldLabel">Telephone</td>
			<td><form:input cssErrorClass="errorField" path="telephone"  />
			<form:errors path="telephone" class="error"></form:errors></td>
		</tr>
		
		<tr>
			<td class="fieldLabel" >Email</td>
			<td><form:input cssErrorClass="errorField"  path="email" />
			<form:errors path="email" class="error"></form:errors></td>
		</tr>

		
		
	</table>
</form:form>