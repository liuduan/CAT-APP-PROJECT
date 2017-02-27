function showAllFiles(){
	document.getElementById('allFiles').style.display="block";
	document.getElementById('excelFiles').style.display="none";
	document.getElementById('images').style.display="none";
	document.getElementById('flatFiles').style.display="none";
	if (!$(this).hasClass("active")) {
	    // Remove the class from anything that is active
	    $("li.active").removeClass("active");
	    // And make this active
	    $(this).addClass("active");
	  }
}
function showExcelFiles(){
	document.getElementById('allFiles').style.display="none";
	document.getElementById('excelFiles').style.display="block";
	document.getElementById('images').style.display="none";
	document.getElementById('flatFiles').style.display="none";
	if (!$(this).hasClass("active")) {
	    // Remove the class from anything that is active
	    $("li.active").removeClass("active");
	    // And make this active
	    $(this).addClass("active");
	  }
}
function showImages(){
	document.getElementById('allFiles').style.display="none";
	document.getElementById('excelFiles').style.display="none";
	document.getElementById('images').style.display="block";
	document.getElementById('flatFiles').style.display="none";
	if (!$(this).hasClass("active")) {
	    // Remove the class from anything that is active
	    $("li.active").removeClass("active");
	    // And make this active
	    $(this).addClass("active");
	  }
}
function showFlatFiles(){
	document.getElementById('allFiles').style.display="none";
	document.getElementById('excelFiles').style.display="none";
	document.getElementById('images').style.display="none";
	document.getElementById('flatFiles').style.display="block";
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
