/// @description Key values for hitbox

// Create list to keep track of enemies hit
hitbox_hitlist = ds_list_create();
// Alarm to destroy above list
alarm[1] = 2;

// Destroy this instance after it is used
alarm[0] = 2;