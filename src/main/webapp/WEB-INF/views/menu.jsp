<script type="text/javascript">
$(document).ready(function() {


	
	$(".nav-stacked .dropdown ul li").click(function(event){

		window.location.href = $(this).find("a").attr("href");
	});
	

});
</script>

<ul class="nav nav-tabs nav-stacked">
	<li class="nav-header">Navigation</li>
	<li class="active"><a href="dashboard.html"><span
			class="iconfa-laptop"></span> Dashboard</a></li>
	<li class="dropdown"><a href=""><span class="iconfa-th-list"></span>
			Base de donn�es</a>
		<ul style="visibility: visible;display: block;">
			<li><a href="<c:url value="/gestion/parcautomobile" />">Parc automobile</a></li>
			<li><a href="<c:url value="/gestion/portefeuilleclient" />">Portefeuille clients</a></li>
			<li><a href="<c:url value="/gestion/employe" />">Employ�s</a></li>
			<li><a href="<c:url value="/gestion/contrat" />">Contrats</a></li>
			<li><a href="<c:url value="/gestion/frais" />">Factures</a></li>
		</ul></li>


<li class="dropdown"><a href=""><span class="iconfa-th-list"></span>
			Statistiques</a>
		<ul style="visibility: visible;display: block;">
			<s:url namespace="/" action="vehicules" var="Lien1"></s:url>
			<li><a href="table-dynamic.html">Chiffre d'affaire</a></li>
			<li class="dropdown"><a href="table-dynamic.html">Tourisme</a></li>
		</ul></li>
</ul>