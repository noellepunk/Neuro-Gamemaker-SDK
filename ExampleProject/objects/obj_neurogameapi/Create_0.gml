global.socket = network_create_socket(network_socket_ws);
port = 8000;
url = "127.0.0.1";
connected = network_connect_raw(global.socket,url,port);
show_debug_message("CONNECTION STATUS : " + string(connected));

global.RegisteredActions = [];

global.GameString = "Tic Tac Toe";
NeuroSendStartup();

//top placements
PlaceTopLeft = 
{
    name: "place_top_left",
    description: "Marks an O in the top left corner of the board.",
	schema: {}
    
}
PlaceTopCenter = 
{
    name: "place_top_center",
    description: "Marks an O in the top center position of the board.",
	schema: {}
    
}
PlaceTopRight = 
{
    name: "place_top_right",
    description: "Marks an O in the top right corner of the board.",
	schema: {}
    
}


//middle placements
PlaceMiddleLeft = 
{
    name: "place_middle_left",
    description: "Marks an O in the middle left position of the board.",
	schema: {}
    
}
PlaceMiddleCenter = 
{
    name: "place_middle_center",
    description: "Marks an O in the middle position of the board.",
	schema: {}
    
}
PlaceMiddleRight = 
{
    name: "place_middle_right",
    description: "Marks an O in the middle right position of the board.",
	schema: {}
    
}


//bottom placements
PlaceBottomLeft = 
{
    name: "place_bottom_left",
    description: "Marks an O in the bottom left corner of the board.",
	schema: {}
    
}
PlaceBottomCenter = 
{
    name: "place_bottom_center",
    description: "Marks an O in the bottom center position of the board.",
	schema: {}
    
}
PlaceBottomRight = 
{
    name: "place_bottom_right",
    description: "Marks an O in the bottom right corner of the board.",
	schema: {}
    
}