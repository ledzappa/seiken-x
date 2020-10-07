// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_objectinview(x, y) {
	if (point_in_rectangle(
		x, 
		y, 
		camera_get_view_x(view_camera[0]),		
		camera_get_view_y(view_camera[0]), 
		camera_get_view_x(view_camera[0]) + 320, 
		camera_get_view_y(view_camera[0]) + 180)) {
    return true;
	} else {
		return false;
	}
}