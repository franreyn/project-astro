switch (_player_state) {
	
	case player_state.idle: player_state_idle();
	break;
	
	case player_state.free: player_state_free();
	break;
	
	case player_state.dash: player_state_dash();
	break;
	
	case player_state.melee: player_state_melee();
	break;
	
	case player_state.ranged: player_state_ranged();
	break;
}