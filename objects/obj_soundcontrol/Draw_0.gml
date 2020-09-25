// Draw the current SFX volume
if (activeSoundGroup == 0) {
  if (soundGroupOnly) {
    draw_text_color(
      obj_player.x,
      obj_player.y - 40,
      string(showText),
      c_white,
      c_white,
      c_white,
      c_white,
      alpha
    );
  } else
    draw_text_color(
      obj_player.x,
      obj_player.y - 40,
      string(showText) + " VOL: " + string(volumes[0]),
      c_white,
      c_white,
      c_white,
      c_white,
      alpha
    );
}
// Draw the current soundtrack volume
if (activeSoundGroup == 1) {
  if (soundGroupOnly) {
    draw_text_color(
      obj_player.x,
      obj_player.y - 40,
      string(showText),
      c_white,
      c_white,
      c_white,
      c_white,
      alpha
    );
  } else
    draw_text_color(
      obj_player.x,
      obj_player.y - 40,
      string(showText) + " VOL: " + string(volumes[1]),
      c_white,
      c_white,
      c_white,
      c_white,
      alpha
    );
}
