/// @description Insert description here
// You can write your code in this editor
vsp = vsp + oPlayer.grv;
y = y + vsp;

// collision with player
inst = instance_place(x, y, oPlayer);
if (inst != noone) {
  oPlayer.invincibleTimer = 100;
  oPlayer.hp -= 10;
  if (inst.hp == 0) {
    room_restart();
  }
  instance_destroy();
}
