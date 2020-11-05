/// @description Insert description here
// You can write your code in this editor
scr_getinput();

if (key_pause && !pressed_start) {
	pressed_start = true;
	audio_play_sound(fxExplode2, 1000, false);
	audio_stop_sound(global.active_soundtrack);
}

if (pressed_start) {
	switch_room_timer--;
}

if (switch_room_timer < 0) {
	room_goto(rIntro);
}

if (!playing_sound) {
	global.active_soundtrack = stMain;
	playing_sound = true;
}