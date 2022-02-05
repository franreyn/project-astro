/// @description

//Update destination
if (instance_exists(follow)) {
	x_to = follow.x;
	y_to = follow.y;
}

//Update object position
x += (x_to - x) / cam_delay;
y += (y_to - y) / cam_delay;

//x = clamp(x, view_w_half, room_width - view_w_half);
//y = clamp(y, view_h_half, room_height - view_h_half);

//Update camera view
camera_set_view_pos(view, x - view_w_half, y - view_h_half);