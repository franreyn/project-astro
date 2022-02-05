function player_state_idle(){

	
	var input_left = gamepad_button_check(0, gp_padl) || keyboard_check(ord("A"));
	var input_right = gamepad_button_check(0, gp_padr) || keyboard_check(ord("D"));
	var input_jump = gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_space);
	var input_dash = gamepad_button_check_pressed(0, gp_shoulderr) || keyboard_check_pressed(ord("H"));	
	var input_melee = gamepad_button_check_pressed(0, gp_face3) || keyboard_check_pressed(ord("J"));
	
	// Change to the idle sprite
	if (sprite_index != spr_player) { image_speed = 1; sprite_index = spr_player; }	
	
	// Transitions
	if (input_left || input_right) { _player_state = player_state.free; }
	else if (input_jump) { _player_state = player_state.free; }
	else if (input_dash) { _player_state = player_state.dash; }	
	else if (input_melee) { _player_state = player_state.melee; }	
	else { _player_state = player_state.idle; }

}