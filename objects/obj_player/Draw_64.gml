 /// @description
// draw_text(10, 10, "AP: " + string(ap_current));

var ap_percent = (ap_current / ap_max) * 100;
draw_healthbar(10, 10, 20, 12, ap_percent, c_white, c_aqua, c_aqua, 0, true, true);

draw_text(50, 10, string(obj_enemy._enemy_state));

