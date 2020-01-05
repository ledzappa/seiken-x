alpha = alpha - 0.01;

if (alpha == 0) {
 instance_destroy();
}
draw_set_alpha(alpha);
draw_set_font(fnt_status);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(view_xport[0]+view_wport[0]/2, view_yport[0]+view_hport[0]/2-30, text);
draw_set_halign(fa_top);
draw_set_alpha(1);