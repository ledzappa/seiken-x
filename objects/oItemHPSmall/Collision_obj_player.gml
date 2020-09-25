obj_player.hp += 10;
sound = audio_play_sound(wItemHP, 2, 0);
audio_sound_gain(sound, 0.6, 0);
instance_destroy();