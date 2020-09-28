/// @description Insert description here
// You can write your code in this editor
vsp = vsp + grv;
y = y + vsp;

// collision with player
inst = instance_place(x, y, obj_player);
if (inst != noone) {
  obj_player.invincible_timer = 100;
  obj_player.hp -= 10;
  if (inst.hp == 0) {
    room_restart();
  }
  instance_destroy();
}
