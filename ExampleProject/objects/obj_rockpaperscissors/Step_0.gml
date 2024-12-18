

if global.end_turn {
    
    var playerstring = "";    
    switch global.player_selection {
        case 0:
            playerstring = "rock";
        break;
        
        case 1:
            playerstring = "paper";
        break;
        
        case 2:
            playerstring = "scissors";
        break;
    }
    
    var neurostring = "";    
    switch global.neuro_selection {
        case 0:
            neurostring = "rock";
        break;
        
        case 1:
            neurostring = "paper";
        break;
        
        case 2:
            neurostring = "scissors";
        break;
    }
    
    if resulttimer > 0 {
        if global.neuro_selection == global.player_selection || global.player_selection == global.neuro_selection {
            if register_points == false {  
                NeuroSendUnregisterAction(["select_move"]);
                NeuroSendContext("You both picked " + neurostring + "!" + "\n It's a tie!") 
                global.turn_result = result.tie;
                register_points = true;
            }
        }
        
        if (global.neuro_selection == move.scissors && global.player_selection == move.paper) || (global.neuro_selection == move.paper && global.player_selection == move.rock) || (global.neuro_selection == move.rock && global.player_selection == move.scissors) {
            if register_points == false  { 
                neuro_score++; 
                NeuroSendUnregisterAction(["select_move"]);
                NeuroSendContext(neurostring + " beats " + playerstring + "! " + "\n You win!")
                global.turn_result = result.neurowin;
                register_points = true;
            }
        }
        
        if (global.player_selection == move.scissors && global.neuro_selection == move.paper) || (global.player_selection == move.paper && global.neuro_selection == move.rock) || (global.player_selection == move.rock && global.neuro_selection == move.scissors) {
            if register_points == false  { 
                player_score++;
                NeuroSendUnregisterAction(["select_move"]);
                NeuroSendContext(playerstring + " beats " + neurostring + "! " + "\n Opponent wins!")
                global.turn_result = result.playerwin;
                register_points = true;
            }
        }
    }
    
    if resulttimer-- <= 0 {
        global.player_selection = -1;
        global.neuro_selection = -1;
        global.turn_result = -1; 
        turn_number++;
        resulttimer = resulttimermax;
        global.player_turn = true;
        register_points = false;
        NeuroSendContext("Turn number : " + string(turn_number) + "\n It is currently your opponent's turn to choose.") 
        global.end_turn = false;
    }
}

switch global.player_selection {
    case move.rock:
        player_select_sprite = spr_rock;
    break;
    
    case move.scissors:
        player_select_sprite = spr_scissors;
    break;
        
    case move.paper:
        player_select_sprite = spr_paper;
    break;
        
    case -1:
        player_select_sprite = spr_blank;
    break;
}

switch global.neuro_selection {
    case move.rock:
        neuro_select_sprite = spr_rock;
    break;
    
    case move.scissors:
        neuro_select_sprite = spr_scissors;
    break;
        
    case move.paper:
        neuro_select_sprite = spr_paper;
    break;
    
    case -1:
        neuro_select_sprite = spr_blank;
    break;
}