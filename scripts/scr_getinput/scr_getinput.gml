function scr_getinput() {
	if (!obj_player.player_hurt && !freeze_inputs) {
		key_left = keyboard_check(ord("A"));
		key_right = keyboard_check(ord("D"));
		key_top = keyboard_check(ord("W"));
		key_jump = keyboard_check_pressed(ord("K"));
		key_dash = keyboard_check_pressed(ord("L"));
		key_debug = keyboard_check_pressed(ord("Q"));
		key_enter = keyboard_check_pressed(vk_enter);
		key_esc = keyboard_check_pressed(vk_escape);
		shoot = keyboard_check_pressed(ord("J"));
		shoot_hold = keyboard_check(ord("J"));
		shoot_release = keyboard_check_released(ord("J"));
	}
}