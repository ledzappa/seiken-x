scr_getinput();
switch_text_timer--;

var length = array_length_1d(texts);

if (switch_text_timer < 0 && !fade_out) {
	switch_text_timer = 500;
	current_text++;
	
	if (current_text >= length - 1) {
		fade_out = true;
		audio_stop_sound(global.active_soundtrack);
		audio_play_sound(fxExplode1, 1000, false);
	} 
}


if (!playing_sound) {
	global.active_soundtrack = stIntro;
	playing_sound = true;
}

if (fade_out) {
	fade_out_timer--;
}

if (fade_out_timer < 0) {
	room_goto(rStage1);
}