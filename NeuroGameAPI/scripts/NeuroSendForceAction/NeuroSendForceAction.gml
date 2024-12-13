/*
This message forces Neuro to execute one of the listed actions as soon as possible. Note that this might take a bit if she is already talking.

IMPORTANT! Neuro can only handle one action force at a time.
Sending an action force while another one is in progress will cause problems!
*/
function NeuroSendForceAction(_GameString = global.GameString, _state = "", _query = "",_eph_context = false, _action_names = []){
	var _actionforce =
	{
	    command: "actions/force",
	    game: _GameString,
	    data: {
	        state: _state,
	        query: _query,
	        ephemeral_context: _eph_context, // Defaults to false
	        action_names: _action_names
	    }
	}

	var Jason = json_stringify(_actionforce,true);
	
	var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
	buffer_write(buff, buffer_text, Jason);
	network_send_raw(socket, buff, buffer_tell(buff));
}