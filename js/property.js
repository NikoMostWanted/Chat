function getXmlHttp() {
    var xmlhttp;
    try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            xmlhttp = false;
        }
    }
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
        xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
}
var xmlhttp = getXmlHttp();
function send() {
    var data = document.getElementById('inputText').value;
    document.getElementById('inputText').value = null;
    xmlhttp.open('GET', 'controller_insert.php?text=' + data, true);
    xmlhttp.send(null);
}
function update() {
    xmlhttp.open('GET', 'controller_update.php', true);
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4) {
            var data = JSON.parse(xmlhttp.responseText);
            var text = '';
            for (var i = 0; i < data.length; i++) {
                text += data[i].firstName + ' ' + data[i].lastName + '(' + data[i].time + '): ' + data[i].text + '\n';
            }
            document.getElementById('textOut').innerHTML = text;
            delete text;
        }
    }
    xmlhttp.send(null);
}
document.onkeyup = function () {
    var e = window.event;
    if (e.keyCode === 13) {
        send();
    }
    return false;
}
setInterval(update, 200);