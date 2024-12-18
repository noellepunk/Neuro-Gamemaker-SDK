global.player_turn = true;

player_score = 0;
neuro_score = 0;

turn_number = 1;

global.end_turn = false;
global.turn_result = -1;

global.player_selection = -1;
global.neuro_selection = -1;

player_select_sprite = spr_rock;
neuro_select_sprite = spr_rock;

resulttimermax = 270;
resulttimer = resulttimermax;

register_points = false;

enum move {
    rock = 0,
    paper = 1,
    scissors = 2
}

enum result {
    playerwin = 0,
    neurowin = 1,
    tie = 2
}

NeuroSendContext("Turn number : " + string(turn_number) + "\n It is currently your opponent's turn to choose.")