/// @description Insert description here
shoot_hold = keyboard_check(ord("J"));
shoot_release = keyboard_check_released(ord("J"));

if (hsp == 0) {
	x = oGun.x + 30 * oPlayer.pmove;
	y = oGun.y;
} else {
	x += hsp;
}

if (shoot_hold) {
	if (charge < 120) {
		charge++;
	}
	show_debug_message(charge);
	image_xscale = charge/120;
	image_yscale = charge/120;
} else if (hsp == 0) {
	hsp = 8 * oPlayer.pmove;
}

// collision with walls
var inst;
inst = instance_place(x, y, oWallBreakable);
if inst != noone
{    
	inst.hp -= charge;
	if (inst.hp < 0) {
		with (inst) instance_destroy();
	}
	instance_destroy();
}

// war away from player 
if (abs(x - oPlayer.x) > 500) {
	instance_destroy();
}

// collision with enemies
inst = instance_place(x, y, oEnemies);
if inst != noone
{    
	audio_play_sound(wEnemyHit, 1, 0);
	inst.hp -= charge;
	if (inst.hp < 0) {
		with (inst) instance_destroy();
	}
	
	// destroy if not fully charged
	if (charge < 120) {
		instance_destroy();
	}
}