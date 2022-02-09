/// @description Key values for parent enemy object

lingerer_speed = .3;

x_speed = 0;
y_speed = 0;

enum enemy_state {
	idle,
	chase
}

_enemy_state = enemy_state.idle;