/// @description Create websocket connection, initiate startup, and register actions

global.socket = network_create_socket(network_socket_ws);

//The port and url can be altered via changing this ini file if need be
//I figured it was probably a good idea to not have randy's port hardcoded, just in case vedal needs to change it
//this file can be found in: 'AppData\Local\[insert game name]\NeuroAPI'
if !file_exists("websocket_settings.ini"){
    ini_open("NeuroAPI/websocket_settings.ini");
    ini_write_real("Port","port",8000);
    ini_write_string("Websocket URL","url","127.0.0.1");
    ini_close();
}
//the default ip "127.0.0.1" is used to connect back to the device currently running the game
//I personally don't recommend changing it
ini_open("NeuroAPI/websocket_settings.ini");
port = ini_read_real("Port", "port", 8000);
url = ini_read_string("URL", "url", "127.0.0.1");
ini_close();
connected = network_connect_raw(global.socket,url,port);
show_debug_message("CONNECTION STATUS : " + string(connected));

global.RegisteredActions = [];

//Insert game title here
global.GameString = "";
NeuroSendStartup();

//Declare your actions here

//An example action has already been declared for reference
global.example_action = 
{
    name: "example_action",
    description: "Example description for an example action",
    schema: {
            "properties" : {
                "example": {      
                    "type": "integer"
                },
            },
        "required": [ "example" ],
        "type": "object"
    }
}