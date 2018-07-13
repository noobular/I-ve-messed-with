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

	    

		$result = mysqli_query($conn, "SELECT steamid,name,avatar,avatarfull FROM users WHERE steamid='".$steamid."'");

		$updateuser = "UPDATE users (steamid,name, avatar, avatarfull) 
		VALUES ('$steamid', '$name','$avatar', '$avatarfull')";

		$updatename = "UPDATE users ( name ) VALUES ('$name') ";
		$updateavatar = "UPDATE users ( avatar ) VALUES ('$avatar') ";
		$updateavatarfull = "UPDATE users ( avatarfull ) VALUES ('$avatarfull') ";


		if (mysqli_num_rows($result) > 0) {
			    // output data of each row
			    while($row = mysqli_fetch_assoc($result)) {
			        $UPDATESTEAMNAME = $row["name"];
			        $UPDATESTEAMAVATAR = $row["avatar"];
			        $UPDATESTEAMAVATARFULL = $row["avatarfull"];
			        $UPDATESTEAMID = $row["steamid"];

			        if($UPDATESTEAMNAME !== $name){
			        	mysqli_query($conn,$updatename);
			        }
			    
			    	if($UPDATESTEAMAVATAR !== $avatar){
			    		mysqli_query($conn,$updateavatar);
			    		mysqli_query($conn,$updateavatarfull);			        
			    	}	
			    }
			
			} else {
			    echo '<p style="font-size: 46px; color:white;">No Users in the MYSQL database.</p>';
			}




	}


?>
