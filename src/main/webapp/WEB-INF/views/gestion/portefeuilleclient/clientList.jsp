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
		
		initDialogBasicSave("#dialog","Ajouter un client",700,500,function(id){
				
				var dataForm = $( "#formClient" ).serializeArray();
				
				$.ajax({
					  method: "POST",
					  url: "<spring:url value="/gestion/portefeuilleclient/saveClient" />",
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
	    $('#table').dataTable( {
	    	  "jQueryUI": true,
	    	  "bPaginate": false,
	   
	    	  "sScrollY" : "200",
	    	  "bInfo":false
	    } );
	
		
	 	// Ajouter
		$("#ajouter").click(function(){
			
			openDialogBasic("#dialog","<spring:url value="/gestion/portefeuilleclient/clientForm" />");
		});
		
	} );
	

	
</script>

<div class="pageheader">

	<div class="pageicon">
		<span class="iconfa-table"></span>
	</div>
	<div class="pagetitle">
		<h5>Liste des clients</h5>
		<h1>Portefeuille Client</h1>
	</div>

</div>

<div>
	<div class="buttonArea" >
		<input id="ajouter" type="button" value="Ajouter un client">
	</div>
	<table id="table" class="display"  style="width: 100%;">

		<thead>
			<tr>
				<th>Nom</th>
				<th>Prenom</th>
				<th>Adresse</th>
				<th>Telephone</th>
				<th>Email</th>
				<th>Option</th>
			</tr>
		</thead>
		
		<tbody style="text-align: right;">
			
			<c:forEach items="${clientList}" var="client">
			<tr >
		
				<td>${client.nom}</td>
				<td>${client.prenom}</td>
				<td>${client.adresse}</td>
				<td>${client.telephone}</td>
				<td>${client.email}</td>

				
				<td style="vertical-align: bottom;">
					<img data-id="${vehicule.identifiant}" class="facture"   style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/transaction.png" />" />
					<img data-id="${vehicule.identifiant}" class="edition"  style="width: 20px;height: 20px;cursor: pointer;"  src="<c:url value="/resources/image/general/edit.png" />"  />
					<img  style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/delete.png" />" />
				</td>
			 </tr>
			</c:forEach>
		</tbody>
	</table>






</div>


