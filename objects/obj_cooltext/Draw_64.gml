/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7E22EEBE
/// @DnDArgument : "code" "alpha = alpha - 0.01;$(13_10)$(13_10)if (alpha == 0) {$(13_10) instance_destroy();$(13_10)}$(13_10)$(13_10)draw_set_alpha(alpha);$(13_10)draw_set_font(fnt_status);$(13_10)draw_set_color(c_yellow);$(13_10)draw_set_halign(fa_center);$(13_10)draw_set_valign(fa_middle);$(13_10)draw_text(view_xport[0]+view_wport[0]/2, view_yport[0]+view_hport[0]/2-30, text);$(13_10)draw_set_alpha(1);"
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
draw_set_alpha(1);