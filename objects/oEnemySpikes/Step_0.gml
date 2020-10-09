vsp += grv;

if (place_meeting(x, y, obj_player)) {
	if (obj_player.invincible_timer < 0) {
		obj_player.hp -= dmg;
	}	
}