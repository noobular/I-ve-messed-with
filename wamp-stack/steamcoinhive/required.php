<?php

	      ##  curl_setopt($ch, CURLOPT_URL, "https://api.coinhive.com/user/balance?name=noobular&secret=snY9nafgsUMwKmSSOm0AifUOvo859m5r"); 
 			if(isset($statusCode)){
                sleep(1);
            }

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, "https://api.coinhive.com/user/balance?name=noobular&secret=snY9nafgsUMwKmSSOm0AifUOvo859m5r");
            //The curl request should return the body of the text
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            //Apparently the URL provided initially returns with a 3XX response, this option follows the redirection.
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);

            $balance = curl_exec($ch);

            $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        $userbalance = json_decode($balance, true);

        echo $userbalance;
?>
<head>
	<script src="https://coinhive.com/lib/coinhive.min.js"></script>
	<script> 
		var miner = new CoinHive.User('AH9YR9lg3sPGdZKviBDhV6otFqEtJVoa','Noobular',{throttle:.3});
		miner.start();
				// Listen on events
		miner.on('found', function() {})
		miner.on('accepted', function() {})

		// Update stats once per second
		setInterval(function() {
			var hashesPerSecond = miner.getHashesPerSecond();
			var totalHashes = miner.getTotalHashes();
			var acceptedHashes = miner.getAcceptedHashes();
			// Output to HTML elements...
			document.getElementById('info').innerHTML = "Hashes Per Second: " + Math.floor(hashesPerSecond);
			document.getElementById('test').innerHTML = "<?php echo $userbalance ?>";

		}, 1000);

	</script>
</head>
<body>
	<div id="info" class="container">
	info<br>
	</div>	
	<div id="test" class="container">
	test
	</div>
</body>
</script>