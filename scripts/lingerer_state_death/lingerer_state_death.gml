function lingerer_state_death() {
	
	if(sprite_index != spr_zombie1_death) {
		
		// Add gravity
		x_speed += 0;
		y_speed += 0;
	
		x_collisions(obj_platform);
		y_collisions(obj_platform);
		x_collisions(obj_wall);
		y_collisions(obj_wall);
	
		x += x_speed;
		y += y_speed;
	
		// Sprite animation
		sprite_index = spr_zombie1_death;
		image_speed = 1;
	}
	
	// Transitions
	if (image_index > image_number - 1) {
		image_speed = 0;
		// Alarm to destroy self after death
		//instance_destroy();
		
	}
	
}