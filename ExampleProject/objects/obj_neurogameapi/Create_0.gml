global.socket = network_create_socket(network_socket_ws);

//The port and url can be altered via changing this ini file if need be
//I figured it was probably a good idea to not have randy's port hardcoded, just in case vedal needs to change it
//this file can be found in: AppData\Local\[insert game name]\NeuroAPI
if !file_exists("websocket_settings.ini"){
    ini_open("NeuroAPI/websocket_settings.ini");
    ini_write_real("Port","port",8000);
    ini_write_string("Websocket URL","url","127.0.0.1");
    ini_close();
}

ini_open("NeuroAPI/websocket_settings.ini");
port = ini_read_real("Port", "port", 8000);
url = ini_read_string("URL", "url", "127.0.0.1");
ini_close();
connected = network_connect_raw(global.socket,url,port);
show_debug_message("CONNECTION STATUS : " + string(connected));

global.RegisteredActions = [];

//Insert game title here
global.GameString = "Rock Paper Scissors";
NeuroSendStartup();

//Declare your actions here

global.select_move = 
{
    name: "select_move",
    description: "Select a move, your options are : rock, paper, or scissors. \n remember that: 0 = rock, 1 = paper, 2 = scissors",
    schema: {
            "properties" : {
                "move": {      
                    "type": "integer",      
                    "minimum": 0,    
                    "maximum": 2    
                },
            },
        "required": [ "move" ]
    }
}