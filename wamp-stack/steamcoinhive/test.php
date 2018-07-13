<?php

	function www_get($url){

		if (!function_exists('curl_init')){
			die('can\'t find cURL module');
		}

		$ch = curl_init();

		if(!$ch){
			die('couldn\'t initialize a cURL module');
		}

		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);

		$data = curl_exec($ch);

		curl_close($ch);

		return $data;

	}


$url = "https://api.coinhive.com/user/balance?name=noobular&secret=snY9nafgsUMwKmSSOm0AifUOvo859m5r";

$html = www_get($url);

if (!$html){
die('Can\'t get html for url:'.$url);
}else{
	echo 'we found';
	if(preg_match('~<a\s~i', $html, $regs)){
		echo count($regs[0]);

	}else{
		echo '0';
	}
	echo 'links on'.url.'web page';
}

?>