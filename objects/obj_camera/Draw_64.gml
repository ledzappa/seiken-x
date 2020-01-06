if (global.enable_debug) {
  var text = "\n#CAMERA SETTINGS#";
  text += "\nPress Tab to switch between fullscreen and windowed mode.";
  text += "\nFULLSCREEN: " + string(window_get_fullscreen());
  
  draw_set_font(fnt);
  draw_set_color(c_white);
  draw_set_valign(fa_top);
  draw_set_halign(fa_left);
  draw_text(0, 100, text);
}
