function lingerer_state_attack(){
	
	enemy_attacking = true;
	
	if(enemy_attacking) {
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
		sprite_index = spr_zombie1_attack;
	
		if (image_index > image_number - 1) {
			// Alarm to set attacking to false
			alarm[0] = 30;
			_enemy_state = enemy_state.idle;
		}		
	}
	
}