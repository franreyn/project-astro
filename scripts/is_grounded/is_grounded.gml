/// @description  Returns if is standing on object

function is_grounded(__obj){
	return place_meeting(x, y + 1, __obj);
}