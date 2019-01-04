// Update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
//x += (xTo - x + 100 * follow.pmove) / 10;
x += (xTo - x + 20 * follow.pmove) / 10;
 y += (yTo - y - 10) / 10;

// Update camera view
camera_set_view_pos(cam, x-view_w_half , y-view_w_height);

// Clamp camera to room boundaries
x = clamp(x,view_get_wport(0)/6,room_width-view_get_wport(0)/6);
y = clamp(y,view_get_hport(0)/6,room_height-view_get_hport(0)/6);

// Switch Between Fullscreen by toggling between 0 & 1
if (keyboard_check_pressed(vk_tab)) {
	toggleSwitch = toggleSwitch ^ 1;
	if (toggleSwitch == 0) {
		audio_play_sound(fxSwitch3,1000,false);
	} else audio_play_sound(fxSwitch1,1000,false);
}
switch (toggleSwitch) {
	case 0: window_set_fullscreen(false); break;
	case 1: window_set_fullscreen(true); break;
}