global.grid = ds_grid_create(3,3);
ds_grid_set_region(global.grid,0,0,2,2,"-");

global.playerturn = true;

global.opponet_options = 
[
"place_top_left",
"place_top_center",
"place_top_right",
"place_middle_left",
"place_middle_center",
"place_middle_right",
"place_bottom_left",
"place_bottom_center",
"place_bottom_right",
]
NeuroSendContext("It is currently X's turn.",true);