// Update destination
scr_getinput();

if (key_down && obj_player.hsp = 0 && obj_player.vsp == 0) {
	look_down_timer++;
} else {
	look_down_timer = 0;
	if (y_offset < 30) {
		y_offset +=5;
	}
}

if (look_down_timer > 60 && y_offset > -40) {
	y_offset -= 5;
}

y_offset = clamp(y_offset, -40, 30);


if (instance_exists(camera_follow_object)) {
  x_to = camera_follow_object.x;
  y_to = camera_follow_object.y;
}

if (global.camera_follow_object == obj_player) {
	var xmin = x_min + 160;
	var xmax = x_max - 160;
	var ymin = y_min + 90;
	var ymax = y_max - 90;
} else {
	var xmin = 0;
	var xmax = 10000;
	var ymin = 0;
	var ymax = 10000;
}


// Update object position
if 
 (x > xmin || (obj_player.x - xmin) > 0) && 
 (x < xmax || (obj_player.x - xmax) < 0) {
	x += (x_to - x) / 10;
}

if 
 (y > ymin || (obj_player.y - ymin) > 0) && 
 (y < ymax || (ymax - obj_player.y) > 0) {
	y += (y_to - y - y_offset) / 10;
}


// Update camera view
camera_set_view_pos(cam, x-view_w_half , y-view_w_height);

// slide camera to boundaries or clamp
if (xmin - x > 10) {
	show_debug_message("sliding");
	x = x + 8;
} else if (x - xmax > 1) {
	x = x - 8;
} else {
	x = clamp(x, xmin, xmax);
}

if (ymax + 10 < y) {
	y = y - 5;
} else {
	y = clamp(y, ymin, ymax);
}




// Switch Between Fullscreen by toggling between 0 & 1
if (keyboard_check_pressed(vk_tab)) {
	fullscreen = !fullscreen;
	window_set_fullscreen(fullscreen)
}