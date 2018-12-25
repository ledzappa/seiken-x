// update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
} else {xTo = x; yTo = y;}

// update object position
x += (xTo - x + 20 * follow.pmove) / 15;
// y += (yTo - y - 50) / 10;

// update camera view
camera_set_view_pos(cam, x-view_w_half , y-view_w_height);