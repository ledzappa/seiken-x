var PlayerCarried = place_meeting(x,y-1,oPlayer);

key_jump = keyboard_check_pressed(ord("K"));
timer++;

y += vsp;

// reverse speed when turntime ends
if (timer == turnTime) {
	timer = 0;
	vsp = -vsp;
}

// tweak y-value here if player should leave the platform
// when it turns
if (PlayerCarried) {
	with (PlayerCarried) {
		onPlatform = true;
#region OLD CODE
		dst = abs(other.y - y);
		// so the player doesn't land "inside" the platform
		if (dst > 23 || dst < 22) {
			if (other.y < y) {
				y = y + 0.5;
			} else {
				y = y - 0.5;
			}
		} else {
			show_debug_message(dst);
		}

		// give the player the same speed as the platform
		// (as long as he doesn't jump)
		if (!key_jump) {
			vsp = other.vsp;	
			grv = 0;
		}
#endregion
			y = abs(other.bbox_top);
			y -= abs(y - bbox_bottom);
			y--;
			vsp = 0;
	}
} else {
	// oPlayer resets gravity
}