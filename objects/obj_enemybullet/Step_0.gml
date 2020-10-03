// collision with player
inst = instance_place(x, y, obj_player);
if (inst != noone) {
  obj_player.hp -= dmg;
  instance_destroy()
}
