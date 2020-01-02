// move towards player if within range
if (distance_to_object(oPlayer) < 120) {
  speed = 1;
  direction = point_direction(x, y, oPlayer.x, oPlayer.y);
}

if (place_meeting(x, y, oPlayer)) {
  if (oPlayer.invincibleTimer < 0) {
	oPlayer.hp -= dmg;
	oPlayer.invincibleTimer = 100;
  }
  instance_destroy();
}