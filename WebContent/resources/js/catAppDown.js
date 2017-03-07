function showAllFiles(){
	jQuery(".danger").show();
	jQuery(".success").show();
	jQuery(".warning").show();
	
	if (!$(this).hasClass("active")) {
	    // Remove the class from anything that is active
	    $("li.active").removeClass("active");
	    // And make this active
	    $(this).addClass("active");
	  }
}
function showExcelFiles(){
	jQuery(".danger").hide();
	jQuery(".warning").hide();
	jQuery(".success").show();
	if(jQuery(".success").length==0){
		jQuery("#button").hide();
	}else{
		jQuery("#button").show();
	}
	if (!$(this).hasClass("active")) {
	    // Remove the class from anything that is active
	    $("li.active").removeClass("active");
	    // And make this active
	    $(this).addClass("active");
	  }
}
function showImages(){
	jQuery(".danger").hide();
	jQuery(".warning").show();
	jQuery(".success").hide();
	if(jQuery(".warning").length==0){
		jQuery("#button").hide();
	}else{
		jQuery("#button").show();
	}
	
	if (!$(this).hasClass("active")) {
	    // Remove the class from anything that is active
	    $("li.active").removeClass("active");
	    // And make this active
	    $(this).addClass("active");
	  }
}
function showFlatFiles(){
	
	jQuery(".danger").show();
	jQuery(".warning").hide();
	jQuery(".success").hide();
	
	if(jQuery(".danger").length==0){
		jQuery("#button").hide();
	}else{
		jQuery("#button").show();
	}
	if (!$(this).hasClass("active")) {
	    // Remove the class from anything that is active
	    $("li.active").removeClass("active");
	    // And make this active
	    $(this).addClass("active");
	  }
}

function uncheckAll(){
	   $("input[type='checkbox']:checked").prop("checked",false)
	}

function hideJumbo(){
	
	document.getElementById('searchFilter').style.display='none';
}

