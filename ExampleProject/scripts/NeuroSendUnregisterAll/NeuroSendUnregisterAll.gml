/// @function
/// @description              This function will unregister every action contained in the global.RegisteredActions

function NeuroSendUnregisterAll(){
    var _actionunregister =
    {
        command: "actions/unregister",
        game: global.GameString,
        data: {
            action_names: global.RegisteredActions
        }
    }
    
    array_delete(global.RegisteredActions,0,array_length(global.RegisteredActions));
    show_debug_message(global.RegisteredActions);
    
    var Jason = json_stringify(_actionunregister,true);
    
    var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
    buffer_write(buff, buffer_text, Jason);
    network_send_raw(global.socket, buff, buffer_tell(buff), network_send_text);
}