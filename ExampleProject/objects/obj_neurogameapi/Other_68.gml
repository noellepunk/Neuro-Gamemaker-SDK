/// @description Recieve sent actions from the websocket, this event is where you will give actions their functionality

if (ds_map_exists(async_load, "id")) {
    var _id = async_load[? "id"];
    if (_id == global.socket) {
        var _event_type = async_load[? "type"];
        if (_event_type == network_type_data) {
            var buffer = async_load[? "buffer"];
            var received_data = buffer_read(buffer, buffer_string);
            buffer_delete(buffer);

            // parse JSON data
            var jason_data = json_parse(received_data);
            
            try {
                if struct_get(jason_data,"command") == "action" {
                    var datastruct = struct_get(jason_data,"data");
                    var actionid = struct_get(datastruct,"id");
                    //execute code via name of action called (dont forget to provide an action result!)
                    switch struct_get(datastruct,"name") {
                        case "select_move":
                            
                            //execute code according to your action
                            var data = real(struct_get(datastruct,"data"));
                            show_debug_message(data);
                            var moveresult = 0;    
                            switch data {
                                case 0:
                                    moveresult = "rock";
                                 break;
                                
                                case 1:
                                    moveresult = "paper";
                                 break;
                                
                                case 2:
                                    moveresult = "scissors";
                                 break;
                                
                            }
                            
                            NeuroSendActionResult(actionid,true,"You have chosen : " + moveresult);
                            with obj_rockpaperscissors { 
                                global.neuro_selection = data;  
                                global.end_turn = true;
                            }    
                        break;
                    }
                }
            } catch (_error){
                var datastruct = struct_get(jason_data,"data");
                var actionid = struct_get(datastruct,"id");
                
                //very basic error message for when an action fails, you may want to change what is said depending on what action failed and why
                NeuroSendActionResult(actionid,false,"oops, something went wrong!");
            }
        }
        
        var jason_string = json_stringify(jason_data,true);
        jason_string = string_replace_all(jason_string,"\\","");
        show_debug_message(jason_string);
    }
}