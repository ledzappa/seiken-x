draw_self();
if (player_hurt) {
  if (timer mod 1 == 0 ) {sprite_index = sprite_index; image_alpha = choose(0.5,1);}
} else image_alpha = 1;

// draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,false);