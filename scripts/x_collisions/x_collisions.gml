/// @description X-axis collision
// Parameter: Object that you want to create x-axis collision with

function x_collisions(_obj){
	
	//Horizontal collision
	if (place_meeting(x + x_speed, y, _obj)) {
		while (!place_meeting(x + sign(x_speed), y, _obj)) {
			x += sign(x_speed);
		}
		x_speed = 0;
	}
	
}