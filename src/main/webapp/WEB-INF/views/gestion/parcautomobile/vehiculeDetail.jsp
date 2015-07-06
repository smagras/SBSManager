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
		
		$("#ongl-achat").click(function(){	
			loadTabAchat();
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
		
		loadTabAchat = function(){
			$.ajax({
				method: "POST",
				url: "<spring:url value="/gestion/parcautomobile/vehiculedetailachatform" />?id=${vehicule.identifiant}"
			}).done(function( msg ) {
				$("#tab-achat").html(msg);
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
    <li><a style="width: 155px;text-align: center;" id="ongl-general" href="#tab-general">Informations générales</a></li>
    <li><a style="width: 155px;text-align: center;" id="ongl-achat" href="#tab-achat">Achat</a></li>
    <li><a style="width: 155px;text-align: center;" id="ongl-achat" href="#tab-financements">Financements</a></li>
    <li><a style="width: 155px;text-align: center;" id="ongl-assurances" href="#tab-assurances">Assurances</a></li>
    <li><a style="width: 155px;text-align: center;" id="ongl-factures" href="#tab-factures">Factures</a></li>
    <li><a style="width: 155px;text-align: center;" href="#tabs-3">Fiches analytiques</a></li>
  </ul>
  <div id="tab-general" ></div>
  <div id="tab-factures" ></div>
  <div id="tab-achat"></div>
  <div id="tab-assurances"></div>
  <div id="tab-financements"></div>
</div>


