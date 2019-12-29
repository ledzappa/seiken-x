//Draw oPLayer HP
<<<<<<< HEAD
if(instance_exists(oPlayer)) {
	draw_set_color(c_white);
	draw_text(view_camera[0]+10, view_camera[0]+10, "HP: " + string(oPlayer.hp));
}

// Clamp HP between 2 values
hp = clamp(oPlayer.hp,0,100);

=======
if (instance_exists(oPlayer)) {
  draw_set_color(c_white);
  draw_text(view_camera[0] + 206, view_camera[0] + 400, "HP: " + string(hp));
}

// Clamp HP between 2 values
hp = clamp(hp, 0, 100);
>>>>>>> master

if (hp < 0) {
  room_restart();
}
