function player_state_ranged(){

	// Object to collide with 
	x_collisions(obj_wall);
	y_collisions(obj_wall);
	x_collisions(obj_platform);
	y_collisions(obj_platform);	

	//Start shot
	if (sprite_index != spr_player_ranged) {
		is_ranged = true;
		if (is_ranged) {
			sprite_index = spr_player_ranged;
			image_index = 0;
			image_speed = 1;
			x_speed = image_xscale * 0;
		} 
	}
	
	//Player movement
	x += 0;
	y += 0;
	
	if (image_index > image_number - 1) {
		alarm[2] = 8;
		_player_state = player_state.free;
	}

}