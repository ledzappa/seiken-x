var alpha = ((fade_out_timer-100)/300);
alpha = clamp(alpha, 0, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_set_font(current_text != 6 ? fIntro : fIntroLarge);
draw_set_color(c_white);

draw_set_alpha(alpha);
draw_text(
  gui_width/2, 
	gui_height/2, 
	texts[current_text]
);
