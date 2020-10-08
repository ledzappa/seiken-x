// Draw obj_player HP,active timers etc
if(instance_exists(obj_player)) {
  //text = "HP: " + string(obj_player.hp);
	text = "";
  if (obj_player.doubleJump) {
    text += "Double Jump! " + string((obj_player.doubleJumpTime - obj_player.doubleJumpTimer) / 60);
  }
  
  draw_set_font(fnt);
  draw_set_color(c_white);
  draw_set_valign(fa_top);
  draw_set_halign(fa_left);
  draw_text(30, 10, text);
	
	subimg = 20 - (obj_player.hp / 5);
	draw_sprite(sHealthbar, subimg, 10, 10);
}
