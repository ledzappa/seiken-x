vsp += obj_player.grv;
firingDelay--;

if (place_meeting(x, y, obj_player)) {
	if (obj_player.invincibleTimer < 0) {
		obj_player.hp -= dmg;
		obj_player.invincibleTimer = 100;
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

// throw grenade
if (firingDelay < 0 && distance_to_object(obj_player) < 500) {
  firingDelay = 120;
  with (instance_create_layer(x, y, "bullets", obj_enemygrenade)) {
    rndDir = random_range(-3, 3);
    rndSpd = random_range(-2, 2);
    speed = 5 + rndSpd;
    direction = point_direction(x, y, obj_player.x, obj_player.y) + rndDir;
  }
}

// look left or right
if (obj_player.x < x) {
  image_xscale = -1;
} else {
  image_xscale = 1;
}
