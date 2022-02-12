/// @description 

switch (_enemy_state) {

	case enemy_state.idle: lingerer_state_idle();
	break;
	
	case enemy_state.chase: lingerer_state_chase();
	break;
	
	case enemy_state.hit: lingerer_state_hit();
	break;
	
	case enemy_state.attack: lingerer_state_attack();
	break;
	
	case enemy_state.death: lingerer_state_death();
	break;
	
}

