// ==UserScript==
// @name         Scrap.TF Raffle Enterer
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  ENTER ALL THE RAFFLES!
// @author       You
// @match        https://scrap.tf/raffles/*
// @grant        none
// ==/UserScript==
    var DEV = false;

function closepage(){
    window.close();
}

function CheckText(){
    var RaffleText = $("#raffle-enter > i18n").text();
          if (RaffleText == "Enter Raffle"){
              return true; 
          }else{return false;}
}
function EnterRaffle(){
    if(CheckText() === true){
        $("#raffle-enter").click();
        if(CheckText() === true){CheckCap();}
    }
}

function CheckCap(){
        if ($("#recaptcha-anchor").length){
            $("#recaptcha-anchor").click();
        }
}
EnterRaffle();
console.log($("#recaptcha-anchor").click());

 if(DEV === false){ closepage();}
