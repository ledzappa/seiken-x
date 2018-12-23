/// @description Insert description here
// You can write your code in this editor


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