<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div id="dialogFacture"></div>

<script>

	$(document).ready(function() {
		
		$("#tabs").tabs();
		
		save = function(){
			
			var dataForm = $( "#formDevis" ).serializeArray();
			
			$.ajax({
				  method: "POST",
				  url: "<spring:url value="/gestion/devis/saveDevis" />",
				  data: dataForm,
			}).done(function( msg ) {
	
				if (msg == "") {
					location.reload();
				}else{
					$("#formArea").html(msg);
				}
			});
			
		}
		
		$("#btSave").click(function(){
			save();
		});
	});
	
	
</script>



<div class="pageheader">

	<div class="pageicon">
		<span class="iconfa-table"></span>
	</div>
	<div class="pagetitle">
		<h5>Devis</h5>
		<h1>${devis.titre}</h1>
	</div>

</div>

<div class="buttonArea" >
	<input type="button" value="Sauvegarder" id="btSave">
</div>
<div id="tabs" style="height: 650px;">
  <ul>
    <li><a href="#tabs-1">Informations générales</a></li>
    <li><a href="#tabs-2">Plannifications</a></li>
    <li><a href="#tabs-3">Suivi du budget</a></li>
  </ul>
  <div id="tabs-1" >
		<jsp:include page="devisDetailGeneralForm.jsp" />
  </div>
  <div id="tabs-2">
  		<jsp:include page="devisDetailPlanificationForm.jsp" />
  </div>
  <div id="tabs-3">
  		<jsp:include page="devisDetailBudgetForm.jsp" />
  </div>
</div>




