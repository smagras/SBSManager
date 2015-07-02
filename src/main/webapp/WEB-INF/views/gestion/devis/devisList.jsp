<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="dialog"></div>


<script>

	$(document).ready(function() {
		// Tableau
	    $('#dyntable').dataTable( {
	    	  "jQueryUI": true,
	    	  "bPaginate": false,
	   
	    	  "sScrollY" : "300",
	    	  "bInfo":false
	    } );
	
		
	
	
		initDialogBasicSave("#dialog","Devis",700,500,function(id){
			
			var dataForm = $( "#formDevis" ).serializeArray();
			
			$.ajax({
				  method: "POST",
				  url: "<spring:url value="/gestion/devis/saveDevis" />",
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
	
		// Ajouter
		$("#ajouter").click(function(){
			
			openDialogBasic("#dialog","<spring:url value="/gestion/devis/devisForm" />");
		});
		
		
		$(".edition").click(function(){
			var id = $(this).data("id");
			window.location.href = "<spring:url value="/gestion/devis/detail" />?id="+id;
		});
		
		$(".supression").click(function(){
			var id = $(this).data("id");
			var conf = confirm("Etes vous sûre de vouloir supprimer?") ;
			if (conf == true){	
				$.ajax({
					  method: "POST",
					  url: "<spring:url value="/gestion/devis/removeDevis" />?id="+id,
				}).done(function( msg ) {
					location.reload();
				});
			}
		});

	
	} );

	
</script>

<div class="pageheader">

	<div class="pageicon">
		<span class="iconfa-table"></span>
	</div>
	<div class="pagetitle">
		<h5>Liste des devis/contrats</h5>
		<h1>Quotations de services</h1>
	</div>

</div>

<div>
	<div class="buttonArea" >
		<input id="ajouter" type="button" value="Ajouter un devis">
	</div>
	<table id="dyntable" class="display"  style="width: 100%;">

		<thead>
			<tr>
				<th>Titre</th>
				<th>Description</th>
				<th>Client</th>
				<th>Statut</th>
	
				<th>Option</th>
			</tr>
		</thead>
		
		<tbody style="text-align: right;">
			
			<c:forEach items="${listDevis}" var="devis">
			<tr >
		
				<td>${devis.titre}</td>
				<td>${devis.description}</td>
				<td>${devis.client.nom} ${devis.client.prenom}</td>
				<td>${devis.statut}</td>

				
				<td style="vertical-align: bottom;">
					<img data-id="${devis.identifiant}" class="edition"  style="width: 20px;height: 20px;cursor: pointer;"  src="<c:url value="/resources/image/general/edit.png" />"  />
					<img data-id="${devis.identifiant}" class="supression" style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/delete.png" />" />
				</td>
			 </tr>
			</c:forEach>
		</tbody>
	</table>






</div>


