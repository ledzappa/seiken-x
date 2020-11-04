/// @description Insert description here
// You can write your code in this editor
global.camera_follow_object = follow_obj;

if (global.camera_follow_object == obj_player) {
	oCamera.x_max = x_max;
	oCamera.x_min = x_min;
	oCamera.y_min = y_min;
	oCamera.y_max = y_max;
} else {
	oCamera.x_min = 0;
	oCamera.x_max = 10000;
	oCamera.y_min = 0;
	oCamera.y_max = 10000;
}

