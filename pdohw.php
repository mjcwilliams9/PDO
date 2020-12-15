<?php
$pdoCheck = class_exists("PDO");
	
	if ($pdoCheck) {
		echo " pdo drivers zijn geinstalleerd";
	}
	else{
		echo " pdo drivers zijn niet geinstalleerd";
	}


$dbhost="localhost";
$dbname="klanten";
$user="root";
$pass="";

try{
	$database = new PDO("mysql:host=$dbhost;dbname=$dbname",$user,$pass);
	$database->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
	echo "<br /> Verbinding gemaakt";
}

catch(PDOException $e){
	echo $e->getMessage();
	echo "<br /> Verbinding niet gemaakt";
}

$query="INSERT INTO tblArtikel (Artikelgroep, Verpakking, Inhoud, Omschrijving, btw_code, emballage, prijs) VALUES (?,?,?,?,?,?,?)";

$getData = $database->prepare($query);
$data=array("DVD","DOOS",30,"Monopoly",1,0,11.25);

try{
	$getData->execute($data);
	echo "<br /> Query uitgevoerd";
}

catch(PDOException $e){
	echo " Data niet opgehaald";
}


?>
