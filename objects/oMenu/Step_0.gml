/// @description Insert description here
// You can write your code in this editor
scr_getinput();

if (key_pause) {
	room_goto(rIntro);
	audio_stop_sound(global.active_soundtrack);
}

if (!playing_sound) {
	global.active_soundtrack = stMain;
	playing_sound = true;
}