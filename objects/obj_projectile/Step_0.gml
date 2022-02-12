/// @description

// Values and code found in player state ranged script. 

if(place_meeting(x, y, obj_enemy)) {
  with(obj_enemy) {
	if(place_meeting(x, y, other.id) and (ds_list_find_index(other.proj_hitlist, id) == -1)) {
		ds_list_add(other.proj_hitlist, id);
			
			// Do what to enemy?
			hp_current -= 400;
			instance_destroy(obj_projectile);
			_enemy_state = enemy_state.hit;
		}
	}
}