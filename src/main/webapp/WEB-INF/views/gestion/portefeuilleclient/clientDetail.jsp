<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<script>

	$(document).ready(function() {
		
		$("#tabs").tabs();
		
		$("#ongl-general").click(function(){	
			loadTabGeneral();
		});
		
		loadTabGeneral = function(){
			$.ajax({
				method: "POST",
				url: "<spring:url value="/gestion/portefeuilleclient/clientgeneralform" />?id=${client.identifiant}"
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
		<h5>Détails client</h5>
		<h1>${client.nom}, ${client.prenom}</h1>
	</div>

</div>


<div id="tabs" style="height: 650px;">

  <ul>
    <li><a id="ongl-general" href="#tab-general">Informations générales</a></li>
  </ul>
  
  <div id="tab-general">
  </div>
  
</div>


