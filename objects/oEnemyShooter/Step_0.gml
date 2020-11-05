if (global.paused) exit;
vsp += grv;
firingDelay--;

// horizontal collision
if (place_meeting(x + hsp, y, oWall)) {
  while (!place_meeting(x + sign(hsp), y, oWall)) {
    x = x + sign(hsp);
  }
  hsp = -hsp;
}
x = x + hsp;

// vertical collision
if (place_meeting(x, y + vsp, oWall)) {
  while (!place_meeting(x, y + sign(vsp), oWall)) {
    y = y + sign(vsp);
  }
  vsp = 0;
}
y = y + vsp;

// fire bullet
if (firingDelay < 0 && scr_objectinview(x, y)) {
	firingDelay = 120;
	with(instance_create_layer(x, y, "bullets", obj_enemybullet)) {
		speed = 3;
		rnd = random_range(-3, 3);
		direction = point_direction(x, y, obj_player.x, obj_player.y) + rnd;
	}
}

// look left or right
if (obj_player.x < x) {
  image_xscale = -1;
} else {
  image_xscale = 1;
}
