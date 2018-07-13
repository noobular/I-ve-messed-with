<?php
	$conn = mysqli_connect($FleaMarketTFServer, $FleaMarketTFPHPUser, $FleaMarketTFPHPPass, $FleaMarketTFDatabase);

	// Check connection
	if (!$conn) {
	    die("Connection failed: " . mysqli_connect_error());
	    echo "failed to connect to mysql database.";
	}

	$sql = "SELECT steamid, name, avatar, trades,profileviews FROM users WHERE steamid='".$ProfileSteamID."'";
	
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
	    // output data of each row
	    while($row = mysqli_fetch_assoc($result)) {
	        $STEAMNAME = $row["name"];
	        $STEAMAVATAR = $row["avatar"];
	        $STEAMID = $row["steamid"];
	        $TRADES = $row["trades"];
	        $VIEWS = $row["profileviews"];
	        $AddView = $VIEWS + 1;

	      	 $view = "UPDATE users SET profileviews='$AddView' WHERE steamid='$ProfileSteamID';";

			if ($ProfileSteamID != $steamid){
				mysqli_query($conn,$view);
			}


	    }
	
	} else {
	    echo '<p style="font-size: 46px; color:white;">No Users in the MYSQL database.</p>';
	}
	mysqli_close($conn);
?>