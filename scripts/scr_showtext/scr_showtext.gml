///open_dialog("Text", speed, x, y);
function scr_showtext(argument0) {

	txt = instance_create_layer(0, 0, "texts", obj_cooltext);

	with (txt) {
	  text = argument0;
	}


}
