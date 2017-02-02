function upload(){
	if($("#uploadfile").val()!=""){
		
	}else{
		alert("Please upload a file before proceeding.");
	}
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var formData = new FormData();
    formData.append('file', $('input[type=file]')[0].files[0]);
    formData.append('CellType',($('input[name=form-CellType1]:checked').val()));
    formData.append('TimePoint',$("#tpdrop").val());
    formData.append('AssayName',$("#form-email").val());
    formData.append('PhenoType',$('#phetype').val());
    formData.append('Plate',($('input[name=form-Plate1]:checked').val()));
    formData.append('filename',$("#uploadfile").val());
    console.log("form data " + formData);
			$.ajax({
		        type: "POST",
		        url: "uploadfiles",
		        data: formData,
		        processData : false,
                contentType : false,
		        beforeSend: function(xhr) {
		            // here it is
		            xhr.setRequestHeader(header, token);
		        },
		        success: function (result) {
		           alert("File Uploaded Successfully.");
		           window.location.replace("http://localhost:8080/database_project/contact");
		        },
		        error: function (result) {
		        	alert("A file with the same name is already present in the system.");
		        	window.location.replace("http://stackoverflow.com");
		        },
		        excess: function (result) {
		        	alert("File is too large.");
		        }
		    });
		}