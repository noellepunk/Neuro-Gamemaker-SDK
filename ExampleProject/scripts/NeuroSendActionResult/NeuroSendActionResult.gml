/// @function
/// @param {string}  _action_id  The id of the action that this result is for. This is grabbed from the action message directly.
/// @param {boolean}  _success  Whether or not the action was successful. If this is false and this action is part of an actions force, the whole actions force will be immediately retried by Neuro.
/// @param {string}  _result_message  A plaintext message that describes what happened when the action was executed. If not successful, this should be an error message. If successful, this can either be empty, or provide a small context to Neuro regarding the action she just took (e.g. "Remember to not share this with anyone."). This information will be directly received by Neuro.
/// @description              This message needs to be sent as soon as possible after an action is validated, to allow Neuro to continue.

function NeuroSendActionResult(_action_id = "", _success = false, _result_message = ""){
    var _actionresult =
    {
        command: "action/result",
        game: global.GameString,
        data: {
            id: _action_id, //string
            success: _success, //boolean
            message: _result_message //string?
        }
    }

    var Jason = json_stringify(_actionresult,true);
    
    var buff = buffer_create(string_byte_length(Jason), buffer_fixed, 1);
    buffer_write(buff, buffer_text, Jason);
    network_send_raw(global.socket, buff, buffer_tell(buff), network_send_text);
    return _success;
}