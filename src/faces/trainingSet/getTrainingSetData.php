<?php
/**
 * Downloaded from php-help.ro
 * You can use this script in any way you like without asking for my permission.
 * For any problems please visit http://www.php-help.ro/php/output-folder-content-in-xml-file/
 * and leave a comment and I'll answer your question.
 */
$path_to_image_dir = 'images'; // relative path to your image directory
 
$xml_string = <<<XML
<?xml version="1.0" encoding="UTF-8"?>
<images> 
</images>
XML;
 
$xml_generator = new SimpleXMLElement($xml_string);
 
if ( $handle = opendir( $path_to_image_dir ) ) 
{
    while (false !== ($file = readdir($handle))) 
    {
        if ( is_file($path_to_image_dir.'/'.$file) ) 
        {
           list( $width, $height ) = getimagesize($path_to_image_dir.'/'.$file);	
           $image = $xml_generator->addChild('image');  
           $image->addChild('path', $path_to_image_dir.'/'.$file);    
           $image->addChild('height', $height);    
           $image->addChild('width', $width);    
		   $image->addChild('name', $file);	
        }
    }
    closedir($handle);
}
 
header("Content-Type: text/xml");
echo $xml_generator->asXML();	
?>