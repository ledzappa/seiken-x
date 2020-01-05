vsp += oPlayer.grv;
firingDelay--;

if (place_meeting(x, y, oPlayer)) {
	if (oPlayer.invincibleTimer < 0) {
		oPlayer.hp -= dmg;
		oPlayer.invincibleTimer = 100;
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
if (firingDelay < 0 && distance_to_object(oPlayer) < oEnemies.fireRange) {
	firingDelay = 120;
	with(instance_create_layer(x, y, "bullets", oBulletEnemy)) {
		speed = 5;
		rnd = random_range(-3, 3);
		direction = point_direction(x, y, oPlayer.x, oPlayer.y) + rnd;
	}
}

// look left or right
if (oPlayer.x < x) {
  image_xscale = -1;
} else {
  image_xscale = 1;
}
