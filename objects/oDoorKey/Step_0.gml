/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x-5,y,obj_player)) {
	if (global.has_key1) {
		audio_play_sound(fxKeyDoorOpens, 100, false);
		instance_destroy();
	} else {
		scr_showtext("Key required!", 5);
		if (!sound_playing) {
			audio_play_sound(fxKeyDoorLocked, 100, false);
			sound_playing = true;
		}
	}
} else {
	sound_playing = false;
}

