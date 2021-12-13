<?php

header("Access-Control-Allow-Origin: *");
$conn = new mysqli("localhost", "flutter_160418108", "ubaya", "flutter_160418108");

if ($conn->connect_error) {
    $arr = ["result"=>"error","message"=>"unable to connect"];
}

extract($_POST);
//$arr=[];

$sql = "SELECT * FROM campaign INNER JOIN donasi on campaign.idcampaign = donasi.idcampaign WHERE donasi.idaccount =1";
$stmt = $conn->prepare($sql);
//$stmt->bind_param('i',$idaccount);
$stmt->execute();
$result = $stmt->get_result();

$data=[];

if($result->num_rows > 0){
    while($r=mysqli_fetch_assoc($result)){
        array_push($data,$r);
    }
    $arr=["result"=>"success","data"=>$data];
} else {
    $arr= ["result"=>"error:","message"=>"sql error: $sql"];
}

echo json_encode($arr);
$stmt->close();
$conn->close();

?>