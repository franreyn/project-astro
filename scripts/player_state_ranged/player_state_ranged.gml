function player_state_ranged(){

	//Horizontal collision
	if (place_meeting(x + x_speed, y, obj_wall)) {
		while (!place_meeting(x + sign(x_speed), y, obj_wall)) {
			x = x + sign(x_speed);
		}
		x_speed = 0;
	}
	
	//Vertical collision
	if (place_meeting(x, y + y_speed, obj_wall)) {
		while (!place_meeting(x, y + sign(y_speed), obj_wall)) {
			y = y + sign(y_speed);
		}
		y_speed = 0;
	}

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
	x += x_speed;
	y += y_speed;
	
	if (image_index > image_number - 1) {
		alarm[2] = 8;
		_player_state = player_state.free;
	}

}