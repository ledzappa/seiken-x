/// @description Insert description here
// You can write your code in this editor
vsp = vsp + grv;
y = y + vsp;

// collision with player
inst = instance_place(x, y, obj_player);
if (inst != noone) {
  instance_destroy();
}
