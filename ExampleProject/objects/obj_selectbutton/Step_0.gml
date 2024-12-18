if global.player_turn {
    active = true;
} else {
    active = false;
}

switch type {
    case move.rock:
        button_sprite = spr_rock;
     break;
    
    case move.scissors:
        button_sprite = spr_scissors;
    break;
        
    case move.paper:
        button_sprite = spr_paper;
    break;
    
}