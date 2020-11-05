/// @description Insert description here
// You can write your code in this editor
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
playing_sound = false;

switch_text_timer = 200;
fade_out = false;
fade_out_timer = 400;

current_text = 0;

texts = [
	"The year is 2177",
	"Earth has been scorched by a war\n against mystical alien machines",
	"Intel suggests that the machines are\n constructing a super weapon, X, that would\n effectively end all biological life",
	"When everything seems lost,\n an unknown soldier manages to infiltrate\n enemy headquarters",
	"A battle against time and\n overwhelming enemies begin,\n with the concept of life at stake",
	"A flame of hope has finally\n emerged through the darkness",
	"Failure is not an option",
];