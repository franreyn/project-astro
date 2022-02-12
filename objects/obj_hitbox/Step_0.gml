/// @description Collisions with enemies

if(place_meeting(x, y, obj_enemy)) {	
  with(obj_enemy) {
	if(place_meeting(x, y, other.id) and (ds_list_find_index(other.hitbox_hitlist, id) == -1)) {
		ds_list_add(other.hitbox_hitlist, id);
			
			// Do what to enemy?
			hp_current -= 100;
			x_speed -= image_xscale * 8;
			_enemy_state = enemy_state.hit;
		}
	}
}


