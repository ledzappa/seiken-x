// Update destination
if (instance_exists(camera_follow_object)) {
  x_to = camera_follow_object.x;
  y_to = camera_follow_object.y;
}

// Update object position
if 
 (x > x_min || (obj_player.x - x_min) > 0) && 
 (x < x_max || (obj_player.x - x_max) < 0) {
	x += (x_to - x) / 10;
}

if (y < y_max || (obj_player.y - y_max) < -20) {
	y += (y_to - y - 30) / 10;
}

// Update camera view
camera_set_view_pos(cam, x-view_w_half , y-view_w_height);

// slide camera to boundaries or clamp
if (x_min - x > 10) {
	x = x + 5;
} else {
	x = clamp(x, x_min, x_max);
}

y = clamp(y, view_get_hport(0)/2, y_max);

// Switch Between Fullscreen by toggling between 0 & 1
if (keyboard_check_pressed(vk_tab)) {
	fullscreen = !fullscreen;
	window_set_fullscreen(fullscreen)
}