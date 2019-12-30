//Draw oPLayer HP
if(instance_exists(oPlayer)) {
  draw_set_color(c_white);
  text = "HP: " + string(oPlayer.hp);
  
  if (oPlayer.doubleJump) {
    text += "\nDouble Jump Active! " + string((oPlayer.doubleJumpTime - oPlayer.doubleJumpTimer) / 60);
  }
  
  draw_text(view_camera[0] + 10, view_camera[0] + 10, text);
}

// Clamp HP between 2 values
hp = clamp(oPlayer.hp, 0, 100);


if (hp < 0) {
  room_restart();
}
