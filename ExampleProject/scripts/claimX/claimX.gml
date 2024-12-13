function claimX(_x,_y){
	ds_grid_set(global.grid,_x,_y,"X");
	activated = true;
	owner = "X";
	global.playerturn = false;
	/*if array_length(global.RegisteredActions) == 0 {
		NeuroSendRegisterAction(global.opponet_options);
	}*/
	
	var actarray = global.opponet_options;
	
	var statestring;
	
	if id_x == 0 {
		if id_y == 0 {
			//NeuroSendUnregisterAction("place_top_left");
			statestring = "An X has been placed in the top left position.";
			
			array_delete(actarray,array_get_index(actarray,"place_top_left"),1);
		} else if id_y == 1 {
			//NeuroSendUnregisterAction("place_middle_left");
			statestring = "An X has been placed in the middle left position.";
			array_delete(actarray,array_get_index(actarray,"place_middle_left"),1);
		} else if id_y == 2 {
			//NeuroSendUnregisterAction("place_bottom_left");
			statestring = "An X has been placed in the bottom left position.";
			array_delete(actarray,array_get_index(actarray,"place_bottom_left"),1);
		}
	} else if id_x == 1 {
		if id_y == 0 {
			//NeuroSendUnregisterAction("place_top_center");
			statestring = "An X has been placed in the top center position.";
			array_delete(actarray,array_get_index(actarray,"place_top_center"),1);
		} else if id_y == 1 {
			//NeuroSendUnregisterAction("place_middle_center");
			statestring = "An X has been placed in the middle center position.";
			array_delete(actarray,array_get_index(actarray,"place_middle_center"),1);
		} else if id_y == 2 {
			//NeuroSendUnregisterAction("place_bottom_center");
			statestring = "An X has been placed in the bottom center position.";
			array_delete(actarray,array_get_index(actarray,"place_bottom_center"),1);
		}
	} else if id_x == 2 {
		if id_y == 0 {
			//NeuroSendUnregisterAction("place_top_right");
			statestring = "An X has been placed in the top right position.";
			array_delete(actarray,array_get_index(actarray,"place_top_right"),1);
			
		} else if id_y == 1 {
			//NeuroSendUnregisterAction("place_middle_right");
			statestring = "An X has been placed in the middle right position.";
			array_delete(actarray,array_get_index(actarray,"place_middle_right"),1);
		} else if id_y == 2 {
			//NeuroSendUnregisterAction("place_bottom_right");
			statestring = "An X has been placed in the bottom right position.";
			array_delete(actarray,array_get_index(actarray,"place_bottom_right"),1);
		}
	}
	//NeuroSendContext(statestring + " It is now your turn, choose a spot to place an O");
	NeuroSendForceAction(statestring, "It is now your turn, choose a spot to place an O.",false,global.opponet_options);
}