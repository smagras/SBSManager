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
	   
	 
	    	  "bInfo":false
	    } );
		
		$("#ajouterFacture").button();
		
		
		
		initDialogBasicSave("#dialogFacture","Fiche de payes",700,500,function(id){
			
			var dataForm = $( "#formFacture" ).serializeArray();
			dataForm.push({name:"idEmploye",value:"${employe.identifiant}"})
			
			$.ajax({
				  method: "POST",
				  url: "<spring:url value="/gestion/employe/saveSalaire" />",
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

		
		// Ajouer
		$("#ajouterFacture").click(function(){
			// Init
			
			openDialogBasic("#dialogFacture","<spring:url value="/gestion/transaction/transactionForm" />");
		});

	} );
	

	
	
	
</script>

<script type="text/javascript">
$(function () {
	var chart = new CanvasJS.Chart("chartContainer",
			{

				title:{
					text: "Salaires au cours du temps",
					fontSize: 20
				},
	                        animationEnabled: true,
				axisX:{

					gridColor: "Silver",
					tickColor: "silver",
					valueFormatString: "DD/MM/YYYY"

				},                        
                toolTip:{
                  shared:true
                },
	
				legend:{
					verticalAlign: "center",
					horizontalAlign: "right"
				},
				data: [
				{        
					type: "column",
					showInLegend: true,
					lineThickness: 2,
					name: "Facture",
					markerType: "square",
					color: "#F08080",
					dataPoints: [
					<c:forEach items="${employe.salaire}" var="salaire" varStatus="ind">
						
						{ x: new Date("<fmt:formatDate value="${salaire.date}"  pattern="MM/dd/yyyy" />"), y: ${salaire.valeur} },
						
					</c:forEach>
					]
				},
	

				
				],
	          legend:{
	            cursor:"pointer",
	            itemclick:function(e){
	              if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
	              	e.dataSeries.visible = false;
	              }
	              else{
	                e.dataSeries.visible = true;
	              }
	              chart.render();
	            }
	          }
			});

	chart.render();

});
</script>

<div class="pageheader">

	<div class="pageicon">
		<span class="iconfa-table"></span>
	</div>
	<div class="pagetitle">
		<h5>Salaires des employés</h5>
		<h1>${employe.nom} ${employe.prenom}</h1>
	</div>

</div>

<div id="chartContainer" style="height: 300px; width: 100%;"></div>

<br>

<br>

<div  style="width: 50%;margin: auto;">
<div align="right">
	<input type="button" id="ajouterFacture" value="Ajouter un salaire" />
	<br><br>
</div>
<table id="factureTable" class="display"  style="width: 100%;">

		<thead>
			<tr>
				<th>Date</th>
				<th>Prix</th>
				<th>Options</th>
			</tr>
		</thead>

		<tbody style="text-align: right;">
			
			<c:forEach items="${employe.salaire}" var="salaire">
			<tr >
				<td><fmt:formatDate value="${salaire.date}"  pattern="dd/MM/yyyy" /></td>

				<td>${salaire.valeur}</td>
				
				<td style="vertical-align: bottom;">
					<img  style="width: 20px;height: 20px;cursor: pointer;"  src="<c:url value="/resources/image/general/edit.png" />" />
					<img  style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/delete.png" />" />
				</td>
			 </tr>
			</c:forEach>
		</tbody>
</table>
</div>