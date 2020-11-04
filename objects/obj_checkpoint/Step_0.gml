/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, obj_player)) {
	global.checkpointR = room;
	global.checkpointX = x;
	global.checkpointY = y;
	global.checkpoint = id;
	global.checkpoint_cam_val = [oCamera.x_min, oCamera.x_max, oCamera.y_min, oCamera.y_max];
	instance_destroy();
}