<?php
header('Access-Control-Allow-Origin: *');

$connect = new mysqli("localhost","root","","ginnacle");
$sql=$connect->query("SELECT * FROM ginecologo");

$result=array();

while($row=$sql->fetch_assoc()){
	$result[]=$row;
}

echo json_encode($result);
?>