globalvar enable_debug;
globalvar camera_follow_object;
globalvar grv;
globalvar freeze_inputs;
globalvar paused;

globalvar checkpoint;
globalvar checkpointR;
globalvar checkpointX;
globalvar checkpointY;

globalvar has_key1;
globalvar has_key2;
globalvar has_boss_key;

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

has_key1 = false;
has_key2 = false;
has_boss_key = false;

display_set_gui_size(320, 180);
room_goto_next();