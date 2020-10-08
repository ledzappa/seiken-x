/// @description Insert description here
// You can write your code in this editor
key_jump = keyboard_check_pressed(ord("K"));
timer++;

y += vsp;

// reverse speed when turntime ends
if (timer == turnTime) {
  timer = 0;
  vsp = -vsp;
}

// tweak y-value here if player should leave the platform
// when it turns
if (place_meeting(x, y, obj_player)) {
  with (obj_player) {
    on_platform = true;
    dst = abs(other.y - y);

    // so the player doesn't land "inside" the platform
    if (dst > 23 || dst < 22) {
      if (other.y < y) {
        y = y + 0.5;
      } else {
        y = y - 0.5;
      }
    } else {
      show_debug_message(dst);
    }

    // give the player the same speed as the platform
    // (as long as he doesn't jump)
    if (!key_jump) {
      vsp = other.vsp;
      grv = 0;
    }
  }
} else {
  // obj_player resets gravity
}
