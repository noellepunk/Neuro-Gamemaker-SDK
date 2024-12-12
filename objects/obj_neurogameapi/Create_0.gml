client = network_create_socket(network_socket_ws);
port = 8000;
url = "127.0.0.1";
connected = network_connect_raw(client,url,port);
show_debug_message("CONNECTION STATUS : " + string(connected));

GameString = "[TEST]";


var ds_map = ds_map_create();
ds_map_add(ds_map,"command","startup");
ds_map_add(ds_map,"game",GameString);
var Jason = json_encode(ds_map,true);

var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
buffer_write(buff, buffer_text, Jason);
network_send_raw(client, buff, buffer_tell(buff));