//Draw oPLayer HP
if(instance_exists(oPlayer)) {
	draw_set_color(c_white);
	draw_text(view_camera[0]+206, view_camera[0]+400, "HP: " + string(hp));
}

// Clamp HP between 2 values
hp = clamp(hp,0,100);


if (hp < 0) {
	room_restart();
}