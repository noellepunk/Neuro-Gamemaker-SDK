/*
This message registers one or more actions for Neuro to use.
*/
function NeuroSendRegisterAction( _actionarray = []){
	var _actionregister =
	{
	    command: "actions/register",
	    game: global.GameString,
	    data: {
	        actions: _actionarray
	    }
	}
	
	array_push(global.RegisteredActions,_actionarray);
	
	var Jason = json_stringify(_actionregister,true);
	
	var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
	buffer_write(buff, buffer_text, Jason);
	network_send_raw(global.socket, buff, buffer_tell(buff));
}