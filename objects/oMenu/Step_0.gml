/// @description Insert description here
// You can write your code in this editor
scr_getinput();

if (key_pause) {
	room_goto(rStage1);
	audio_stop_sound(soundtrackStage1);
	audio_play_sound(map2, 1000, true);
}

if (!playing_sound) {
	audio_play_sound(soundtrackStage1, 1000, true);
	playing_sound = true;
}