//create boss, door and set camera
//play boss music
audio_stop_sound(map2);
audio_play_sound(soundtrackStage1, 1000, true);
instance_create_layer(2280, 260, "enemies", oBoss1);
door = instance_create_layer(2528, 248, "walls", oWall);
door.image_xscale = 0.5;
door.image_yscale = 4;
camera_follow_object = obj_cam_1;
instance_destroy();