if (global.paused) exit;
scr_getinput();
x = obj_player.x + sign(obj_player.image_xscale) * 4;
y = obj_player.y;
image_xscale = obj_player.image_xscale;
firing_delay--;

if (key_up && key_right) {
  angle = 45;
} else if (key_up && key_left) {
  angle = 135;
} else if (key_up) {
  angle = 90;
} else if (obj_player.pmove == -1) {
  angle = 180;
} else {
  angle = 0;
}

image_angle = angle;

if (shoot && firing_delay < 0) {
  firing_delay = 5;
  with (instance_create_layer(
    x + sign(image_xscale) * 8,
    y,
    "bullets",
    obj_bullet
  )) {
    speed = 10;
    rnd = random_range(-3, 3);
	image_angle = other.angle;
    direction = other.angle + rnd;
  }
}

if (shoot_hold) {
  pre_charge_timer++;
} else {
  pre_charge_timer = 0;
}

if (pre_charge_timer > 50 && !instance_exists(obj_bulletcharge)) {
  instance_create_layer(x, y, "bullets", obj_bulletcharge);
  pre_charge_timer = 0;
}
