/// @description Insert description here
// You can write your code in this editor
vsp = vsp + grv;

// vertical collision
if (place_meeting(x, y + vsp, oWall)) {
	while(!place_meeting(x, y + sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = 90;