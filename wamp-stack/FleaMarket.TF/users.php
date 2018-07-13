<?php
	require 'config/FleaMarketTFConfig.php';
	require $FleaMarketTFSteamAuth;
	include ($FleaMarketTFPOSTuserdata);
?>
<!DOCTYPE html>
<html>
<head>
	
			<meta charset="utf-8">
	 		<meta name="viewport" content="width=device-width, initial-scale=1">

			<!-- Latest compiled and minified CSS -->
			<link rel="stylesheet" href="https://bootswatch.com/united/bootstrap.min.css"  crossorigin="anonymous">

			<script   src="https://code.jquery.com/jquery-3.1.0.js"   integrity="sha256-slogkvB1K3VOkzAI8QITxV3VzpOnkeNVsKvtkYLMjfk="   crossorigin="anonymous"></script>

			<!-- Latest compiled and minified JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
			<link rel="stylesheet" type="text/css" href="resources/styles/main.css">
			<title>FleaMarket.TF</title>

<style>
			@font-face {
			    font-family: "TFfont";
			    src: url(<?=$FleaMarketTFfont?>) format("truetype");
			}
					
			body{
				font-family: "TFfont", Verdana, Tahoma;
				height: 100%
				background-color:#1a1a1a;
			}	
			.well{
				padding: 0px 0px 0px 0px;
				margin:2px 2px 2px 2px;
				margin-bottom: 2px;
			}
			p{
				padding: 0px 0px 0px 0px;	
				margin:0px 0px 0px 0px;
			}


</style>
<script>
	function CreateUserWell(){
		var well = document.createElement("div");
		well.className = "well";

		var p = document.createElement("p");
		p.style = "font-size:24px;";
		p.appendChild(img);
		p.innerHTML = <?=$STEAMNAME?>

		var img = document.createElement("img");
		img.src = "<?=$STEAMAVATAR?>";
		document.getElementById("USERLIST").appendChild(well);
	}

</script>
</head>
<body>
  <!-- Brand and toggle get grouped for better mobile display -->

	<?php
	if(!isset($_SESSION['steamid'])) {
		echo '<div id="NavHeader" class="navbar-header col-sm-12">';
		echo '<a style="margin-top:7px;" target="_blank" id="brand" class="navbar-brand" href="#">FleaMarket.TF</a>';

		echo '    <ul  style="float: right;"class="nav navbar-nav col-sm-2">';
		echo '		<li style="text-align: center;" class="dropdown">';
		loginbutton("rectangle");

		echo  '      	 </ul>';
		echo   '    </li>';
		echo   '  </ul>';

		//echo '<input type="textarea" name="test" placeholder=" Price Search" id="searchbar">';
		echo '</div>';




		echo '<nav id="sidebar" class="navbar navbar-default col-sm-2"role="navigation">';
		echo "  <div style='height:100%' class=\"collapse navbar-collapse navbar-ex1-collapse\">";
		echo "    <ul style='width:100%' class=\"nav navbar-nav navbar-right\">";
		echo "    </ul>";
		echo "  </div>";
		echo "  </div>";

	}  else {

	    include ('steamauth/userInfo.php'); //To access the $steamprofile array
	    //Protected content
	    $name = $steamprofile['personaname'];
	    $avatar = $steamprofile['avatar'];
	    $steamid = (string)$steamprofile['steamid'];
	    $trades = $steamprofile['tradecount'];
	    $backpacktflink = "http://backpack.tf/profiles/";
	  //  echo date("Y-m-d", $steamprofile['timecreated']);	 

		echo '<div id="NavHeader" class="navbar-header col-sm-12">';
		echo '<a style="margin-top:7px;"  id="brand" class="navbar-brand" href="index">FleaMarket.TF</a>';

		echo '    <ul  style="float: right;"class="nav navbar-nav col-sm-3">';
		echo '		<li style="text-align: left;" class="dropdown">';
		echo "        <a style=\" color: white;\" ' href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><img style='height: 36px; width: 36px;'src=\"$avatar\">  $name  <b class=\"caret\"></b></a>";
		echo  '       	<ul class="dropdown-menu">';
		echo  "         	<li><a href=\"profile?id=$steamid\">Profile</a></li>";
		echo  '         	<li><a href="settings">Settings</a></li>';
		echo  '         	<li><a href="donate">Donate</a></li>';
		
							logoutbutton(); //Logout Button
		echo  '      	 </ul>';
		echo   '    </li>';
		echo   '  </ul>';

		//echo '<input type="textarea" name="test" placeholder=" Price Search" id="searchbar">';
		echo '</div>';




		echo '<nav id="sidebar" class="navbar navbar-default col-sm-2"role="navigation">';
		echo "  <div style='height:100%' class=\"collapse navbar-collapse navbar-ex1-collapse\">";
		echo "    <ul style='width:100%' class=\"nav navbar-nav navbar-right\">";
		echo      "<li class=\"col-sm-12\"><a onclick=\"GetItemDB($steamid);\">Your Inventory</a></li>";
		echo "    <li class=\"col-sm-12\"><a href=\"privatetrades\">Your Trades <span id=\"TotalTrades\" class=\"badge\"> $trades </span></a></li>";
		echo "     <li class=\"col-sm-12\"><a href=\"publictrades\">Global Trades</a></li>";
		echo "     <li class=\"col-sm-12\"><a href=\"#\">Item Search</a></li>";
		echo '     <li class="col-sm-12"><a href="users">Users</a></li>';
		echo "    </ul>";
		echo "  </div>";
		echo "  </div>";
		}     
	?>

	</nav>
	</div>
	</div>
<div id="USERLIST" style="margin-top: 10px;float:right;" class="container col-sm-10">
<?php
// Create connection
$conn = mysqli_connect($FleaMarketTFServer, $FleaMarketTFPHPUser, $FleaMarketTFPHPPass, $FleaMarketTFDatabase);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
    echo "failed to connect to mysql database.";
}

$sql = "SELECT steamid, tradelink, name, rank, avatar, trades, profileviews FROM users";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        $STEAMID = $row["steamid"];
        $TRADELINK = $row["tradelink"];
        $STEAMNAME = $row["name"];
        $RANK = $row["rank"];
        $STEAMAVATAR = $row["avatar"];
        $TRADES = $row["trades"];
        $VIEWS = $row["profileviews"];


        echo '<div class="well col-sm-5">';
        echo "<a href=\"profile?id=$STEAMID\">";
        echo '<p>';
        echo "<img src=\"$STEAMAVATAR\"> ";
        echo "$STEAMNAME";
        echo "<span  data-toggle='tooltip' title='Total profile views, These are not unique!' class='badge'> Views: $VIEWS</span>";
        echo "<span  class='badge'> Reputation: 0 <br></span>";
        echo "<span  class='badge'> Trades: $TRADES</span>";
        echo '</p>';
        echo '</a>';
        echo '</div>';
        echo'<script>CreateUserWell();</script>';
    }
} else {
    echo '<p style="font-size: 46px; color:white;">No Users in the MYSQL database.</p>';
}

mysqli_close($conn);
?>
</div>
<script>
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip(); 
	});
</script>
</body>

</html>