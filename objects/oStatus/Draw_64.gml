// Draw oPLayer HP,active timers etc
if(instance_exists(oPlayer)) {
  draw_set_font(fnt);
  draw_set_color(c_white);
  draw_set_valign(fa_top);
  font_size = 5;
  text = "HP: " + string(oPlayer.hp);
  
  if (oPlayer.doubleJump) {
    text += "\nDouble Jump! " + string((oPlayer.doubleJumpTime - oPlayer.doubleJumpTimer) / 60);
  }
  
  draw_text(10, 10, text);
}

// Clamp HP between 2 values
hp = clamp(oPlayer.hp, 0, 100);


if (hp < 0) {
  room_restart();
}
