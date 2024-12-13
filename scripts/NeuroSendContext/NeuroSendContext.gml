/*
This message can be sent to let Neuro know about something that is happening in game.
*/
function NeuroSendContext(_GameString = global.GameString, _contextstring = "", _silent = true){
	var _context =
	{
	    command: "context",
	    game: _GameString,
		data: {
			message: _contextstring,
			silent: _silent
		}
	}
	
	var Jason = json_stringify(_context,true);
	
	var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
	buffer_write(buff, buffer_text, Jason);
	network_send_raw(socket, buff, buffer_tell(buff));
}