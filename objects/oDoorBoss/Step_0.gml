/// @description Insert description here
// You can write your code in this editor

sound_timer--;
if (image_index == 12) {
	image_speed = 0;
} 

if (image_speed != 0 && sound_timer < 0) {
	sound_timer = 15;
	audio_play_sound(fxDoorBoss,100, false);
}