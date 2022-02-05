function player_state_free(){

	var input_left = gamepad_button_check(0, gp_padl) || keyboard_check(ord("A"));
	var input_right = gamepad_button_check(0, gp_padr) || keyboard_check(ord("D"));
	var input_jump = gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_space);
	var input_dash = gamepad_button_check_pressed(0, gp_shoulderr) || keyboard_check_pressed(ord("H"));
	var input_melee = gamepad_button_check_pressed(0, gp_face3) || keyboard_check_pressed(ord("J"));
	var input_ranged = gamepad_button_check_pressed(0, gp_face2) || keyboard_check_pressed(ord("K"));

	is_on_wall = false;
	//facing = place_meeting(x - 5, y , obj_wall) - place_meeting(x + 5, y , obj_wall);

	#region Horizontal movement
	
		// Input calc
		var x_input = input_right - input_left;
	
		//Set move speed and stop
		if(x_input != 0 && !is_dashing) {
			x_speed += x_input * _accel;
			x_speed = clamp(x_speed, -_max_speed, _max_speed);
		} else {
			if(x_speed > _decel) {
				x_speed -= _decel;
			} else if (x_speed < -_decel) {
				x_speed += _decel;
			} else {
				x_speed = 0;
			}
		}
	
		//Horizontal collision
		if(place_meeting(x + x_speed, y, obj_wall)) {		
			while(! place_meeting(x + sign(x_speed), y , obj_wall)) {
				x += sign(x_speed);
			}
			x_speed = 0;
			is_on_wall = true;
		}
		
		//Dash
		if (input_dash && !is_dashing) {
			is_dashing = true;
			x_speed +=  image_xscale * _dash_speed;
			y_speed += 0;
		}
		if (abs(x_speed) < _max_speed) { is_dashing = false; }
		//============
			x += x_speed;
		//============
	
	#endregion

	#region Vertical movement

		//Add gravity to vertical movement
		y_speed += _grav;
	
		//Wall slide
		//if (is_on_wall == true) {
		//	if (y_speed >  0) {
			//vertical_movement = _gravity / 2;
		//	y_speed = min(y_speed + 1, 5);
				//if (gamepad_button_check_pressed(0, gp_face1)) { 
					//x_speed += sign(facing) * 8;
					//y_speed += _jump_height;
					//}
		//	}
		//}
	
		//Jump
		if (input_jump) && (jump_current > 0){
			if(is_on_ground()) {
				y_speed += _jump_height;
				jump_current -= 1;
			} else {
				y_speed = dbl_jump_height;
				//y_speed = _jump_height / 2;
				jump_current -= 1;
			}
		}
	
		//Vertical collision
		if(place_meeting(x, y + y_speed, obj_wall)) {
			while(! place_meeting(x, y + sign(y_speed), obj_wall)) {
				y += sign(y_speed);
			}
			y_speed = 0;
			jump_current = jump_max;
		}
		//==
		y += y_speed;
	#endregion	

	#region Sprite Animation

		//Animation
		if (!is_on_ground()) {
			sprite_index = spr_player_air;
			image_speed = 0;
			if (x_speed > 0) image_index = 1; else image_index = 0;
		} else {	
			image_speed = 1;
				if (x_speed == 0) {  sprite_index = spr_player;} 
				else { sprite_index = spr_player_run; }
		}
	
		//Flip Sprite
		if (x_speed != 0) image_xscale = sign(x_speed);
	
	#endregion

	#region Transitions

		// Transitions
		
	if(is_on_ground()) {	
		if (input_melee && !is_melee) { _player_state = player_state.melee; }	
		if (input_ranged && !is_ranged) { _player_state = player_state.ranged; }	
	}
	
	#endregion

}