const fetch = require('node-fetch');
var sleep = require('thread-sleep');


var lg_GangOrb = "356563"
var xl_healthkit = "355139"
var count = 0;
var total = 1;
var times;


function GetStats(){
    fetch("http://www.gangwarsmobile.com/index.php", {
        "credentials":"include",
        "headers":{
            "Accept-Encoding": "gzip, deflate",
            "Accept-Language": "en-US,en;q=0.9",
            "Connection": "keep-alive",
            "Content-Length": "22",
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Cookie": "PHPSESSID=fIu9Rat2ne%2C-W-RTsvsPF0; __utmc=50526015; __utmz=50526015.1527880265.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utma=50526015.1198693744.1527880265.1527880265.1527886897.2; __utmt=1; __utmb=50526015.68.10.1527886897",
            "Host": "www.gangwarsmobile.com",
            "Origin": "http://www.gangwarsmobile.com",
            "Referer": "http://www.gangwarsmobile.com/index.php",
            "User-Agent": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36",
            "X-Requested-With": "XMLHttpRequest",
        },
        "referrer":"http://www.gangwarsmobile.com/index.php",
        "referrerPolicy":"no-referrer-when-downgrade",
        "body":"pageaction=_gameevents",
        "method":"POST",
        "mode":"cors"})
        .then((res) => {
            console.log(res.json)
        });

        
}

function GW(action,district,x1,x2,y1,y2){
    //UseItem(356563);
    for(x=x1;x!=x2+1;x++){
        for(y=y1;y!=y2+1;y++){
            console.log(total + " || x: " + x + " | y: "+y)
            fetch("http://www.gangwarsmobile.com/index.php",{
                "credentials":"include",
                "headers":{
                    "Accept-Encoding": "gzip, deflate",
                    "Accept-Language": "en-US,en;q=0.9",
                    "Connection": "keep-alive",
                    "Content-Length": "54",
                    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                    "Cookie":" PHPSESSID=fIu9Rat2ne%2C-W-RTsvsPF0; __utmc=50526015; __utmz=50526015.1527880265.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utma=50526015.1198693744.1527880265.1527880265.1527886897.2; __utmt=1; __utmb=50526015.10.10.1527886897",
                    "Host": "www.gangwarsmobile.com",
                    "Origin": "http://www.gangwarsmobile.com",
                    "Referer": "http://www.gangwarsmobile.com/index.php?p=gang",
                    "User-Agent": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36",
                    "X-Requested-With": "XMLHttpRequest",
                },
                "referrer":"http://www.gangwarsmobile.com/index.php?p=gang",
                "referrerPolicy":"no-referrer-when-downgrade",
                "body":"pageaction=gang&action="+action+"&district="+district+"&x="+x+"&y="+y,
                "method":"POST",
                "mode":"cors"
            });

            switch(action){
                case "capture":
                    if(count == 8){
                        UseItem(356563);
                        count = 0;
                    }else{
                        count++;
                    };
                    break;
                case "attack":
                    if(count == 40){
                        UseItem(356563);
                        count = 0;
                    }else{
                        count++;
                    };
                    break;
                case "tankattack":
                    if(count == 30){
                        UseItem(356563);
                        count = 0;
                    }else{
                        count++;
                    };
                case "defend":
                    if(count == 60){
                        UseItem(356563);
                        count = 0;
                    }else{
                        count++;
                    }
            }


            total = total + 1;
        }
    }
}
/*
            fetch("http://www.gangwarsmobile.com/index.php",{
                "credentials":"include",
                "headers":{
                    "Accept-Encoding": "gzip, deflate",
                    "Accept-Language": "en-US,en;q=0.9",
                    "Connection": "keep-alive",
                    "Content-Length": "54",
                    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                    "Cookie":" PHPSESSID=fIu9Rat2ne%2C-W-RTsvsPF0; __utmc=50526015; __utmz=50526015.1527880265.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utma=50526015.1198693744.1527880265.1527880265.1527886897.2; __utmt=1; __utmb=50526015.10.10.1527886897",
                    "Host": "www.gangwarsmobile.com",
                    "Origin": "http://www.gangwarsmobile.com",
                    "Referer": "http://www.gangwarsmobile.com/index.php?p=gang",
                    "User-Agent": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36",
                    "X-Requested-With": "XMLHttpRequest",
                },
                "referrer":"http://www.gangwarsmobile.com/index.php?p=gang",
                "referrerPolicy":"no-referrer-when-downgrade",
                "body":"pageaction=gang&action="+action+"&district="+district+"&x="+x+"&y="+y,
                "method":"POST",
                "mode":"cors"
            });
*/

function UseItem(itemid){
    fetch("http://www.gangwarsmobile.com/index.php", {
        "credentials":"include",
        "headers":{
            "Accept-Encoding": "gzip, deflate",
            "Accept-Language": "en-US,en;q=0.9",
            "Connection": "keep-alive",
            "Content-Length": "54",
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Cookie":" PHPSESSID=fIu9Rat2ne%2C-W-RTsvsPF0; __utmc=50526015; __utmz=50526015.1527880265.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utma=50526015.1198693744.1527880265.1527880265.1527886897.2; __utmt=1; __utmb=50526015.10.10.1527886897",
            "Host": "www.gangwarsmobile.com",
            "Origin": "http://www.gangwarsmobile.com",
            "Referer": "http://www.gangwarsmobile.com/index.php?p=inventory",
            "User-Agent": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36",
            "X-Requested-With": "XMLHttpRequest",
        },
        "referrer":"http://www.gangwarsmobile.com/index.php?p=inventory",
        "referrerPolicy":"no-referrer-when-downgrade",
        "body":"pageaction=inventory&res_refresh=1&use=1&itemid="+itemid,
        "method":"POST",
        "mode":"cors"
    });
}

function Craft(itemid,times,delay){
    for(i=0;i!=times;i++){
        console.log("Sending POST Request #"+(i+1))
        fetch("http://www.gangwarsmobile.com/index.php", {
            method:"POST",
            "headers":{
                "Accept-Encoding": "gzip, deflate",
                "Accept-Language": "en-US,en;q=0.9",
                "Connection": "keep-alive",
                "Content-Length": "57",
                "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                "Cookie": "PHPSESSID=fIu9Rat2ne%2C-W-RTsvsPF0; __utma=50526015.1198693744.1527880265.1527880265.1527880265.1; __utmc=50526015; __utmz=50526015.1527880265.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmt=1; __utmb=50526015.116.10.1527880265",
                "Host": "www.gangwarsmobile.com",
                "Origin": "http://www.gangwarsmobile.com",
                "Referer": "http://www.gangwarsmobile.com/index.php?p=craft_item&res_refresh=1&itemid=449756",
                "User-Agent": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36",
                "X-Requested-With": "XMLHttpRequest"
            },
            "body":"pageaction=craft_item&res_refresh=0&craft=1&itemid=" + itemid,
            "method":"POST",
        })
        .then((res) => {
            console.log(res.json)
            Craft(itemid,times,delay);
        });
    };
};

function Hospital(HospitalID){
    fetch("http://www.gangwarsmobile.com/index.php", {
        "credentials":"include",
        "headers":{
            "Accept-Encoding": "gzip, deflate",
            "Accept-Language": "en-US,en;q=0.9",
            "Connection": "keep-alive",
            "Content-Length": "54",
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Cookie": "PHPSESSID=fIu9Rat2ne%2C-W-RTsvsPF0; __utmc=50526015; __utmz=50526015.1527880265.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utma=50526015.1198693744.1527880265.1527880265.1527886897.2; __utmt=1; __utmb=50526015.355.10.1527886897",
            "Host": "www.gangwarsmobile.com",
            "Origin": "http://www.gangwarsmobile.com",
            "Referer": "http://www.gangwarsmobile.com/index.php?p=crimes",
            "User-Agent": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36",
            "X-Requested-With": "XMLHttpRequest",
        },
        "referrer":"http://www.gangwarsmobile.com/index.php?p=crimes",
        "referrerPolicy":"no-referrer-when-downgrade",
        "body":"commit=1&crime="+CrimeID+"&pageaction=crimes",
        "method":"POST",
        "mode":"cors"
    })
    .then((res) => {
        console.log(res.json)
        Crime(CrimeID);
    });
    total++
}

function Crime(CrimeID){
    console.log("Crime #"+total + " || Count #"+(count+1))
    fetch("http://www.gangwarsmobile.com/index.php", {
        "credentials":"include",
        "headers":{
            "Accept-Encoding": "gzip, deflate",
            "Accept-Language": "en-US,en;q=0.9",
            "Connection": "keep-alive",
            "Content-Length": "54",
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
            "Cookie": "PHPSESSID=fIu9Rat2ne%2C-W-RTsvsPF0; __utmc=50526015; __utmz=50526015.1527880265.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utma=50526015.1198693744.1527880265.1527880265.1527886897.2; __utmt=1; __utmb=50526015.355.10.1527886897",
            "Host": "www.gangwarsmobile.com",
            "Origin": "http://www.gangwarsmobile.com",
            "Referer": "http://www.gangwarsmobile.com/index.php?p=crimes",
            "User-Agent": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36",
            "X-Requested-With": "XMLHttpRequest",
        },
        "referrer":"http://www.gangwarsmobile.com/index.php?p=crimes",
        "referrerPolicy":"no-referrer-when-downgrade",
        "body":"commit=1&crime="+CrimeID+"&pageaction=crimes",
        "method":"POST",
        "mode":"cors"
    })
    .then((res) => {
        console.log(res.json)
        Crime(CrimeID);
    });

    if(count >= 250){
        UseItem(xl_healthkit);
        count = 0;
    }

    count++;
    total++
}

// Craft(ItemID,amount to craft, delay)
// UseItem(ItemID)
// GetStats()

// GW(Action,District,Starting X, Ending X, Starting Y, Ending Y)
// (This is to affect a rectangle of tiles)

times = 10;

for(o=0;o!=times;o++){
    //GW("defend","Downtown",1,8,11,14);
    //Craft(443237,1,1000);
    //UseItem(356563);
    Crime(26);
    sleep(500)
};
