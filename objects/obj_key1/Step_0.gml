/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, obj_player)) {
	global.has_key1 = true;
	scr_showtext("Got key!", 50);
	instance_destroy();
}