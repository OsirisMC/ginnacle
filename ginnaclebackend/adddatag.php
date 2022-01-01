<?php
header('Access-Control-Allow-Origin: *');

$connect = new mysqli("localhost","root","","ginnacle");

$Nombre=$_POST['Nombre'];
$ApellidoP=$_POST['ApellidoP'];
$ApellidoM=$_POST['ApellidoM'];
$email=$_POST['email'];
$Contrasena=$_POST['contraseña'];
$Telefono=$_POST['telefono'];



$Nombre = mysqli_real_escape_string($connect, $Nombre);
$ApellidoP = mysqli_real_escape_string($connect, $ApellidoP);
$ApellidoM = mysqli_real_escape_string($connect, $ApellidoM);
$email = mysqli_real_escape_string($connect, $email);
$Contrasena = mysqli_real_escape_string($connect, $Contrasena);
$Telefono = mysqli_real_escape_string($connect, $Telefono);



$sql = "INSERT INTO ginecologo SET
Nombre ='$Nombre',
ApellidoP = '$ApellidoP',
ApellidoM = '$ApellidoM',
email = '$email',
contraseña = '$Contrasena',
telefono = '$Telefono'";

mysqli_query($connect,$sql);
?>