<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>

	$(document).ready(function() {
		
		// Tableau
	    $('#factureTable').dataTable( {
	    	  "jQueryUI": true,
	    	  "bPaginate": false,
	   
	 
	    	  "bInfo":false
	    } );
		
	});
</script>

<table id="factureTable" class="display"  style="width: 100%;">

		<thead>
			<tr>
				<th>Heure de debut</th>
				<th>Heure de fin</th>
				<th>Vehicule</th>
				<th>Nombre de passager</th>
				<th>Chauffeur</th>
				<th>Cout horraire(Euros)</th>
				<th>Options</th>
			</tr>
		</thead>

		<tbody style="text-align: right;">
			
			<tr >
				<th>12/11/2011 10:30</th>
				<th>12/11/2011 12:30</th>
				<th>Land rover</th>
				<th>12</th>
				<th>Greaux Liliane</th>
				<th>112.00</th>
				<td style="vertical-align: bottom;">
					<img  style="width: 20px;height: 20px;cursor: pointer;"  src="<c:url value="/resources/image/general/edit.png" />" />
					<img  style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/delete.png" />" />
				</td>
			 </tr>
			<tr >
				<th>12/11/2011 10:30</th>
				<th>12/11/2011 12:30</th>
				<th>Land rover</th>
				<th>12</th>
				<th>Greaux Liliane</th>
				<th>112.00</th>
				<td style="vertical-align: bottom;">
					<img  style="width: 20px;height: 20px;cursor: pointer;"  src="<c:url value="/resources/image/general/edit.png" />" />
					<img  style="width: 20px;height: 20px;cursor: pointer;" src="<c:url value="/resources/image/general/delete.png" />" />
				</td>
			 </tr>
		</tbody>
</table>