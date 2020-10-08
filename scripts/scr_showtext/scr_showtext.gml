///open_dialog("Text", "Duration", speed, x, y);
function scr_showtext(argument0, argument1) {
	txt = instance_create_layer(0, 0, "texts", obj_cooltext);
	with (txt) {
	  text = argument0;
		timer = argument1;
	}
}
