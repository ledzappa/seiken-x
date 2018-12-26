/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_top = keyboard_check(ord("W"));
shoot = keyboard_check_pressed(ord("J"));
shoot_hold = keyboard_check(ord("J"));
shoot_release = keyboard_check_released(ord("J"));

x = oPlayer.x + sign(oPlayer.image_xscale) * 4;
y = oPlayer.y;


firingDelay--;

image_xscale = oPlayer.image_xscale;

if (shoot && firingDelay < 0) {
	firingDelay = 5;
	with(instance_create_layer(x, y, "bullets", oBullet)) {
		speed = 10;
		rnd = random_range(-3, 3);
		if (other.key_top && other.key_right) {
			oPlayer.standStill = true;
			direction = 45 + rnd;
		} else if (other.key_top && other.key_left) {
			oPlayer.standStill = true;
			direction = 135 + rnd;
		} else if (other.key_top) {
			direction = 90 + rnd;
		} else if (oPlayer.pmove == -1) {
			direction = 180 + rnd;
		} else {
			direction = 0 + rnd;
		}
	}
} else if (!other.key_top) {
	oPlayer.standStill = false;
}

if (shoot_hold) {
	preCharge++;
} else {
	preCharge = 0;
	charge = 0;
}

if (preCharge > 50 && !instance_exists(oBulletCharge)) {
	instance_create_layer(x, y, "bullets", oBulletCharge);
	preCharge = 0;
}