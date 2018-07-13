// ==UserScript==
// @name         BP.TF AutoPoster 1.0
// @namespace    noobularkid.github.io
// @version      1
// @description  try to take over the world!
// @author       You
// @match        http://backpack.tf/profiles/76561198163654013
// @include     http://backpack.tf/profiles/76561198163654013
// @require     http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js
// @require     https://gist.github.com/raw/2625891/waitForKeyElements.js
// @grant       GM_addStyle
// @grant       GM_getResourceText
// @grant       GM_getResourceURL
// @grant       GM_xmlhttpRequest
// ==/UserScript==

////======================================CONFIG===============================================////
var PostMessage = "[Automated]+[Instant/No Tradehold]+[2 Weapons/Scrap]";
var Profit = true;        // Adds Minimum Profit to the Backpack.tf price
var LowProfit = true;     // Anything below 1 refined, Should it add Minimum profit to it?
var MinimumProfit = 0.11; // The amount added after the Backpack.tf price is retrieved, if EnableProfit is enabled.

var ItemProfit = [
    ["The Frying Pan", 0]
];
////===========================================================================================////
console.log("Starting BP.TF Post bot...");

var ItemArray = [];
var NonSellableItemCount = 0;
var SellableItemCount = 0;
var TotalPostWorth = 0;
var TotalMetal = 0;
waitForKeyElements ('#media-side', CreateMainFrame);

function SellItem(ItemURL,Price,name){
    console.log("| Selling Price: " + Price);
    GM_xmlhttpRequest({
        method: "POST",
        url: "http://backpack.tf/classifieds/sell/" + ItemURL,
        data: "user-id=16dll9zgo9fute0nzk8h&currencies%5Bmetal%5D=" + Price + "&currencies%5Bkeys%5D=&details= "+ PostMessage + "&offers=1&buyout=1&tradeoffers_url=https%3A%2F%2Fsteamcommunity.com%2Ftradeoffer%2Fnew%2F%3Fpartner%3D203388285%26token%3DZKM_dKG0",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        onload: function(response) {

        }

    });
}

function CreateMainFrame (jNode) {
    //Create Body Which holds Every block created from this function.
    var body = document.createElement("div");

    body.className = "container col-sm-12";

    //Create Panel Main / Append to Body
    var panelmain = document.createElement("div");
    panelmain.className = "panel panel-primary";
    body.appendChild(panelmain);

    //Create Panel heading / Append to main
    var panelheading = document.createElement("div");
    panelheading.innerHTML = "<b>Noob's Auto-Trader</b>";
    panelheading.className = "panel-heading";
    panelheading.id = "AutoPostHead";
    panelmain.appendChild(panelheading);

    //Create Panelbody / Append to main
    var panelbody = document.createElement("div");
    panelbody.className = "panel-body";
    panelbody.id = "AutoTraderContainer";
    panelmain.appendChild(panelbody);

    jNode.after(body);
    console.log ("Node found!");
}
function GetItemRarity(rarity){
    if(rarity == "item.q-440-1"){
        return "Genuine";
    }

    if(rarity == "item.q-440-3"){
        return "Vintage";
    }

    if(rarity == "item.q-440-5"){
        return "Unusual";
    }

    if(rarity == "item.q-440-6"){
        return "Normal";
    }
    if(rarity == "item.q-440-11"){
        return "Strange";
    }

    if(rarity == "item.q-440-13"){
        return "Haunted";
    }
}

function CreateElement(name,price,id,binary,binary2,marketable){

    //Item Frame
    var ItemsDisplay = document.createElement("ul");
    ItemsDisplay.className = "list-group col-sm-12";

    //Item Name
    var ItemName = document.createElement("li");
    ItemName.className = "list-group-item col-sm-3";
    ItemName.innerHTML =  name;
    ItemsDisplay.appendChild(ItemName);
    if(GetItemRarity(binary2) == "Genuine" ||GetItemRarity(binary2) == "Haunted"){
        ItemName.style.color = "green";
    }
    if(GetItemRarity(binary2) == "Normal"){
        ItemName.style.color = "yellow";
    }
    if(GetItemRarity(binary2) == "Strange"){
        ItemName.style.color = "red";
    }
    if(GetItemRarity(binary2) == "Unusual"){
        ItemName.style.color = "purple";
    }


    //Item Price
    var ItemPrice = document.createElement("li");
    ItemPrice.className = "list-group-item col-sm-3";
    ItemPrice.innerHTML = price;
    ItemsDisplay.appendChild(ItemPrice);


    //ItemID
    var ItemID = document.createElement("li");
    ItemID.className = "list-group-item col-sm-3";
    ItemID.innerHTML = id;
    ItemsDisplay.appendChild(ItemID);

    // Posted? y/n
    var ItemSale = document.createElement("li");
    ItemSale.className = "list-group-item col-sm-3";

    if(marketable === false){
        ItemSale.innerHTML = "Posting...";
        ItemSale.style.color = "green";
        ItemID.style.color = "green";
        ItemName.style.color = "green";
        ItemPrice.style.color = "green";
    }else{
        if(marketable === true){
            ItemSale.innerHTML = "Already Posted";
            ItemSale.style.color = "red";
            ItemID.style.color = "red";
            ItemName.style.color = "red";
            ItemPrice.style.color = "red";
        }

        if(marketable==125){
            ItemSale.innerHTML = "Is your post listed?";
            ItemSale.style.color = "purple";
            ItemID.style.color = "purple";
            ItemName.style.color = "purple";
            ItemPrice.style.color = "purple";
        }
    }
    
        ItemsDisplay.appendChild(ItemSale);

    var AutoTradeContainer = document.getElementById("AutoTraderContainer").appendChild(ItemsDisplay);
}

CreateElement("Name: ", "Sale Price: (BP.TF Price)"," Item ID",1,1,125);
function CreateAlert(items,num){
    var Alert = document.createElement("div");
    
    if(num === 0){
        Alert.className = "alert alert-danger";
        Alert.innerHTML = items + " items are already posted.";
    }

    if (num == 1 && items>=1){
        Alert.className = "alert alert-success";
        Alert.innerHTML = "You've posted " + items + " Items for sale.";
    }

    if (num == 2){
        Alert.className = "alert alert-success";
        Alert.innerHTML = "Total Post Worth: " + items;
    }

    if(num == 3){
        Alert.className = "alert alert-success";
        Alert.innerHTML = "Metal: "+items + " Refined";
    }
    var alertpost = document.getElementById("media-side").appendChild(Alert);
}

function LogItems(name,refined,id){
    console.log("|-----------------");
    console.log("| " + name);
    console.log("| " + refined);
    console.log("| " + id);
    console.log("|-----------------");
}

function log(text){
    console.log(text);
}

function AddTotalPostAmt(varr){
    TotalPostWorth = TotalPostWorth + varr;
}

function CheckPrice(price,amt){
    if(price>amt){return true;}
    if(price<amt){return false;}
}

function CheckItemSpecificPrice(name,price){
    ItemProfit.forEach(function(item,index){
        console.log(index + ": " + item[0]);
        
        if(name == item[0]){
          var ItemProfitPrice = price + item[1];
            console.log(name + " Profit ammount added: " + item[1] );
        }
    });
}

$(function(){
    
    $( "li.item" ).each(function( index ) {

        if($(this).attr("data-tradable")  == 1 && $(this).attr("data-listing_intent") === undefined && parseFloat($( this ).attr("data-p_bptf")) > 0 && $(this).attr("data-unlistable") != 1 ){
            
                var ItemDataID       = $( this ).attr("data-id");
                var ItemDataName     = $( this ).attr("title");
                var ItemDataRef      = $(this).attr("data-p_bptf");
                var ItemDataWorth    = parseFloat($( this ).attr("data-p_bptf"));
                var ItemDataSellable = $(this).attr("data-listing_intent");
                var ItemDataTradable = $(this).attr("data-tradable");
                var ItemClassName = $(this).className;
                var ItemProfitPrice =  0;
                ItemArray[index] = [ItemDataName,ItemDataRef,ItemDataID];
                ItemArray.sort();


               if(CheckPrice(ItemDataWorth,0.11) === false){ ItemProfitPrice = 0.11;}else{ItemProfitPrice=ItemDataWorth + MinimumProfit;}

            if(ItemDataWorth < 0.11){ // Sets things below .11 to .11
                ItemProfitPrice = 0.11;
            }else{
                if(Profit === true && ItemDataWorth >= 1){
                        ItemDataWorth = ItemDataWorth + MinimumProfit;
                }else{

                    if(ItemDataWorth<1 && LowProfit === true){//Less then 1 and lowprofit and profit is on +minimum profit
                        ItemDataWorth = ItemDataWorth + MinimumProfit;
                    }

                }
            }
            if($(this).attr("data-listing_intent") === undefined){
                CreateElement(ItemDataName,ItemProfitPrice+" Refined       (" + ItemDataWorth + " Refined)" ,ItemDataID,1,ItemClassName,false);
            }
            CheckItemSpecificPrice(ItemDataName);
            LogItems(ItemDataName,ItemDataRef,ItemDataID);
            SellableItemCount ++;
            SellItem(ItemDataID,ItemProfitPrice,ItemDataName);
            
            AddTotalPostAmt(ItemDataWorth);

            }else{
                var ItemDataID       = $( this ).attr("data-id");
                var ItemDataName     = $( this ).attr("title");
                var ItemDataRef      = $(this).attr("data-p_bptf");
                var ItemDataWorth    = parseFloat($( this ).attr("data-p_bptf"));
                var ItemDataSellable = $(this).attr("data-listing_intent");
                var ItemDataTradable = $(this).attr("data-tradable");
                var ItemClassName = $(this).className;
                var ItemProfitPrice = ItemDataWorth + MinimumProfit;
                ItemArray[index] = [ItemDataName,ItemDataRef,ItemDataID];
                ItemArray.sort();

                if($(this).attr("data-listing_intent") == 1){NonSellableItemCount++;
                    if(CheckPrice(ItemDataWorth,0.11) === false){ ItemProfitPrice = 0.11;}else{ItemProfitPrice=ItemDataWorth + MinimumProfit;}
                    AddTotalPostAmt(ItemDataWorth);
                    CreateElement(ItemDataName,ItemProfitPrice+" Refined       (" + ItemDataWorth + " Refined)" ,ItemDataID,1,ItemClassName,true);
                }

            if($(this).attr("data-name") == "Reclaimed Metal" || $(this).attr("data-name") == "Scrap Metal"){
                TotalMetal = TotalMetal + ItemDataWorth;
            }


        }// end of tradable/sellable if statement
    });// end of .each function
    console.log(NonSellableItemCount+ " Items already for sale.");
    CreateAlert(TotalMetal.toFixed(2),3);
    CreateAlert(SellableItemCount,1);
    CreateAlert(TotalPostWorth.toFixed(2),2);
    CreateAlert(NonSellableItemCount,0);
}); // End of jQuery Function
