draw_self();
/*
for (var i = 0; i < ds_grid_width(global.grid); ++i) {
	for (var z = 0; z < ds_grid_height(global.grid); ++z) {
		if ds_grid_get(global.grid,i,z) == "X" {
			draw_sprite(spr_x,0,469 * ( i + 0.25),180 * (z + 0.25));	
		} else if ds_grid_get(global.grid,i,z) == "O" {
			draw_sprite(spr_o,0,469 * ( i + 0.25),180 * (z + 0.25));	
		}
	}
}