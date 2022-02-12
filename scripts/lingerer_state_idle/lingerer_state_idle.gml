function lingerer_state_idle() {
	
	// Add gravity
	x_speed = 0;
	y_speed += 1;
	
	x_collisions(obj_platform);
	y_collisions(obj_platform);
	x_collisions(obj_wall);
	y_collisions(obj_wall);
	
	x += x_speed;
	y += y_speed;
	
	// Sprite animation
	sprite_index = spr_zombie1_idle;
	
	// Transitions
	if (place_meeting(x, y, obj_hitbox)) { _enemy_state = enemy_state.hit; }
	
	if (collision_line(x - 8, y, x + 8, y, obj_player, false, false)) && (!enemy_attacking) { _enemy_state = enemy_state.attack; }
	else if (collision_line(x - 64, y, x + 64, y, obj_player, false, false)) && (!enemy_attacking) { _enemy_state = enemy_state.chase; }
}