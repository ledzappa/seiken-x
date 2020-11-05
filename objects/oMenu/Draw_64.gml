
var alpha = (switch_room_timer-100)/300;
alpha = clamp(alpha, 0 , 1);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(alpha);
draw_set_font(fLogo);
draw_set_color(c_maroon);
draw_text(gui_width/2,50,"SEIKEN X");

draw_set_font(fMenu);
draw_set_color(c_white);
draw_text(gui_width/2,gui_height-30,"PRESS START");
