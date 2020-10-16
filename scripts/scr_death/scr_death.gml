// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_death(){
	audio_stop_all();
	audio_play_sound(map2, 100, true);
	global.camera_follow_object = obj_player;
	global.freeze_inputs = false;
	room_restart();
}