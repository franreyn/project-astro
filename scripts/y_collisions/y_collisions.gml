/// @description Y-axis collision
// Parameter: Object that you want to create y-axis collision with

function y_collisions(_obj){
	
	//Vertical collision
	if (place_meeting(x, y + y_speed, _obj)) {
		while (!place_meeting(x, y + sign(y_speed), _obj)) {
			y += sign(y_speed);
		}
		y_speed = 0;
		//jump_current = jump_max;
		//ap_current = ap_max;
	}
	
}