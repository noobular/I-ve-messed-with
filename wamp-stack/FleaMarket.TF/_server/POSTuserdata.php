<?php
require ('/../config/FleaMarketTFConfig.php');

$conn = mysqli_connect($FleaMarketTFServer, $FleaMarketTFPHPUser, $FleaMarketTFPHPPass, $FleaMarketTFDatabase);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if(!isset($_SESSION['steamid'])) {
	}  else {
	    include ('steamauth/userInfo.php'); //To access the $steamprofile array
	    //Protected content
	    $name = $steamprofile['personaname'];
	    $avatar = $steamprofile['avatar'];
	    $avatarfull = $steamprofile['avatarfull'];
	    $steamid = (string)$steamprofile['steamid'];
	    $trades = $steamprofile['tradecount'];
	    $backpacktflink = "http://backpack.tf/profiles/";
	    $rank = "User";
	    $tradelink = "";
	    $profileviews = 0;
	    

	    if($steamid == "76561198163654013" || $steamid == "76561197972433590"){
	    	$rank = "Owner";
	    }

	    

		$result = mysqli_query($conn, "SELECT * FROM users WHERE steamid='".$steamid."'");
		$saveuser = "INSERT INTO users (steamid, tradelink, name, rank, avatar, avatarfull, trades, profileviews) 
		VALUES ('$steamid', '$tradelink', '$name', '$rank', '$avatar', '$avatarfull', '$trades', '$profileviews')";

		if(mysqli_num_rows($result) > 0){
		}else{
			mysqli_query($conn, $saveuser);
		}



	}


?>
