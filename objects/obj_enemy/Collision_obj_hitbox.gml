/// @description Collision with enemey

if (other.creator == obj_player.id) {
	instance_destroy(obj_hitbox);
	_enemy_state = enemy_state.hit;
}
