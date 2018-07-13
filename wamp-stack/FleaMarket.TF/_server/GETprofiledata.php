<?php
//require 'steamauth/steamauth.php';
	$ProfileSteamID = $_GET['id'];
    if(!isset($_SESSION['steamid'])) {

    }  else {

        include ('steamauth/userInfo.php'); //To access the $steamprofile array
        //Protected content
        $name = $steamprofile['personaname'];
        $avatar = $steamprofile['avatar'];
        $steamid = (string)$steamprofile['steamid'];
        $trades = $steamprofile['tradecount'];
        $backpacktflink = "http://backpack.tf/profiles/";
      //  echo date("Y-m-d", $steamprofile['timecreated']);  
    }

     do {
            //If this isn't the first time in the loop, pause for a second to prevent spamming their servers
            if(isset($statusCode)){
                sleep(1);
            }

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, "http://steamcommunity.com/profiles/$ProfileSteamID/inventory/json/440/2");
            //The curl request should return the body of the text
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            //Apparently the URL provided initially returns with a 3XX response, this option follows the redirection.
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);

            $steamData = curl_exec($ch);

            $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);


        } while ($statusCode !== 200);

        $UserInventory = json_decode($steamData, true);
?>        
    <script>

        function SpanDisplay(){
            var SteamItemArray = <?php echo json_encode($UserInventory);?>;
            console.log(SteamItemArray);
            $.each(SteamItemArray['rgDescriptions'], function(k,v){

                var ItemName = SteamItemArray['rgDescriptions'][k].name;
                var ItemColor = SteamItemArray['rgDescriptions'][k].name_color;
                var ItemWiki = SteamItemArray['rgDescriptions'][k]['actions'][0].link;
                var ItemDescs = SteamItemArray['rgDescriptions'][k]['descriptions'];
                var ItemTradable = SteamItemArray['rgDescriptions'][k].tradable;
                var ItemDefindex = SteamItemArray['rgDescriptions'][k]['app_data'].def_index;
                var ItemQuality = SteamItemArray['rgDescriptions'][k]['app_data'].quality;
                var ItemIMG = "http://cdn.steamcommunity.com/economy/image/" + SteamItemArray['rgDescriptions'][k].icon_url;
                var noIMG = '<?=$FleaMarketTFnoimg?>';

            var itempanel = document.createElement("span");

            var name = document.createElement("a");
            name.title = ItemName;
            
            
            $(name).attr("data-toggle", "tooltip");
            itempanel.appendChild(name);

            var itemicon = document.createElement("img");
            itemicon.src = ItemIMG;
            itemicon.style = "border-radius:10px; border-width: 2px; border: 5px 5px 5px 5px;height: 64px; width: 64px; background-color:" + ItemColor + ";";
            itemicon.className = "q" + ItemQuality;

            name.appendChild(itemicon);

            console.log(SteamItemArray['rgDescriptions'][k]);

            document.getElementById('ItemDBDisplay').appendChild(itempanel);

        });

        };
        SpanDisplay();
    </script>
