/*
This message needs to be sent as soon as possible after an action is validated, to allow Neuro to continue.
*/
function NeuroSendActionResult(_action_id = "", _success = false, _result_message = ""){
	var _actionresult =
	{
	    command: "action/result",
	    game: global.GameString,
	    data: {
	        id: _action_id, //string
	        success: _success, //boolean
	        message: _result_message //string?
	    }
	}

	var Jason = json_stringify(_actionresult,true);
	
	var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
	buffer_write(buff, buffer_text, Jason);
	network_send_raw(global.socket, buff, buffer_tell(buff));
}