/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

if (global.boss_door_unlocked) {
	open = true;
}

if (open) {
	image_speed = 1;
	sound_timer--;
	if (image_index == 12) {
		image_speed = 0;
		global.camera_follow_object = obj_player;
		instance_destroy();
	} 

	if (image_speed != 0 && sound_timer < 0) {
		sound_timer = 15;
		audio_play_sound(fxDoorBoss, 100, false);
	}
}
