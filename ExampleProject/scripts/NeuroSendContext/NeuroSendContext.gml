/*
This message can be sent to let Neuro know about something that is happening in game.
*/
function NeuroSendContext( _contextstring = "", _silent = true){
	var _context =
	{
	    command: "context",
	    game: global.GameString,
		data: {
			message: _contextstring,
			silent: _silent
		}
	}
	
	var Jason = json_stringify(_context,true);
	
	var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
	buffer_write(buff, buffer_text, Jason);
	network_send_raw(global.socket, buff, buffer_tell(buff));
}