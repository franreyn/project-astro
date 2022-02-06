function player_state_free(){

	var input_left = gamepad_button_check(4, gp_padl) || keyboard_check(ord("A"));
	var input_right = gamepad_button_check(4, gp_padr) || keyboard_check(ord("D"));
	var input_up = gamepad_button_check(4, gp_padu) || keyboard_check(ord("W"));
	var input_down = gamepad_button_check(4, gp_padd) || keyboard_check(ord("S"));
	var input_jump = gamepad_button_check_pressed(4, gp_face1) || keyboard_check_pressed(vk_space);
	var input_jump_check = gamepad_button_check(4, gp_face1) || keyboard_check(vk_space);
	var input_grab = gamepad_button_check(4, gp_shoulderl) || keyboard_check(vk_shift);
	var input_dash = gamepad_button_check_pressed(4, gp_shoulderr) || keyboard_check_pressed(ord("H"));
	var input_melee = gamepad_button_check_pressed(4, gp_face3) || keyboard_check_pressed(ord("J"));
	var input_ranged = gamepad_button_check_pressed(4, gp_face2) || keyboard_check_pressed(ord("K"));

	facing = place_meeting(x - 1, y , obj_wall) - place_meeting(x + 1, y , obj_wall);

	#region Horizontal movement
	
		// Input calculation
		var x_input = input_right - input_left;
	
		// Acceleration and decelaration calculations
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
	
		// Horizontal collision
		x_collisions(obj_wall);
		x_collisions(obj_platform);
		
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

		//Wall slide and add gravity to vertical movement
		if (facing != 0) && (input_grab) { y_speed = min(y_speed + 1, 0); }
		else { y_speed += _grav; }
	
		//Jump
		if (input_jump) && (jump_current > 0) {
			if(is_grounded(obj_wall) || is_grounded(obj_platform)) {
				y_speed += _jump_height;
				jump_current -= 1;
			} 
			else if (!is_grounded(obj_wall) || !is_grounded(obj_platform)) && (facing != 0) {
				y_speed = _jump_height;
				x_speed = facing * (_max_speed * 4);
				jump_current -= 1;
			} else {
				y_speed = dbl_jump_height;
				jump_current -= 1;
			}
		}
		
		// Jump threshold
		if (y_speed < 0) && (!input_jump_check) { y_speed = max(y_speed, 0);  }
	
		//Vertical collision
		y_collisions(obj_wall);
		y_collisions(obj_platform);
		
		
		//===========
		y += y_speed;
		//===========
		
	#endregion	

	#region Sprite Animation

		//Animation
		if (!is_grounded(obj_wall) && !is_grounded(obj_platform)) {
			sprite_index = spr_player_air;
			image_speed = 0;
			if (x_speed > 0) image_index = 1; else image_index = 0;
		} else {	
			image_speed = 1;
				if (x_speed == 0) {  sprite_index = spr_player;} 
				else { sprite_index = spr_player_run; }
		}
	
		//Flip Sprite depending on facing direction
		if (x_speed != 0) image_xscale = sign(x_speed);
	
	#endregion

	#region Transitions

	// Transitions
	if (input_melee) {
			if (!is_melee) {
				if (input_up) { _player_state = player_state.melee_up; }
				else if (input_down && !is_grounded(obj_wall)) { _player_state = player_state.melee_down; }
				else { _player_state = player_state.melee; }
			}
		}
	if (input_ranged) {
		if (!is_ranged) {
				_player_state = player_state.ranged; 
		}
	}
	
	

	
	
	#endregion

}