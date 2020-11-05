/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, obj_player)) {
	global.has_key1 = true;
	sound = audio_play_sound(wItemHP, 2, 0);
	audio_sound_gain(sound, 0.6, 0);
	scr_showtext("Got key!", 50);
	instance_destroy();
}