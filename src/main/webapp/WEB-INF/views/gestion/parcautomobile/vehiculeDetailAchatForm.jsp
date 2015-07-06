<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/init.jsp"%>

<script>
	
	$(document).ready(function() {
			
		$("#saveAchat").click(function(){
			var dataForm = $( "#formVehiculeAchat" ).serializeArray();
			dataForm.push({name:"idVehicule",value:"${vehicule.identifiant}"})
			
			$.ajax({
				  method: "POST",
				  url: "<spring:url value="/gestion/parcautomobile/saveVehiculeAchat" />",
				  data: dataForm,
			}).done(function( msg ) {
				console.log(msg);
				if (msg == "") {
					loadTabAchat();
				}else{
					$("#tab-achat").html(msg);
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
	<input type="button" id="saveAchat" value="Sauvegarder" />
</div>


<form:form id="formVehiculeAchat" modelAttribute="vehicule" method="POST" style="padding:20px;">
	<table style="width: 100%;">
		<form:hidden path="identifiant"/>
		
		<form:hidden class="inputMAJ" cssErrorClass="errorField" path="immatriculation" />
		<form:hidden class="inputMAJ" cssErrorClass="errorField" path="marque" />
		<form:hidden cssErrorClass="errorField" path="modele" />
		<form:hidden cssErrorClass="errorField" path="capacite"  />
		

		<tr>
			<td class="fieldLabel">Date d'achat</td>
			<td><form:input class="inDate" path="achat.date" /></td>
		</tr>
		
		<tr>
			<td class="fieldLabel">Prix d'achat</td>
			<td><form:input style="text-align:right;" path="achat.valeur" />  Euros</td>
		</tr>
		
		<tr>
			<td class="fieldLabel">Taux de l'achat</td>
			<td><form:input  style="text-align:right;" path="achat.taux" /> %</td>
		</tr>

		<tr>
			<td class="fieldLabel">Nombre de paiments</td>
			<td><form:input  style="text-align:right;" path="achat.nombreDePaiment" /></td>
		</tr>
	
		
		
	</table>
</form:form>