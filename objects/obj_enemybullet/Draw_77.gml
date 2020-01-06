/// @description Insert description here
// You can write your code in this editor

// collision with player
inst = instance_place(x, y, obj_player);
if inst != noone
{    
	obj_player.hp -= dmg;
	obj_player.invincibleTimer = 50;
	if (inst.hp == 0) {
		room_restart();
	}
	instance_destroy();
}
