<?php
header('Access-Control-Allow-Origin: *');

$connect = new mysqli("localhost","root","","ginnacle");

$ID=$_POST['Etiqueta'];
$ID = mysqli_real_escape_string($connect, $ID);
$sql = "DELETE FROM recordatorios where Etiqueta = '$ID'";
mysqli_query($connect,$sql);
?>