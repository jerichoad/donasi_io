<?php
header("Access-Control-Allow-Origin: *");
$arr = null;
$servername = "localhost";
$username = "flutter_160418108";
$password = "ubaya";
$dbname = "flutter_160418108";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    $arr= ["result"=>"error","message"=>"unable to connect"];
}

$idcampaign=$_POST['idcampaign'];
$idaccount=$_POST['idaccount'];
$nominal=$_POST['nominal'];

//$sql = "DELETE FROM donasi WHERE idcampaign=? AND idaccount=? AND nominal=?";
$sql = "DELETE FROM donasi WHERE idcampaign=" + $idcampaign +"AND idaccount=" + $idaccount +"AND nominal= " + $nominal;
$stmt = $conn->prepare($sql);
//$stmt->bind_param("iii", $idcampaign,$idaccount,$nominal);
$stmt->execute();
$result = $stmt->get_result();
$r=[];

if ($result->num_rows > 0) {
    $arr=["result"=>"success","data"=>$r];
} else {
    $arr= ["result"=>"error:","message"=>"sql error: $sql"];
}

echo json_encode($arr);
$stmt->close();
$conn->close();
