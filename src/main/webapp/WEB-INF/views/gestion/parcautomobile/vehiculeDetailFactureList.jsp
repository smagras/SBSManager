<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<div id="dialogFacture"></div>

<script>

	$(document).ready(function() {
		
		// Tableau
	    $('#factureTable').dataTable( {
	    	  "jQueryUI": true,
	    	  "bPaginate": false,
	   
	    	  "sScrollY" : "200",
	    	  "bInfo":false
	    } );
		
		$("#ajouterFacture").button();
		
		
		
		initDialogBasicSave("#dialogFacture","Facture",700,500,function(id){
			
			var dataForm = $( "#formFacture" ).serializeArray();
			dataForm.push({name:"idVehicule",value:"${vehicule.identifiant}"})
			
			$.ajax({
				  method: "POST",
				  url: "<spring:url value="/gestion/parcautomobile/saveFacture" />",
				  data: dataForm,
			}).done(function( msg ) {

				if (msg == "") {
					$(id).dialog("close");
					loadTabFactures();
				}else{
					$(id).html(msg);
				}
			});
			
		});

		
		// Ajouer
		$("#ajouterFacture").click(function(){
			// Init
			
			openDialogBasic("#dialogFacture","<spring:url value="/gestion/transaction/transactionForm" />");
		});
		
		

	} );
	

	
	
	
</script>



<div class="buttonArea">
	<input type="button" id="ajouterFacture" value="Ajouter une facture" />
</div>

<table id="factureTable" class="display"  style="width: 100%;">

		<thead>
			<tr>
				<th>Date</th>
				<th style="width: 40%;">Description</th>
				<th>Valeur</th>
				<th>Nombres de paiments</th>
				<th>Taux</th>
				<th>Options</th>
			</tr>
		</thead>

		<tbody style="text-align: right;">
			
			<c:forEach items="${vehicule.facturesList}" var="facture">
			<tr >
				<td><fmt:formatDate value="${facture.date}"  pattern="dd/MM/yyyy" /></td>

				<td>${facture.description}</td>
				<td><fmt:formatNumber type="currency" value="${facture.valeur}" currencySymbol="&euro;" /></td>
				<td>${facture.nombreDePaiment}</td>
				<td>${facture.taux}</td>
				
				<td style="vertical-align: bottom;">
					<img  style="width: 20px;height: 20px;cursor: pointer;"  src="<c:url value="/resources/image/general/edit.png" />" />
					<img  style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/delete.png" />" />
				</td>
			 </tr>
			</c:forEach>
		</tbody>
</table>



