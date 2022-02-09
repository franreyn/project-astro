/// @description Set player variables

// Health and action points
ap_max = 100;
ap_current = ap_max;

// Action point requirements
_first_jump_ap = 10;
_second_jump_ap = 10;
_wall_jump_ap = 10;
_dash_ap = 80;

// Running 
_accel = 0.2;
_decel = 0.8;
_max_speed = 2;

// Jumping
jump_max = 2;
jump_current = jump_max;
_jump_height = -5;
dbl_jump_height = -3;
_grav = .3;

// Dashing
_dash_speed = _max_speed * 4; 

// Melee
_melee_delay = 15;

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