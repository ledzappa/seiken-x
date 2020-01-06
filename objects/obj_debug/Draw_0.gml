with (obj_player) {
 if (global.enable_debug) {
	var text = "";
	text += "vsp: " + string(vsp);
	text += "\nhsp: " + string(hsp);
	text += "\nimage_speed: " + string(image_speed);
	text += "\nimage_xscale: " + string(image_xscale);
	
	draw_set_color(c_white);
    draw_text(x, bbox_top - 30, text);
  }
}