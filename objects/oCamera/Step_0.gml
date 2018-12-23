/// @description Insert description here
// You can write your code in this editor

// update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// update object position
x += (xTo - x + 100 * follow.pmove) / 10;
y += (yTo - y - 50) / 10;

// update camera view
camera_set_view_pos(cam, x-view_w_half , y-view_w_height);