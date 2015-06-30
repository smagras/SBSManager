<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SBS Manager</title>


<%@ include file="/WEB-INF/views/includes.jsp"%>


<title><sitemesh:write property='title'/></title>
<sitemesh:write property='head'/>

</head>

<body>
<div class="mainwrapper">


		<div class="leftpanel">

			<div class="leftmenu">
				
				
				
				<%@ include file="/WEB-INF/views/menu.jsp"%>

				
			</div>
			<!--leftmenu-->

		</div>
		<!-- leftpanel -->

		<div class="rightpanel">



			
			<!--pageheader-->





			<div class="maincontent">
				<div class="maincontentinner">


	<sitemesh:write property='body'/>

					<!--maincontentinner-->
				</div>
				<!--maincontent-->

			</div>
			<!--rightpanel-->

		</div>
		<!--mainwrapper-->
		

  
		<script type="text/javascript">

		  
		$(document)
		.ready(function() {
			$('#btnForm').click(function(e) {
				
				e.preventDefault();

				$('#mydialog').dialog('open');
	
			});
		
		});
		

		</script>	



</body>







</html>
