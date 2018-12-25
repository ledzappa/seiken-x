draw_self();
if (playerHurt) {
	if (timer mod 2 == 0 ) {image_alpha = choose(0.5,1);}
} else image_alpha = 1;


draw_text(x,bbox_top-30, "vsp: " + string(vsp))