if (load && global.enableDebug) {
  var defaultSounds = audio_group_load_progress(audiogroup_default);
  var soundTrack = audio_group_load_progress(audiogroup_soundtrack);
  draw_set_font(fnt);
  draw_text(32, 16, "#SOUNDCONTROL SETTINGS#");
  draw_text(32, 32, "PRESS + or - to switch groups.");
  draw_text(
    32,
    48,
    "PRESS VK_UP or VK_DOWN to adjust volume on current group."
  );
  draw_text(32, 64, "Loading default group: " + string(defaultSounds));
  draw_text(32, 80, "Loading soundtrack group: " + string(soundTrack));
  draw_text(
    32,
    96,
    "Current audiogroup selected: " +
      string(switchGroup) +
      " = " +
      string(showText)
  );
}
