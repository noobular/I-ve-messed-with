// ==UserScript==
// @name         Destiny 2: Auto Clan Inviter
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.bungie.net/en/ClanV2/PublicFireteam*
// @grant        GM_xmlhttpRequest
// ==/UserScript==



//This script is specifically being used inside the fireteam pages.
(function() {
    'use strict';
    $(".display-name").each(function(index){
        var PlayerName = $.trim($(this).text());
        var PlatformID = $(this).attr('href').substr(18)[0];
        var ID = $(this).attr('href').substr(20);
        var GroupID;

            fetch("https://www.bungie.net/Platform/GroupV2/User/"+PlatformID+"/"+ID+"/0/1/?lc=en&fmt=true&lcin=true", {"credentials":"omit","headers":{"accept":"application/json, text/javascript, */*; q=0.01","x-api-key":"10E792629C2A47E19356B8A79EEFA640","x-csrf":"2644696672050764867","x-requested-with":"XMLHttpRequest"},"referrer":"https://www.bungie.net/en/Profile/254/20059977/sooble","referrerPolicy":"no-referrer-when-downgrade","body":null,"method":"GET","mode":"cors"})
              .then(function(response) {
                  return response.json();
              })
              .then(function(myJson) {
                 // Check if the player is already in a clan
                 if(typeof myJson.Response.results[0] != "undefined"){
                     // If the player is already in a clan do....
                     //console.log(PlayerName + " | PlatformID: " + PlatformID + " | ID: " +ID + " | GroupID: " + myJson.Response.results[0].member.groupId);
                 }else{
                     // If the player is NOT in a clan do...
                     console.log("Invited Player: " + PlayerName + " | PlatformID: " + PlatformID + " | ID: " +ID);
                     console.log(fetch("https://www.bungie.net/Platform/GroupV2/3787357/Members/IndividualInvite/"+PlatformID+"/"+ID+"/?lc=en&fmt=true&lcin=true", {"credentials":"include","headers":{"accept":"application/json, text/javascript, */*; q=0.01","accept-language":"en-US,en;q=0.9","content-type":"application/json; charset=UTF-8;","x-api-key":"10E792629C2A47E19356B8A79EEFA640","x-csrf":"2644696672050764867","x-requested-with":"XMLHttpRequest"},"referrer":"https://www.bungie.net/en/Profile/"+PlatformID+"/"+ID+"/"+PlayerName,"referrerPolicy":"no-referrer-when-downgrade","body":"{\"message\":\"\"}","method":"POST","mode":"cors"}));
                 }
              })
    });

    setTimeout(function(){window.close();},5000);
})();
