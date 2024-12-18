draw_set_font(comicsans);
draw_set_halign(fa_center);
draw_text(display_get_gui_width()/2,96,"Player : " + string(player_score) + "                                            " + "Neuro : " + string(neuro_score));

var selectx = 384;
var selecty = 32;

draw_sprite_ext(player_select_sprite,0,selectx,display_get_gui_height()/2 - selecty,2,2,0,c_white,1);
draw_sprite_ext(neuro_select_sprite,0,display_get_gui_width() - selectx,display_get_gui_height()/2 - selecty,2,2,0,c_white,1);

var winner;



if global.end_turn {
    
    if global.turn_result == result.neurowin {
        draw_text(display_get_gui_width()/2,display_get_gui_height() - 96,"Neuro wins!")
    } else if global.turn_result == result.playerwin {
        draw_text(display_get_gui_width()/2,display_get_gui_height() - 96,"Player wins!")
    } else {
        draw_text(display_get_gui_width()/2,display_get_gui_height() - 96,"Tie!")
    }
}