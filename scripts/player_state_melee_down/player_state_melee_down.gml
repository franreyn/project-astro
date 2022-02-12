
function player_state_melee_down(){

	// Object to collide with 
	x_collisions(obj_wall);
	y_collisions(obj_wall);
	x_collisions(obj_platform);
	y_collisions(obj_platform);	

	//Start attack
	if (sprite_index != spr_player_melee_down) {
		is_melee = true;
		if (is_melee) {
			sprite_index = spr_player_melee_down;
			image_index = 0;
			image_speed = 1;
			x_speed = 0;
			
			// Attack 			
			instance_create_layer(x, y + 16, "Instances", obj_hitbox);			

		} 
	}
	
	//Player movement
	x += 0;
	y += 0;
	
	if (image_index > image_number - 1) {
		alarm[1] = _melee_delay;
		_player_state = player_state.free;
	}

}