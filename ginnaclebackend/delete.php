<?php
header('Access-Control-Allow-Origin: *');

$connect = new mysqli("localhost","root","","ginnacle");

$ID=$_POST['NumExpediente'];
$ID = mysqli_real_escape_string($connect, $ID);
$sql = "DELETE FROM pacientes where NumExpediente = '$ID'";
mysqli_query($connect,$sql);
?>