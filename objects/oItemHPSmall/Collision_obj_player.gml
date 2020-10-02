if (obj_player.hp < 100) {
	sound = audio_play_sound(wItemHP, 2, 0);
	audio_sound_gain(sound, 0.6, 0);
	obj_player.hp += 10;
}

instance_destroy();