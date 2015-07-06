<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="dialog"></div>
<div id="detaildialog" ></div>


<script>

	$(document).ready(function() {

		// Init
		
		
		initDialogBasicSave("#dialog","Ajouter un vehicule",700,500,function(id){
				
				var dataForm = $( "#formVehicule" ).serializeArray();
				
				$.ajax({
					  method: "POST",
					  url: "<spring:url value="/gestion/parcautomobile/saveVehicule" />",
					  data: dataForm,
				}).done(function( msg ) {

					if (msg == "") {
						$(id).dialog("close");
						location.reload();
					}else{
						$(id).html(msg);
					}
				});
				
		});
		
		
		
		initDialogBasic("#detaildialog","Facture du vehicule",1000,1300);
		
		
		
		
		
		
		// Tableau
	    $('#dyntable').dataTable( {
	    	  "jQueryUI": true,
	    	  "bPaginate": false,
	    	  "sScrollY" : "300",
	    	  "bInfo":false
	    } );
	    
		// Ajouter
		$("#ajouter").click(function(){
			
			openDialogBasic("#dialog","<spring:url value="/gestion/parcautomobile/vehiculeForm" />");
		});
		
		
		$(".edition").click(function(){
			var id = $(this).data("id");
			window.location.href = "<spring:url value="/gestion/parcautomobile/vehicule" />?id="+id;
		});
		
		
	} );
	
	
	

	
</script>

<div class="pageheader">

	<div class="pageicon">
		<span class="iconfa-table"></span>
	</div>
	<div class="pagetitle">
		<h5>Liste des véhicules</h5>
		<h1>Parc Automobile</h1>
	</div>

</div>

<div>
	<div class="buttonArea" >
		<input id="ajouter" type="button" value="Ajouter un vehicule">
	</div>

	<table id="dyntable" class="display"  style="width: 100%;">

		<thead>
			<tr>
				<th>Immatriculation</th>
				<th>Marque</th>
				<th>Modèle</th>
				<th>Capacité</th>
				<th>Date d'Achat</th>
		
				<th>Prix d'achat</th>
				<th>Option</th>
			</tr>
		</thead>
		
		<tbody style="text-align: right;">
			
			<c:forEach items="${listVehicules}" var="vehicule">
			<tr >
		
				<td>${vehicule.immatriculation}</td>
				<td>${vehicule.marque}</td>
				<td>${vehicule.modele}</td>
				<td>${vehicule.capacite}</td>


				<td><fmt:formatDate value="${vehicule.achat.date}"  pattern="dd/MM/yyyy" /></td>
				<td>${vehicule.achat.valeur}</td>

				
				<td style="vertical-align: bottom;">
				
					<img data-id="${vehicule.identifiant}" class="edition"  style="width: 20px;height: 20px;cursor: pointer;"  src="<c:url value="/resources/image/general/edit.png" />"  />
					<img  style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/delete.png" />" />
				</td>
			 </tr>
			</c:forEach>
		</tbody>
	</table>






</div>


