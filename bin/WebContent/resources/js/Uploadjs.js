function upload(){
	if($("#uploadfile").val()!=""){
		
	}else{
		alert("Please upload a file before proceeding.");
	}

	
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
		           window.location.replace("http://localhost:8080/CAT-APP-PROJECT/Upload");
		        },
		        error: function (result) {
		        	alert("A file with the same name is already present in the system.");
		  
		        },
		        excess: function (result) {
		        	alert("File is too large.");
		        }
		    });
		}