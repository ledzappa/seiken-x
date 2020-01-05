if (global.enableDebug) {
  draw_text_color(
    0,
    128,
    "#CAMERA SETTINGS#",
    c_white,
    c_white,
    c_white,
    c_white,
    1
  );
  draw_text_color(
    0,
    144,
    "Press Tab to switch between fullscreen and windowed mode.",
    c_white,
    c_white,
    c_white,
    c_white,
    1
  );
  draw_text_color(
    0,
    160,
    "FULLSCREEN: " + string(window_get_fullscreen()),
    c_white,
    c_white,
    c_white,
    c_white,
    1
  );
  draw_text(0, 170, "view_xport: " + string(view_xport[0]));
  draw_text(0, 180, "view_yport: " + string(view_yport[0]));
  draw_text(0, 190, "view_wport: " + string(view_wport[0]));
  draw_text(0, 200, "view_hport: " + string(view_hport[0]));
}
