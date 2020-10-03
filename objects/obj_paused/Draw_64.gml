/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (global.paused) {
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,room_width,room_height,0);
	draw_set_halign(fa_center);
	draw_set_font(fnt);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(view_xport[0]+view_wport[0]/2, view_yport[0]+view_hport[0]/2-30, "Game paused");
	draw_set_color(c_black);
}