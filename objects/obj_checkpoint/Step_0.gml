/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, obj_player)) {
	global.checkpointR = room;
	global.checkpointX = x;
	global.checkpointY = y;
	global.checkpoint = id;
	global.checkpoint_cam_val = [obj_camera.x_min, obj_camera.x_max, obj_camera.y_min, obj_camera.y_max];
	instance_destroy();
}