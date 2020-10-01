// move towards player if within range
if (distance_to_object(obj_player) < 120) {
  speed = 1;
  direction = point_direction(x, y, obj_player.x, obj_player.y);
}