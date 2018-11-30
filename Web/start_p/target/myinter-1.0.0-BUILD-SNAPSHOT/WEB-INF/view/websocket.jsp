<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Testing websockets</title>
</head>
<body>
<fieldset>
    <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
    <br/>
    <input id="nickName" type="text"/>
    <input id="inputMessage" type="text"/>
    <input type="submit" value="send" onclick="send()" />
</fieldset>
</body>
<script type="text/javascript">
    var nickname = document.getElementById("nickName");
    var textarea = document.getElementById("messageWindow");
    var inputMessage = document.getElementById('inputMessage');
    var webSocket = new WebSocket('ws://49.236.136.179:8080/hehe/broadcasting');


    webSocket.onerror = function(event) {
        onError(event)
    };

    webSocket.onopen = function(event) {
        onOpen(event)
    };

    webSocket.onmessage = function(event) {
        onMessage(event)
    };
    
    
    
    

    function onMessage(event) {
        textarea.value += event.data + "\n";
    }

    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }

    function onError(event) {
        alert(event.data);
    }
/*
    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(nickname.value + " : " + inputMessage.value);
        inputMessage.value = "";
    }
 */   
</script>
</html>