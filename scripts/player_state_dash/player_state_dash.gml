function player_state_dash(){
	
	//Horizontal collision
	if (place_meeting(x + x_speed, y, obj_wall)) {
		while (!place_meeting(x + sign(x_speed), y, obj_wall)) {
			x = x + sign(x_speed);
		}
		x_speed = 0;
	}
	
	//Add gravity to vertical movement
	//y_speed += _grav;
	
	//Vertical collision
	if (place_meeting(x, y + y_speed, obj_wall)) {
		while (!place_meeting(x, y + sign(y_speed), obj_wall)) {
			y = y + sign(y_speed);
		}
		y_speed = 0;
	}
	
	//Dash
			if (abs(x_speed) < 10) { 
		is_dashing = false; 
		_player_state = player_state.idle;
		}
	is_dashing = true;
	x_speed +=  image_xscale * 8;
	y_speed = 0;
	x += x_speed;
	y += 0;
	

	
}