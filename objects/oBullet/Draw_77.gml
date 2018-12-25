/// @description Insert description here
// You can write your code in this editor

// collision with walls
var inst;
inst = instance_place(x, y, oWallBreakable);
if inst != noone
{    
	inst.hp -= dmg;
	if (inst.hp == 0) {
		with (inst) instance_destroy();
	}
	instance_destroy();
}

if (place_meeting(x, y, oWall)) {
	instance_destroy();
}

// collision with enemies
inst = instance_place(x, y, oEnemies);
if inst != noone
{    
	inst.hp -= dmg;
	if (inst.hp == 0) {
		with (inst) instance_destroy();
	}
	instance_destroy();
}

// collision with player
inst = instance_place(x, y, oPlayer);
if inst != noone
{    
	inst.hp -= dmg;
	if (inst.hp == 0) {
		room_restart();
	}
	instance_destroy();
}