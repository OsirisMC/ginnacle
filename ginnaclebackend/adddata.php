<?php
header('Access-Control-Allow-Origin: *');

$connect = new mysqli("localhost","root","","ginnacle");

$Nombre=$_POST['Nombre'];
$ApellidoP=$_POST['ApellidoP'];
$ApellidoM=$_POST['ApellidoM'];
$Telefono=$_POST['Telefono'];
$Edad=$_POST['Edad'];
$Peso=$_POST['Peso'];
$FUM=$_POST['FUM'];
$Activo=$_POST['Activo'];
$Sangre=$_POST['Sangre'];
$Alergias=$_POST['Alergias'];
$Embarazo=$_POST['Embarazo'];
$Diagnostico=$_POST['Diagnostico'];


$Nombre = mysqli_real_escape_string($connect, $Nombre);
$ApellidoP = mysqli_real_escape_string($connect, $ApellidoP);
$ApellidoM = mysqli_real_escape_string($connect, $ApellidoM);
$Telefono = mysqli_real_escape_string($connect, $Telefono);
$Edad = mysqli_real_escape_string($connect, $Edad);
$Peso = mysqli_real_escape_string($connect, $Peso);
$FUM = mysqli_real_escape_string($connect, $FUM);
$Activo = mysqli_real_escape_string($connect, $Activo);
$Sangre = mysqli_real_escape_string($connect, $Sangre);
$Alergias = mysqli_real_escape_string($connect, $Alergias);
$Embarazo = mysqli_real_escape_string($connect, $Embarazo);
$Diagnostico = mysqli_real_escape_string($connect, $Diagnostico);


$sql = "INSERT INTO pacientes SET
Nombre ='$Nombre',
ApellidoP = '$ApellidoP',
ApellidoM = '$ApellidoM',
Telefono = '$Telefono',
Edad = '$Edad',
Peso = '$Peso',
FUM = '$FUM',
Activo = '$Activo',
Sangre = '$Sangre',
Alergias = '$Alergias',
Embarazo = '$Embarazo',
Diagnostico = '$Diagnostico'";

mysqli_query($connect,$sql);
?>