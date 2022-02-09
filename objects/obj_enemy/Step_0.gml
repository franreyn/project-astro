/// @description 

switch (_enemy_state) {

	case enemy_state.idle: lingerer_state_idle();
	break;
	
	case enemy_state.chase: lingerer_state_chase();
	break;
	
}

