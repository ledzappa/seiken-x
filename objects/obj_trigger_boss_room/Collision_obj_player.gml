//create boss, door and set camera
//play boss music
if (timer == 200) {
	start_timer = true;
	freeze_inputs = true;
  camera_follow_object = obj_cam_1;
	audio_stop_sound(map2);
	instance_create_layer(2512, 256, "walls", oDoorBoss);
}
