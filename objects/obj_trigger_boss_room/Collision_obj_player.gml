//create boss, door and set camera
//play boss music
if (timer == 200) {
	start_timer = true;
	freeze_inputs = true;
	audio_stop_sound(global.active_soundtrack);
	instance_create_layer(2512, 256, "walls", oDoorBoss);
}
