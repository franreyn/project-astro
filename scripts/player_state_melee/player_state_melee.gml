
function player_state_melee(){

	// Object to collide with 
	x_collisions(obj_wall);
	y_collisions(obj_wall);
	x_collisions(obj_platform);
	y_collisions(obj_platform);

	//Start attack
	if (sprite_index != spr_player_melee) {
		is_melee = true;
		if (is_melee) {
			sprite_index = spr_player_melee;
			image_index = 0;
			image_speed = 1;
			x_speed = 0;
			ap_current -= 10;
			
			// Attack
			var hitbox = instance_create_layer(x + image_xscale * 16, y, "Instances", obj_hitbox);
			hitbox.creator = id;			
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