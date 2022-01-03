<?

header('Access-Control-Allow-Origin: *');

$connect = new mysqli("localhost","root","","ginnacle");

if($connect){
	//echo "Success";
	 
}else{
	//echo "Fallo, revise ip o firewall";
	exit();
}
?>