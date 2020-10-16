globalvar enable_debug;
globalvar camera_follow_object;
globalvar grv;
globalvar freeze_inputs;
globalvar paused;

globalvar checkpoint;
globalvar checkpointR;
globalvar checkpointX;
globalvar checkpointY;

window_set_fullscreen(true);
enable_debug = false;
camera_follow_object = obj_player;
grv = 0.22;
freeze_inputs = false;
paused = false;

checkpoint = noone;
checkpointR = 0;
checkpointX = 0;
checkpointY = 0;

display_set_gui_size(320, 180);
room_goto_next();