if global.player_turn {
    global.player_selection = type;
    
    NeuroSendContext("Your opponent has picked a move, it is now your turn to choose.")
    
    NeuroSendRegisterAction([global.select_move]);
    
    global.player_turn = false;
}