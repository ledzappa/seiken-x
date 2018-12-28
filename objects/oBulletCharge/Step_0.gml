/// @description Insert description here
shoot_hold = keyboard_check(ord("J"));
shoot_release = keyboard_check_released(ord("J"));

if (hsp == 0) {
	x = oGun.x + 30 * oPlayer.pmove;
	y = oGun.y;
} else {
	x += hsp;
}

if (shoot_hold && hsp == 0) {
	// play audio
	if (!audio_is_playing(wBulletCharge) && charge == 0) {
		audio_play_sound(wBulletCharge, 1, 0);
	} else if (!audio_is_playing(wBulletCharge) && !audio_is_playing(wBulletChargeFull) && charge == 100) {
		audio_play_sound(wBulletChargeFull, 1, 1000);
	}
	
	// charge while not fully charged
	if (charge < 100) {
		charge++;
	}
	
	// increase sprite size relative to charge
	image_xscale = charge / 100;
	image_yscale = charge / 100;
} else if (hsp == 0) {
	// stop charge sound and play shot-sound on release
	audio_stop_sound(wBulletCharge);
	audio_stop_sound(wBulletChargeFull);
	if (!audio_is_playing(wBulletChargeShot) && charge == 100) {
		audio_play_sound(wBulletChargeShot, 1, 0);

	}
	hsp = 8 * oPlayer.pmove;
}

// collision with walls
var inst;
inst = instance_place(x, y, oWallBreakable);
if (inst != noone) {    
	inst.hp -= charge;
	if (inst.hp < 0) {
		with (inst) instance_destroy();
	}
	instance_destroy();
}

// destroy if to far away from player
if (abs(x - oPlayer.x) > 500) {
	instance_destroy();
}

// collision with enemies
inst = instance_place(x, y, oEnemies);
if (inst != noone) {    
	audio_play_sound(wEnemyHit, 1, 0);
	inst.hp -= charge;
	if (inst.hp < 0) {
		with (inst) instance_destroy();
	}
	
	// destroy if not fully charged, otherwise pass through
	if (charge < 120 || hsp == 0) {
		instance_destroy();
		audio_stop_sound(wBulletCharge);
		audio_stop_sound(wBulletChargeFull);
	}
}