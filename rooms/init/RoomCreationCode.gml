globalvar enable_debug;
globalvar camera_follow_object;
globalvar grv;
globalvar freeze_inputs;
globalvar paused;

window_set_fullscreen(true);
enable_debug = false;
camera_follow_object = obj_player;
grv = 0.4;
freeze_inputs = false;
paused = false;

display_set_gui_size(320, 180);
room_goto_next();