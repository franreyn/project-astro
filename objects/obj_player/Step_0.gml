switch (_player_state) {
	
	case player_state.free: player_state_free();
	break;
	
	case player_state.melee: player_state_melee();
	break;
	
	case player_state.ranged: player_state_ranged();
	break;

	case player_state.melee_up: player_state_melee_up();
	break;
	
	case player_state.melee_down: player_state_melee_down();
	break;
}

