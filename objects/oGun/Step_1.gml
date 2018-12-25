/// @description Insert description here
// You can write your code in this editor
x = oPlayer.x + sign(oPlayer.image_xscale) * 4;
y = oPlayer.y;
shoot = keyboard_check_pressed(ord("X"));
shoot = keyboard_check_pressed(ord("J"));

firingDelay--;

image_xscale = oPlayer.image_xscale;

if (shoot && firingDelay < 0) {
	firingDelay = 5;
	with(instance_create_layer(x, y, "bullets", oBullet)) {
		speed = 10;
		rnd = random_range(-3, 3);
		if (oPlayer.pmove == -1) {
			direction = 180 + rnd;
		} else {
			direction = 0 + rnd;
		}
	}
}