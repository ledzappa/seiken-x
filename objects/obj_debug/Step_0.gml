scr_getinput();

// show_debug_overlay(true);

// reset game
if (key_enter) {
  game_restart();
}

// quit game
if (key_esc) {
  game_end();
}