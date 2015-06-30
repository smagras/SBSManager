var arrayDialog =  [];

function initDialogBasic(dialogID,title,w,h){

	
	$( dialogID ).dialog({
		autoOpen: false,
		modal: true,
		heigth:h,
		width:w,
		title:title,
		buttons: [
      			   { 
      			      text: "Fermer", 
      			      width:150,
      			      click: function() { 
      			    	$(this).dialog( "close" );
      			      }
      			   }
      			  ]
	});
	
	
}

function initDialogBasicSave(dialogID,title,w,h,c_dialogSaveMethod){

	
	$( dialogID ).dialog({
		autoOpen: false,
		modal: true,
		heigth:h,
		width:w,
		title:title,
		buttons: [
      			   { 
      			      text: "Fermer", 
      			      width:150,
      			      click: function() { 
      			    	$(this).dialog( "close" );
      			      }
      			   }, { 
      			      text: "Enregistrer", 
      			      width:150,
      			      click: function() { 
      			    	  c_dialogSaveMethod(dialogID);
      			      }
      				}]
	});
	                  	
}

function openDialogBasic(dialogID,url,data){
	data = data || '';
	
	
	$.ajax({
		  method: "POST",
		  url: url,
		  data:data,
	}).done(function( msg ) {
		 $( dialogID ).html("");
		 $( dialogID ).html(msg);
		 $( dialogID ).dialog("open");
	});
	
	
}