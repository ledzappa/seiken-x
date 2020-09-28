/// @description Insert description here
// You can write your code in this editor

timer--;

image_alpha = timer / 40;

// collision with player
inst = instance_place(x, y, obj_player);
if (inst != noone) {
  if (hit == false) {
    obj_player.hp -= dmg;
    obj_player.invincible_timer = 100;
    hit = true;
  }
}

if (timer < 0) {
  instance_destroy();
}
