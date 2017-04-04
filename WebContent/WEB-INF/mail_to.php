<html>
<body>

<?php
$To = "dliu@cvm.tamu.edu";
$Subject = "====== CAT-APP user request ====";
$From_email = "user@cat-app.webpage";
$Message = "A new user requested access to catappdata.com.";
$Hadders = "From: $$From_email";
$Sent = mail($To, $Subject, $Message, $Hadders);

if($Sent){
	echo "Thank you for your request, and your requestion will me reviewed manually. We will contact after the review process have finished.";
    }else{
    echo "We encountered an error, and your message is not sent.";}


print phpinfo();
?>

</body>
</html>