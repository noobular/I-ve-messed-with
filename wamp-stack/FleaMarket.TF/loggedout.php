<?php
require 'config/FleaMarketTFConfig.php';
?>
<!DOCTYPE html>
<html>
<head>
	<title>FleaMarket.TF</title>
	
			<meta charset="utf-8">
	 		<meta name="viewport" content="width=device-width, initial-scale=1">

			<!-- Latest compiled and minified CSS -->
			<link rel="stylesheet" href="https://bootswatch.com/united/bootstrap.min.css"  crossorigin="anonymous">

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

			<!-- Latest compiled and minified JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

			<style>

			body{
				background-color: #1a1a1a;
					margin-right: 0;
					margin-left: 0;
			}
				@media (min-width: 768px) {
					.navbar-header{
						min-width: 100%
						height: 50px;
					}
				.navbar{
					border: 0px 0px 0px 0px;
					border-radius:  0px;
					height: 100%;
					min-width:200px;
					margin-right: 0;
					margin-left: 0;
					padding-bottom: 5px;
					min-height: 100%
					width: 100%;
					position: fixed;
				}
				@font-face {
				    font-family: "TFfont";
				    src: url(<?=$FleaMarketTFfont?>) format("truetype");
				}
				body{
					font-family: "TFfont", Verdana, Tahoma;
					height: 100%
					background-color:#1a1a1a;
				}

				html{
					min-height: 100%
					background-color:#1a1a1a;

				}
					.color1{
						background-color: #e95420;
					}
					.color2{
						background-color: #b83c12;
					}
				  .navbar-collapse {
				    height: auto;
				    border-top: 0;
				    box-shadow: none;
				    max-height: none;
				    padding-left:0;
				    padding-right:0;
				  }
				  .navbar-collapse.collapse {
				    display: block !important;
				    width: auto !important;
				    padding-bottom: 0;
				    overflow: visible !important;
				  }
				  .navbar-collapse.in {
				    overflow-x: visible;
				  }


				.navbar-nav,
				.navbar-nav > li,
				.navbar-left,
				.navbar-right,
				.navbar-header
				{float:none !important;}

				.navbar-right .dropdown-menu {left:0;right:auto;}
				.navbar-collapse .navbar-nav.navbar-right:last-child {
				    margin-right: 0;
				}
				}
				input{
					max-width: 250px;
				}
				.searchBtn{
					width: 250px;
				}
				.badge{
					float:right;
				}
				#searchbar{
					float:right;
					margin-top: 12px;
					background-color: #1a1a1a;
					border-radius: 10px;
					border-width: 0px;
				}
				.navbar-header.col-sm-12{
					background-color: #b83c12;	
				}
				.navbar-header.col-sm-12 > a{
					color: #ffffff;
				}
				.container.col-sm-12{
					padding: 0px 0px 0px 0px;

				}

				.loginbutton{
					margin-left: 10px;
				}
				#test{
					width: 100%;
					margin-top: 100px;
				}
				p{
					text-align: center;
					border-style: solid;
					border-width: 5px;
					border-color: #e95420;
					border: 5px 5px 5px 5px;

				}

			</style>
</head>
<body>
	<div id="test" class="container col-sm-4">
	<div class="container col-sm-4"></div>
	<div class="container col-sm-4">
	<p>
		You've been logged out of FleaMarket.TF <br>
		<a href="<?=$FleaMarketTF?>">Back to FleaMarket.TF </a>
	</p>

	</div>

	</div>
</body>
</html>