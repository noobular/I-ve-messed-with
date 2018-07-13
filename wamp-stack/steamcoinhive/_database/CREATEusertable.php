<?php
require '/../_config/config.php';

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
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