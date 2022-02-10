function lingerer_state_hit() {
	
	// Add gravity
	x_speed += image_xscale * -0.3;
	y_speed += 1;
	
	x_collisions(obj_platform);
	y_collisions(obj_platform);
	x_collisions(obj_wall);
	y_collisions(obj_wall);
	
	x += x_speed;
	y += y_speed;
	
	// Sprite animation
	sprite_index = spr_zombie1_hit;
	
	hp_current -= 1;
	
	// Transitions
	if (image_index > image_number - 1) {
		_enemy_state = enemy_state.chase;
	}
}