<?php
require '/../config/FleaMarketTFConfig.php';

// Create connection
$conn = mysqli_connect($servername, $username, $password);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Create database
$sql = "CREATE DATABASE fleamarkettf";
if (mysqli_query($conn, $sql)) {
} else {
   mysqli_error($conn);
}
mysqli_close($conn);

// Create connection
$conn = mysqli_connect($FleaMarketTFServer, $FleaMarketTFPHPUser, $FleaMarketTFPHPPass, $FleaMarketTFDatabase);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// sql to create table
$sql = "CREATE TABLE users (
steamid VARCHAR(255) NOT NULL,
tradelink VARCHAR(255), 
name VARCHAR(255) NOT NULL,
rank VARCHAR(255) NOT NULL,
avatar VARCHAR(255),
avatarfull VARCHAR(255),
trades VARCHAR(255),
profileviews VARCHAR(255),
reg_date TIMESTAMP
)";

if (mysqli_query($conn, $sql)) {
    echo "users table created successfully";
} else {
    echo "Error creating table: " . mysqli_error($conn);
}

mysqli_close($conn);
?>