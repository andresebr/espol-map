<?php
 
    //associate the param sent by Flex (content) to a variable
    $file_data = $_POST['foto'];
	$consulta = $_POST['consulta'];
	$accion = $_POST['accion'];

    //Decodes our Base64 string sent from Flex
    $img_data = base64_decode($file_data);
 
    //Set an image filename, with .jpg extension
    //$img_filename = "images/caras/example_name.jpg";
	if($accion==1){
	$img_filename = "faces/trainingSet/images/".$consulta.".jpg";
	}
	elseif($accion==2){
	$img_filename = "faces/temp/images/unknown.jpg";
	}
    //Opens the "example_name.jpg"
    $fp = fopen ($img_filename, "w");
	//$fp = fopen ("images/caras/".$consulta.".jpg", "w");
 
    //populates it with "img_data" (our decoded Base64 send from Flex)
    fwrite ($fp, $img_data);
 
    //closing the file pointer
    fclose ($fp); 
 
    //now we have a real JPEG image in our server, do anything you want with it!
    //Write what's necessary to make it a profile picture, an album photo, etc...
 
?>