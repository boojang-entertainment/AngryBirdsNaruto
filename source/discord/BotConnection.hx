package discord;
import hxwebsocket.WebSocketClient;
import hxwebsocket.WebSocketMessage;
import Sys.*;
import haxe.Json;
class BotConnection {
    private var socket:WebSocketClient;

    public function new() {
        socket = new WebSocketClient();
        socket.onOpen = handleOpen;
        socket.onMessage = handleMessage;
        socket.onError = handleError;
        socket.onClose = handleClose;
    }

    public function connect():Void {
		socket.connect("wss://gateway.discord.gg/?v=9&encoding=json");
    }

    private function handleOpen():Void {
        // Handle WebSocket connection open event
		var identifyPayload:Dynamic = {
			op: 2, // Identify opcode
			d: {
				token: "0297", // Replace with your bot token
				intents: 513, // Replace with the desired intents
				properties: { $os:Sys.systemName()}
			}
		};

		socket.send(Json.stringify(identifyPayload));
    }

    private function handleMessage(message:WebSocketMessage):Void {
        // Handle WebSocket message received event
    }

    private function handleError(error:String):Void {
        // Handle WebSocket error event
    }

    private function handleClose(code:Int, reason:String):Void {
        // Handle WebSocket connection close event
    }

}
