// move towards player if within range
if (distance_to_object(obj_player) < 120 && scr_objectinview(x,y)) 
{
  speed = global.paused ? 0 : 1;
  direction = point_direction(x, y, obj_player.x, obj_player.y);
}