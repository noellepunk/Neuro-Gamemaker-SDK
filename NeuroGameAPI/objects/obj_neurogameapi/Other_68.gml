if (ds_map_exists(async_load, "id")) {
    var _id = async_load[? "id"];
    if (_id == socket) {
        var _event_type = async_load[? "type"];
        if (_event_type == network_type_data) {
            var buffer = async_load[? "buffer"];
            var received_data = buffer_read(buffer, buffer_string);
            buffer_delete(buffer);

            // Parse JSON data
            var jason_data = json_parse(received_data);
			var jason_string = json_stringify(jason_data,true);
			jason_string = string_replace_all(jason_string,"\\","");
			
			show_debug_message(jason_string);
        }
    }
}