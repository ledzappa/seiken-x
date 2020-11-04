///open_dialog("Text", speed, x, y);
function scr_opendialog(argument0, argument1, argument2, argument3) {

	txt = instance_create_layer(argument2, argument3-200, "texts", oText);

	with (txt) {
	  padding = 16;
	  maxlength = 150;
	  text = argument0;
	  spd = argument1;
	  font = fnt;
	
	  text_length = string_length(text);
	  font_size = font_get_size(font);
	
	  text_width = string_width_ext(text, font_size + (font_size/2), maxlength);
	  text_height = string_height_ext(text, font_size + (font_size/2), maxlength);
	
	  boxwidth = text_width + (padding * 2);
	  boxheight = text_height + (padding * 2);
	}


}
