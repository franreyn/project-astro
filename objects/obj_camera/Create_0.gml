/// @description Viewport and resolutions

#macro view view_camera[0]

follow = obj_player;
cam_delay = 15;

view_w_half = camera_get_view_width(view) * 0.5;
view_h_half = camera_get_view_height(view) * 0.5;
//view_h_half = camera_get_view_height(view) * 0.6;
x_to = xstart;
y_to = ystart;


