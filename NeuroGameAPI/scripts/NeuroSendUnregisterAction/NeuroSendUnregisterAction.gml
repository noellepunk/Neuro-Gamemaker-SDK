/*
This message unregisters one or more actions, preventing Neuro from using them anymore.
*/
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
        var index = array_get_index(global.RegisteredActions,_actionnames[i]);
        if index != -1 {	
            array_delete(global.RegisteredActions,index,1);
        }
    }
    
    var Jason = json_stringify(_actionunregister,true);
    
    var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
    buffer_write(buff, buffer_text, Jason);
    network_send_raw(global.socket, buff, buffer_tell(buff));
}