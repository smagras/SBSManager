<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<script>

	$(document).ready(function() {
		
		$("#tabs").tabs();
		
		
		$("#ongl-factures").click(function(){	
			loadTabFactures();
		});
		
		$("#ongl-general").click(function(){	
			loadTabGeneral();
		});
		
		
		loadTabFactures = function(){
			$.ajax({
				method: "POST",
				url: "<spring:url value="/gestion/parcautomobile/vehiculefactureslist" />?id=${vehicule.identifiant}"
			}).done(function( msg ) {
				$("#tab-factures").html(msg);
			});
		}
		
		loadTabGeneral = function(){
			$.ajax({
				method: "POST",
				url: "<spring:url value="/gestion/parcautomobile/vehiculegeneralform" />?id=${vehicule.identifiant}"
			}).done(function( msg ) {
				$("#tab-general").html(msg);
			});
		}
		
		loadTabGeneral();

	} );
	

	
	
	
</script>


<div class="pageheader">

	<div class="pageicon">
		<span class="iconfa-table"></span>
	</div>
	<div class="pagetitle">
		<h5>Détailles véhicule</h5>
		<h1>${vehicule.marque}, ${vehicule.modele} (${vehicule.immatriculation})</h1>
	</div>

</div>

<div id="tabs" style="height: 650px;">
  <ul>
    <li><a id="ongl-general" href="#tab-general">Informations générales</a></li>
    <li><a id="ongl-achat" href="#tab-factures">Achat et Financements</a></li>
    <li><a id="ongl-assurances" href="#tab-factures">Assurances</a></li>
    <li><a id="ongl-factures" href="#tab-factures">Factures du vehicule</a></li>
    <li><a href="#tabs-3">Fiches analytiques</a></li>
  </ul>
  <div id="tab-general" >
  </div>
  <div id="tab-factures" >

	<div class="buttonArea">
		<input type="button" id="ajouterFacture" value="Ajouter une facture" />
	</div>

	<table id="factureTable" class="display"  style="width: 100%;">
	
			<thead>
				<tr>
					<th>Date</th>

					<th>Description</th>
					<th>Valeur</th>
					<th>Nombres de paiments</th>
					<th>Options</th>
				</tr>
			</thead>
	
			<tbody style="text-align: right;">
				
				<c:forEach items="${vehicule.facturesList}" var="facture">
				<tr >
					<td><fmt:formatDate value="${facture.date}"  pattern="dd/MM/yyyy" /></td>
					
	
					<td>${facture.description}</td>
					<td>${facture.valeur}</td>
					<td>${facture.nombreDePaiment}</td>
					
					<td style="vertical-align: bottom;">
						<img  style="width: 20px;height: 20px;cursor: pointer;"  src="<c:url value="/resources/image/general/edit.png" />" />
						<img  style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/delete.png" />" />
					</td>
				 </tr>
				</c:forEach>
			</tbody>
	</table>

  </div>
  <div id="tabs-2">
  
  </div>
  <div id="tabs-3">

  </div>
</div>


