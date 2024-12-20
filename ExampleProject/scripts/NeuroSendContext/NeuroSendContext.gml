/// @function
/// @param {string}  _contextstring  A plaintext message that describes what is happening in the game. This information will be directly received by Neuro.
/// @param {boolean}  _silent  If true, the message will be added to Neuro's context without prompting her to respond to it. If false, Neuro might respond to the message directly, unless she is busy talking to someone else or to chat.
/// @description              This message can be sent to let Neuro know about something that is happening in game.

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
    network_send_raw(global.socket, buff, buffer_tell(buff), network_send_text);
    return _contextstring;
}