/// @description Insert description here
// You can write your code in this editor
rnd = random_range(0, 1);
if (rnd < 0.2 && killed_by_bullet) {
  instance_create_layer(x, y, "items", oItemHPSmall);
}
