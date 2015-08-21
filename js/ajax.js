function getXmlHttp() {
    var xmlhttp;
    try{
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch(e){
        try{
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch(E){
            xmlhttp = false;
        }
    }
    if(!xmlhttp && typeof XMLHttpRequest!='undefined'){
        xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
}
var xmlhttp = getXmlHttp();
function send() {
    var data = document.getElementById('text').value;
    xmlhttp.open('GET','controller_chat.php?text='+data,true);
    xmlhttp.send(null);
}
function update() {
    xmlhttp.open('GET','update.php',true);
    xmlhttp.onreadystatechange = function() {
        if(xmlhttp.readyState == 4) {
            document.getElementById('textarea').innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.send(null);
}
setInterval(update,100);