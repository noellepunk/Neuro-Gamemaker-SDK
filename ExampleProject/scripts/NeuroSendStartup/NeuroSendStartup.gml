/// @function
/// @description              This message should be sent as soon as the game starts, to let Neuro know that the game is running. This message clears all previously registered actions for this game and does initial setup, and as such should be the very first message that you send.

function NeuroSendStartup(){
    var _startup =
    {
        command: "startup",
        game: global.GameString
    }
    
    var Jason = json_stringify(_startup,true);
    
    var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
    buffer_write(buff, buffer_text, Jason);
    network_send_raw(global.socket, buff, buffer_tell(buff), network_send_text);
}