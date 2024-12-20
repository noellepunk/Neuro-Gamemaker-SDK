/// @function
/// @param {array}  _actionarray  An array of actions to be registered. If you try to register an action that is already registered, it will be ignored.
/// @description              This message registers one or more actions for Neuro to use.

function NeuroSendRegisterAction( _actionarray = []){
    var _actionregister =
    {
        command: "actions/register",
        game: global.GameString,
        data: {
            actions: _actionarray
        }
    }
        
    for (var i = 0; i < array_length(_actionarray); i++) {
        array_push(global.RegisteredActions,_actionarray[i]);
    }
    show_debug_message(global.RegisteredActions);
    
    var Jason = json_stringify(_actionregister,true);
    
    var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
    buffer_write(buff, buffer_text, Jason);
    network_send_raw(global.socket, buff, buffer_tell(buff), network_send_text);
    return _actionarray;
}