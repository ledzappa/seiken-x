/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x-5,y,obj_player)) {
	if (global.has_key1) {
		instance_destroy();
	} else {
		scr_showtext("Key required!", 50);
	}
}