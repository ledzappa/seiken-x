/// @description Insert description here
// You can write your code in this editor
key_jump = keyboard_check_pressed(ord("K"));
timer++;

y += vsp;

// reverse speed when turntime ends
if (timer == turnTime) {
	timer = 0;
	vsp = -vsp;
}

if (place_meeting(x, y, oPlayer)) {
	with (oPlayer) {
		onPlatform = true;
		dst = abs(other.y - y);
		
		// so the player doesn't land "inside" the platform
		if (dst > 23 || dst < 22) {
			if (other.y < y) {
				y++;
			} else {
				y--;
			}
		}

		// give the player the same speed as the platform
		// (as long as he doesn't jump)
		if (!key_jump) {
			vsp = other.vsp;
			grv = 0;
		}
	}
} else {
	// back to normal when leaving the platform
	with (oPlayer) {
		grv = 0.4;
		onPlatform = false;
	}
}