<script type="text/javascript">
$(document).ready(function() {

	$(".dropdown ul").show();

	
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
			Base de données</a>
		<ul>
			<li><a href="<c:url value="/gestion/parcautomobile" />">Parc automobile</a></li>
			<li><a href="<c:url value="/gestion/portefeuilleclient" />">Portefeuille clients</a></li>
			<li><a href="<c:url value="/gestion/employee" />">Employées</a></li>
			<li><a href="<c:url value="/gestion/contrat" />">Contrats</a></li>
			<li><a href="<c:url value="/gestion/frais" />">Factures</a></li>
		</ul></li>


<li class="dropdown"><a href=""><span class="iconfa-th-list"></span>
			Statistiques</a>
		<ul>
			<s:url namespace="/" action="vehicules" var="Lien1"></s:url>
			<li><a href="table-dynamic.html">Chiffre d'affaire</a></li>
			<li class="dropdown"><a href="table-dynamic.html">Tourisme</a></li>
		</ul></li>
</ul>