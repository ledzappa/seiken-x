vsp += grv;
firingDelay--;

if (place_meeting(x, y, obj_player)) {
	if (obj_player.invincible_timer < 0) {
		obj_player.hp -= dmg;
	}	
}

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
if (firingDelay < 0 && distance_to_object(obj_player) < oEnemies.fireRange) {
	firingDelay = 120;
	with(instance_create_layer(x, y, "bullets", obj_enemybullet)) {
		speed = 5;
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
