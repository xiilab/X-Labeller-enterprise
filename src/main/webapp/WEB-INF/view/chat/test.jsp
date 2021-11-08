<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chat</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" >
 
    var sock = null;
    var message = {};
	
    
    
    $(document).ready(function(){
    	var room = "test1";
    	
    	
    	chatSock = new SockJS("${pageContext.request.contextPath}/echo-ws?room="+room);
        chatSock.onopen = function() {
            
            message={};
            message.message = "반갑습니다.";
            message.type = "all";
            message.to = "all";
//             message.room = "test";
            chatSock.send(JSON.stringify(message));
        };
         
        chatSock.onmessage = function(evt) {
            $("#chatMessage").append(evt.data);
            $("#chatMessage").append("<br />");
            $("#chatMessage").scrollTop(99999999);
        };
         
        chatSock.onclose = function() {
            // sock.send("채팅을 종료합니다.");
        }
         
         $("#message").keydown(function (key) {
             if (key.keyCode == 13) {
                $("#sendMessage").click();
             }
          });
         
        $("#sendMessage").click(function() {
            if( $("#message").val() != "") {
                 
                message={};
                message.message = $("#message").val();
                message.type = "all";
                message.to = "all";
                 
                var to = $("#to").val();
                if ( to != "") {
                    message.type = "one";
                    message.to = to;
                }
                 
                chatSock.send(JSON.stringify(message));
                $("#chatMessage").append("나 ->  " + $("#message").val() + "<br/>");
                $("#chatMessage").scrollTop(99999999);
                 
                $("#message").val("");
            }
        });
    });
</script>
</head>
<body>
	
    <input type="button" id="sendMessage" value="엔터" />
    <input type="text" id="message" placeholder="메시지 내용"/>
    <input type="text" id="to" placeholder="귓속말대상"/>
    <div id="chatMessage" style="overFlow: auto; max-height: 500px;"></div>
</body>
</html>
