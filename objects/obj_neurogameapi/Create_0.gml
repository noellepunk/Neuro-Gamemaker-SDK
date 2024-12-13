socket = network_create_socket(network_socket_ws);
port = 8000;
url = "127.0.0.1";
connected = network_connect_raw(socket,url,port);
show_debug_message("CONNECTION STATUS : " + string(connected));

global.RegisteredActions = [];

global.GameString = "TEST";
NeuroSendStartup();

NeuroSendForceAction(global.GameString,"test state","testing the state rn",true,global.RegisteredActions);