/// @description Insert description here
// You can write your code in this editor
image_index = index;
if (!start_pos_set) {
	image_angle = 90 * start_pos;
	start_pos_set = true;
}


if (place_meeting(x,y,obj_bullet) && switch_timer > 20 && !global.boss_door_unlocked) {
	pos++;
	image_angle += 90;
	if (image_angle == 360) {
		image_angle = 0;
	}
	
	switch_timer = 0;
	
	pos = pos == 4 ? 0 : pos;

	if (image_angle == 0) {
		global.switches_aligned++;
		correct_pos = true;
	} else if (correct_pos) {
		global.switches_aligned--;
		correct_pos = false;
	}
	
	show_debug_message(switches_aligned);
	

	global.boss_door_unlocked = global.switches_aligned == 4 ? true : false;
	
	if (global.boss_door_unlocked) {
		scr_showtext("Door unlocked!", 100);
		global.camera_follow_object = oDoorLocked;
	}
}

switch_timer++;