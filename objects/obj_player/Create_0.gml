/// @description Key variables
/// @description 

//key_left = ord("A");
//key_right = ord("D");
//key_jump = vk_space;

_accel = 0.2;
_decel = 0.8;
_max_speed = 2;

_jump_height = -5;
dbl_jump_height = -3;
_grav = .3;

_dash_speed = _max_speed * 4; 
//_dash_counter = 0;

_melee_delay = 15;


jump_max = 2;
jump_current = jump_max;

x_speed = 0;
y_speed = 0;

is_on_wall = false;
is_dashing = false;
is_melee = false;
is_ranged = false;


is_on_ground = function() {
	return place_meeting(x, y + 1, obj_wall);
}

enum player_state {
	free,
	idle,
	walk,
	run,
	air,
	dash,
	melee,
	ranged	
}

// Current player state
_player_state = player_state.free;