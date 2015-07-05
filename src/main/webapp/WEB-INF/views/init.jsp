<style>
.inDate:read-only{
	background-color: rgb(255,255,255);
	cursor: auto;
}
.ui-datepicker-trigger{
	margin-left: 5px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$("input:button").button();
	$(".inDate").datepicker({
		showOn: "button",
		buttonImage: "<spring:url value="/resources/image/general/calendar.png" />",
		buttonImageOnly: true,
	});
	
	$(".inDate").attr("readonly","true");
	$("input:button").css("min-width","150px");
	

});
</script>



