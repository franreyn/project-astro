function player_state_ranged(){
	
	// find player direction 
	var proj_dir
	if (image_xscale == -1) { proj_dir = 180; }
	else { proj_dir = 0; }

	//Start shot
	if (sprite_index != spr_player_ranged) {
		is_ranged = true;
		if (is_ranged) {
			sprite_index = spr_player_ranged;
			image_index = 0;
			image_speed = 1;
			x_speed += 0;
			
			// Attack
			var projectile = instance_create_layer(x + image_xscale * 8, y, "Instances", obj_projectile);
			projectile.speed = 25;
			projectile.direction = proj_dir;
			// Alarm to destroy if collided with nothing
			alarm[0] = 1;
		} 
	}
	
	// Object to collide with 
	x_collisions(obj_wall);
	y_collisions(obj_wall);
	x_collisions(obj_platform);
	y_collisions(obj_platform);	


	//Player movement
	x += 0;
	y += 0;
	
	if (image_index > image_number - 1) {
		alarm[2] = 8;
		_player_state = player_state.free;
	}

}