/// @function
/// @param {string}  _state  An arbitrary string that describes the current state of the game. This can be plaintext, JSON, Markdown, or any other format. This information will be directly received by Neuro.
/// @param {string}  _query  A plaintext message that tells Neuro what she is currently supposed to be doing (e.g. "It is now your turn. Please perform an action. If you want to use any items, you should use them before picking up the shotgun."). This information will be directly received by Neuro.
/// @param {boolean}  _eph_context  If false, the context provided in the state and query parameters will be remembered by Neuro after the actions force is compelted. If true, Neuro will only remember it for the duration of the actions force.
/// @param {array}  _action_names  The names of the actions that Neuro should choose from.
/// @description              This message forces Neuro to execute one of the listed actions as soon as possible. Note that this might take a bit if she is already talking. Please note that Neuro can only handle one action force at a time. Sending an action force while another one is in progress will cause problems!

function NeuroSendForceAction( _state = "", _query = "",_eph_context = false, _action_names = []){
    var _actionforce =
    {
        command: "actions/force",
        game: global.GameString,
        data: {
            state: _state,
            query: _query,
            ephemeral_context: _eph_context, // Defaults to false
            action_names: _action_names
        }
    }

    var Jason = json_stringify(_actionforce,true);
    
    var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
    buffer_write(buff, buffer_text, Jason);
    network_send_raw(global.socket, buff, buffer_tell(buff), network_send_text);
    return _action_names;
}