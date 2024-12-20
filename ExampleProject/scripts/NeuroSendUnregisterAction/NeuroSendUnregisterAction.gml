/// @function
/// @param {array}  _actionnames  The names of the actions to unregister. If you try to unregister an action that isn't registered, there will be no problem.
/// @description              This message unregisters one or more actions, preventing Neuro from using them anymore.

function NeuroSendUnregisterAction(_actionnames = []){
    var _actionunregister =
    {
        command: "actions/unregister",
        game: global.GameString,
        data: {
            action_names: _actionnames
        }
    }
    
    for (var i = 0; i < array_length(_actionnames); ++i) {
        for (var z = 0; z < array_length(global.RegisteredActions); z++) {
            if global.RegisteredActions[z].name == _actionnames[i] {
                array_delete(global.RegisteredActions,z,1);
            }
        }
    }
    show_debug_message(global.RegisteredActions);
    
    var Jason = json_stringify(_actionunregister,true);
    
    var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
    buffer_write(buff, buffer_text, Jason);
    network_send_raw(global.socket, buff, buffer_tell(buff), network_send_text);
    return _actionnames;
}