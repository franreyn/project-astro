/// @description Key values for parent enemy object

hp_current = 1000;
hp_max = hp_current;

lingerer_speed = .3;

enemy_attacking = false;

x_speed = 0;
y_speed = 0;

enum enemy_state {
	idle,
	chase,
	hit,
	attack,
	death
}

_enemy_state = enemy_state.idle;