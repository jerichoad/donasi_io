<?php
/*header("Access-Control-Allow-Origin: *");
$arr;
$servername = "localhost";
$username = "flutter_160418108";
$password = "ubaya";
$dbname = "flutter_160418108";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  $arr= ["result"=>"error","message"=>"unable to connect"];
}*/
include 'conn.php';

$idcampaign=$_POST['idcampaign'];
$sql = "SELECT * FROM campaign where idcampaign = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('i',$idcampaign);
$stmt->execute();
$result = $stmt->get_result();
$r=[];

if ($result->num_rows > 0) {
  /*$data=mysqli_fetch_assoc($result);
  $arr=["result"=>"success","data"=>$data];*/
  $r=mysqli_fetch_assoc($result);

    $sql2 = "SELECT namacat FROM category inner join genrecampaign
        on category.idcategory=genrecampaign.category_idcategory
        where campaign_idcampaign=$idcampaign";
    $stmt2 = $conn->prepare($sql2);
    $stmt2->execute();
    $cate=[];
    $result2 = $stmt2->get_result();
    if ($result2->num_rows > 0) {
        while($r2=mysqli_fetch_assoc($result2))
        {
            array_push($cate,$r2);
        }
    }
    $r["genres"]=$cate;

    $sql3 = "SELECT account.nama, donasi.komentar, donasi.nominal FROM account inner join donasi
        on account.idaccount=donasi.idaccount
        where idcampaign=$idcampaign";
    $stmt3 = $conn->prepare($sql3);
    $stmt3->execute();
    $donasi=[];
    $result3 = $stmt3->get_result();
    if ($result3->num_rows > 0) {
        while($r3=mysqli_fetch_assoc($result3))
        {
            array_push($donasi,$r3);
        }
    }
    $r["donasis"]=$donasi;

    $arr=["result"=>"success","data"=>$r];
} else {
   $arr= ["result"=>"error:","message"=>"sql error: $sql"];
}

echo json_encode($arr);
$stmt->close();
$conn->close();
?>
