if (load && global.enable_debug) {
  var defaultSounds = audio_group_load_progress(audiogroup_default);
  var soundTrack = audio_group_load_progress(audiogroup_soundtrack);
  var text = "#SOUNDCONTROL SETTINGS#";
  text += "\nPRESS + or - to switch groups.";
  text += "\nPRESS VK_UP or VK_DOWN to adjust volume on current group.";
  text += "\nLoading default group: " + string(defaultSounds);
  text += "\nLoading soundtrack group: " + string(soundTrack);
  text += "\nCurrent audiogroup selected: " + string(switchGroup) + " = " + string(showText);
  
  draw_set_font(fnt);
  draw_set_valign(fa_top);
  draw_set_halign(fa_left);
  draw_set_color(c_white);
  draw_text(0, 30, text);
}
