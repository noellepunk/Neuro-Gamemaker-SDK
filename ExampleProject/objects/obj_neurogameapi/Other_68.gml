if (ds_map_exists(async_load, "id")) {
    var _id = async_load[? "id"];
    if (_id == global.socket) {
        var _event_type = async_load[? "type"];
        if (_event_type == network_type_data) {
            var buffer = async_load[? "buffer"];
            var received_data = buffer_read(buffer, buffer_string);
            buffer_delete(buffer);

            // Parse JSON data
            var jason_data = json_parse(received_data);
			
			if struct_get(jason_data,"command") == "action" {
				if struct_exists(jason_data,"name"){
					switch struct_get(jason_data,"name") {
						case "place_top_left": 
							with obj_button {
								if id_x == 0 && id_y == 0 {
									claimO(id_x,id_y,jason_data,"Placed an O in the top left corner.");
								}
							}
						 break;
						case "place_top_center": 
							with obj_button {
								if id_x == 1 && id_y == 0 {
									claimO(id_x,id_y,jason_data,"Placed an O in the top center position.");
								}
							}
						 break;
						case "place_top_right": 
							with obj_button {
								if id_x == 2 && id_y == 0 {
									claimO(id_x,id_y,jason_data,"Placed an O in the top right position.");
								}
							}
						 break;
						case "place_middle_left": 
							with obj_button {
								if id_x == 0 && id_y == 1 {
									claimO(id_x,id_y,jason_data,"Placed an O in the middle left position.");
								}
							}
						 break;
						case "place_middle_center": 
							with obj_button {
								if id_x == 1 && id_y == 1 {
									claimO(id_x,id_y,jason_data,"Placed an O in the middle center position.");
								}
							}
						 break;
						case "place_middle_right": 
							with obj_button {
								if id_x == 2 && id_y == 1 {
									claimO(id_x,id_y,jason_data,"Placed an O in the middle right position.");
								}
							}
						 break;
						case "place_bottom_left": 
							with obj_button {
								if id_x == 0 && id_y == 2 {
									claimO(id_x,id_y,jason_data,"Placed an O in the bottom left corner.");
								}
							}
						 break;
						case "place_bottom_center": 
							with obj_button {
								if id_x == 1 && id_y == 2 {
									claimO(id_x,id_y,jason_data,"Placed an O in the bottom center position.");
								}
							}
						 break;
						case "place_bottom_right": 
							with obj_button {
								if id_x == 2 && id_y == 2 {
									claimO(id_x,id_y,jason_data,"Placed an O in the bottom right corner.");
								}
							}
						 break;
					}
				}
			}

			
			var jason_string = json_stringify(jason_data,true);
			jason_string = string_replace_all(jason_string,"\\","");
			show_debug_message(jason_string);
        }
    }
}