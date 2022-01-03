<?php
header('Access-Control-Allow-Origin: *');

$connect = new mysqli("localhost","root","","ginnacle");

$Etiqueta=$_POST['Etiqueta'];
$Fecha=$_POST['Fecha'];
$Hora=$_POST['Hora'];
$Descripcion=$_POST['Descripcion'];
$Completado=$_POST['Completado'];
$Prioridad=$_POST['Prioridad'];
$Paciente=$_POST['Paciente'];
$Ginecologo=$_POST['Ginecologo'];


$Etiqueta= mysqli_real_escape_string($connect, $Etiqueta);
$Fecha = mysqli_real_escape_string($connect, $Fecha);
$Hora = mysqli_real_escape_string($connect, $Hora);
$Descripcion = mysqli_real_escape_string($connect, $Descripcion);
$Completado = mysqli_real_escape_string($connect, $Completado);
$Prioridad = mysqli_real_escape_string($connect, $Prioridad);
$Paciente = mysqli_real_escape_string($connect, $Paciente);
$Ginecologo = mysqli_real_escape_string($connect, $Ginecologo);


$sql = "UPDATE recordatorios SET
Fecha ='$Fecha',
Hora = '$Hora',
Descripcion = '$Descripcion',
Completado = '$Completado',
Prioridad = '$Prioridad',
Paciente = '$Paciente',
Ginecologo = '$Ginecologo'
WHERE Etiqueta = '$Etiqueta'";

mysqli_query($connect,$sql);
?>