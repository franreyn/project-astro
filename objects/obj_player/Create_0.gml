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
_wall_grav = .05;

_dash_speed = _max_speed * 4; 
//_dash_counter = 0;

_melee_delay = 15;


jump_max = 2;
jump_current = jump_max;

x_speed = 0;
y_speed = 0;

is_dashing = false;
is_melee = false;
is_ranged = false;


enum player_state {
	free,
	melee,
	ranged,
	melee_up,
	melee_down
}

// Current player state
_player_state = player_state.free;