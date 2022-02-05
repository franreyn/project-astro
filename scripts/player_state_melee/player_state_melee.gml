
function player_state_melee(){

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

	//Start attack
	if (sprite_index != spr_player_melee) {
		is_melee = true;
		if (is_melee) {
			sprite_index = spr_player_melee;
			image_index = 0;
			image_speed = 1;
			x_speed = 0;
		} 
	}
	
	//Player movement
	x += x_speed;
	y += y_speed;
	
	if (image_index > image_number - 1) {
		alarm[1] = _melee_delay;
		_player_state = player_state.free;
	}

}