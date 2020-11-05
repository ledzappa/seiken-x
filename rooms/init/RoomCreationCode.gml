// DEV  //
globalvar enable_debug;
var skip_intro = false;
var fullscreen = false;
var start_room = rStage1;

// GAME STATE //

// general
globalvar camera_follow_object;
globalvar grv;
globalvar freeze_inputs;
globalvar paused;

// checkpoints
globalvar checkpoint;
globalvar checkpointR;
globalvar checkpointX;
globalvar checkpointY;
globalvar checkpoint_cam_val;

// keys and doors
globalvar has_key1;
globalvar has_key2;
globalvar boss_door_unlocked;
globalvar switches_aligned;

// sounds
globalvar active_soundtrack;

// init state
enable_debug = false;
camera_follow_object = obj_player;
grv = 0.22;
freeze_inputs = false;
paused = false;
checkpoint = noone;
checkpointR = 0;
checkpointX = 0;
checkpointY = 0;
checkpoint_cam_val = [];

// keys aand switches
has_key1 = false;
has_key2 = false;
boss_door_unlocked = false;
switches_aligned = 0;

// sounds
active_soundtrack = stMain;


window_set_fullscreen(fullscreen);
display_set_gui_size(320, 180);
room_goto(skip_intro ? start_room : rMenu);