if (place_meeting(x, y, obj_player) && obj_player.invincible_timer < 0) {
	obj_player.hp -= dmg;
}