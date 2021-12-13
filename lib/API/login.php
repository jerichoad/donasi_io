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

    extract($_POST);
    $sql = "SELECT * FROM account where username=? and password=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss",$user_id,$user_password);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $r=mysqli_fetch_assoc($result);
        $arr=["result"=>"success","user_name"=>$r['user_name']];
    } else {
        $arr= ["result"=>"error","message"=>"sql error: $sql"];
    }
    echo json_encode($arr);

?>
