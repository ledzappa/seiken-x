/// @description Insert description here
shoot_hold = keyboard_check(ord("J"));
shoot_release = keyboard_check_released(ord("J"));

// To avoid crashing if no sound is chosen
if(chargeKillSound != noone){
	chargeKillSound = chargeKillSound;
} else chargeKillSound = noone;


//Make the charge approach to a spin
increase_value = Approach(increase_value,16,0.05);
image_angle = Approach(image_angle,image_angle+180,increase_value);

if (hsp == 0) {
	x = oGun.x + 30 * oPlayer.pmove;
	y = oGun.y;
} else {
	x += hsp;
}

if (shoot_hold && hsp == 0) {
	// play audio
	if (!audio_is_playing(chargeup) && charge == 0) {
		len = audio_sound_length(chargeup);
		audio_play_sound(chargeup, 100, 0);
		alarm[0] = len * room_speed;
		
	} else if (!audio_is_playing(wBulletChargeFull)) {
		
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
	audio_stop_sound(chargeup);
	audio_stop_sound(wBulletChargeFull);
	if (!audio_is_playing(wBulletChargeShot) && charge == 100) {
		audio_play_sound(wBulletChargeShot, 1, 0);

	}
	hsp = 12 * oPlayer.pmove;
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
	audio_play_sound(chargeKillSound, 1, 0);
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