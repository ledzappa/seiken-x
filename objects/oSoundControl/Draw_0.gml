// Draw the current SFX volume
if (switchGroup == 0) {
	if (soundGroupOnly) {
	draw_text_color(oPlayer.x,oPlayer.y-40,string(showText),c_white,c_white,c_white,c_white,alpha);
	}
	else draw_text_color(oPlayer.x,oPlayer.y-40,string(showText)+ " VOL: " + string(sfxVol),c_white,c_white,c_white,c_white,alpha);

}
// Draw the current soundtrack volume
if (switchGroup == 1) {
	if (soundGroupOnly) {
	draw_text_color(oPlayer.x,oPlayer.y-40,string(showText),c_white,c_white,c_white,c_white,alpha);
	}
	else draw_text_color(oPlayer.x,oPlayer.y-40,string(showText)+ " VOL: " + string(mainVol),c_white,c_white,c_white,c_white,alpha);
}