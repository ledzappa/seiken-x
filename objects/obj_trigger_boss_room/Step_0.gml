/// @description Insert description here
// You can write your code in this editor
if (start_timer) {
	timer--;
}

if (timer == 0) {
	freeze_inputs = false;
	instance_create_layer(2280, 260, "enemies", oBoss1);
	audio_play_sound(soundtrackStage1, 1000, true);
	instance_destroy();
}