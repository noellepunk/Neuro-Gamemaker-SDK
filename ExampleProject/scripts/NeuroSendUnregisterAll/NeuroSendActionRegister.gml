function NeuroSendContext(_gamestring = "", _actionarray = []){
	var _startup =
	{
	    command: "actions/register",
	    game: _gamestring,
	    data: {
	        actions: _actionarray
	    }
	}
	
	var Jason = json_stringify(_startup,true);
	
	var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
	buffer_write(buff, buffer_text, Jason);
	network_send_raw(client, buff, buffer_tell(buff));
}