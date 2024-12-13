/*
Unregisters all registered actions.
*/
function NeuroSendUnregisterAll(_GameString = ""){
	var _actionunregister =
	{
	    command: "actions/unregister",
	    game: _GameString,
	    data: {
	        action_names: global.RegisteredActions
	    }
	}
	
	array_delete(global.RegisteredActions,0,array_length(global.RegisteredActions));
	
	var Jason = json_stringify(_actionunregister,true);
	
	var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
	buffer_write(buff, buffer_text, Jason);
	network_send_raw(socket, buff, buffer_tell(buff));
}