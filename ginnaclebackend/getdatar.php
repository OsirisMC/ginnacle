<?php
header('Access-Control-Allow-Origin: *');

$connect = new mysqli("localhost","root","","ginnacle");
$Fecha=$_POST['Fecha'];
$Fecha = mysqli_real_escape_string($connect, $Fecha);
$sql=$connect->query("SELECT * FROM recordatorios WHERE Fecha = '$Fecha'");

$result=array();

while($row=$sql->fetch_assoc()){
	$result[]=$row;
}

echo json_encode($result);
?>