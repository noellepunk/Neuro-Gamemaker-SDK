if draw_select && global.playerturn {	
	draw_sprite_ext(spr_x,0,x,y,1,1,0,c_white,0.5);	
}


if activated {
	if owner == "X" {
		draw_sprite_ext(spr_x,0,x,y,1,1,0,c_white,1);
	} else if owner == "O" {
		draw_sprite_ext(spr_o,0,x,y,1,1,0,c_white,1);
	}	
}