x = oPlayer.x + image_yscale;
y = oPlayer.y;
image_xscale = oPlayer.image_xscale;
firingDelay--;

if (keyboard_check_pressed(ord("X")) && firingDelay < 0) {
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