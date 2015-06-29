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
	   
	    	
	    	  "bInfo":false
	    } );
	
		
	
	
		initDialogBasicSave("#dialog","Employe",700,500,function(id){
			
			var dataForm = $( "#formEmploye" ).serializeArray();
			
			$.ajax({
				  method: "POST",
				  url: "<spring:url value="/gestion/employe/saveEmploye" />",
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
			
			openDialogBasic("#dialog","<spring:url value="/gestion/employe/employeForm" />");
		});
		
		$(".detail").click(function(){
			var id = $(this).data("id");
			window.location.href = "<spring:url value="/gestion/employe/salaire" />?id="+id;
		});
		
		$(".edition").click(function(){
			var id = $(this).data("id");
			openDialogBasic("#dialog","<spring:url value="/gestion/employe/employeForm" />?id="+id);
		});
		
		$(".supression").click(function(){
			var id = $(this).data("id");
			var conf = confirm("Etes vous sûre de vouloir supprimer?") ;
			if (conf == true){	
				$.ajax({
					  method: "POST",
					  url: "<spring:url value="/gestion/employe/removeEmploye" />?id="+id,
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
		<h5>Liste des employés</h5>
		<h1>Ressources humaines</h1>
	</div>

</div>
<br>
<div>

	<input id="ajouter" type="button" value="Ajouter un employe">
	<br><br>
	<table id="dyntable" class="display"  style="width: 100%;">

		<thead>
			<tr>
				<th>Nom</th>
				<th>Prenom</th>
				<th>Adresse</th>
				<th>Telephone</th>
				<th>Email</th>
				<th>Compte Bancaire</th>
				<th>Option</th>
			</tr>
		</thead>
		
		<tbody style="text-align: right;">
			
			<c:forEach items="${listEmployes}" var="employe">
			<tr >
		
				<td>${employe.nom}</td>
				<td>${employe.prenom}</td>
				<td>${employe.adresse}</td>
				<td>${employe.telephone}</td>
				<td>${employe.email}</td>
				<td>${employe.compteBancaire}</td>
				
				<td style="vertical-align: bottom;">
					<img data-id="${employe.identifiant}" class="detail"   style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/transaction.png" />" />
					<img data-id="${employe.identifiant}" class="edition"  style="width: 20px;height: 20px;cursor: pointer;"  src="<c:url value="/resources/image/general/edit.png" />"  />
					<img data-id="${employe.identifiant}" class="supression" style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/delete.png" />" />
				</td>
			 </tr>
			</c:forEach>
		</tbody>
	</table>






</div>


