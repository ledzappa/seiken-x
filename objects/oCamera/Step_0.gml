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