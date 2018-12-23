/// @description Insert description here
// You can write your code in this editor
x = oPlayer.x;
y = oPlayer.y;

firingDelay--;

if (keyboard_check_pressed(ord("X")) && firingDelay < 0) {
	firingDelay = 5;
	with(instance_create_layer(x, y, "bullets", oBullet)) {
		speed = 25;
		asdf = random_range(-3, 3);
		if (oPlayer.pmove == -1) {
			direction = 180 + asdf;
		} else {
			direction = 0 + asdf;
		}
	}
}