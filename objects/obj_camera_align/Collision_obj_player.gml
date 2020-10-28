/// @description Insert description here
// You can write your code in this editor
global.camera_follow_object = follow_obj;

if (global.camera_follow_object == obj_player) {
	obj_camera.x_max = x_max;
	if (obj_camera.x < x_min) {
		obj_camera.x_min = x_min;
	}
	obj_camera.y_max = y_max;
	obj_camera.y_min = y_min;
} else {
	obj_camera.x_min = 0;
	obj_camera.x_max = 10000;
	obj_camera.y_min = 0;
	obj_camera.y_max = 10000;
}

