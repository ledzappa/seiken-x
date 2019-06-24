/// @description Insert description here
// You can write your code in this editor
show_debug_message("enemy destroyed: ");
show_debug_message(x);

// create health at x, y with 33% probability
rnd = random_range(0, 1);
if (rnd < 0.33) {
  instance_create_layer(x, y, "items", oItemHPSmall);
}
