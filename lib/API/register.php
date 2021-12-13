<?php

header("Access-Control-Allow-Origin: *");

$conn = new mysqli("localhost", "flutter_160418108", "ubaya", "flutter_160418108");

if ($conn->connect_error) {
    $arr = ["result"=>"error","message"=>"unable to connect"];
}

extract($_POST);

$arr = [];

$sql = "INSERT INTO account(username, nama, email, password) VALUES (?,?,?,?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssss", $username, $nama, $email, $password);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    $arr = ['result' => 'success', 'id' => $conn->insert_id];
} else {
    $arr = ['result' => 'failed', 'error' => $conn->error];
}

echo json_encode($arr);