// Update destination
if (instance_exists(camera_follow_object)) {
  x_to = camera_follow_object.x;
  y_to = camera_follow_object.y;
}

// Update object position
//x += (xTo - x + 100 * follow.pmove) / 10;
x += (x_to - x + 20 * camera_follow_object.pmove) / 10;
y += (y_to - y - 25) / 10;

// Update camera view
camera_set_view_pos(cam, x-view_w_half , y-view_w_height);

// Clamp camera to room boundaries
x = clamp(x,view_get_wport(0)/6,room_width-view_get_wport(0)/6);
y = clamp(y,view_get_hport(0)/6,room_height-view_get_hport(0)/6);

// Switch Between Fullscreen by toggling between 0 & 1
if (keyboard_check_pressed(vk_tab)) {
	toggle_switch = toggle_switch ^ 1;
	if (toggle_switch == 0) {
		audio_play_sound(fxSwitch3,1000,false);
	} else audio_play_sound(fxSwitch1,1000,false);
}

switch (toggle_switch) {
	case 0: window_set_fullscreen(false); break;
	case 1: window_set_fullscreen(true); break;
}