/// @description Insert description here
// You can write your code in this editor
vsp = vsp + oPlayer.grv;

// vertical collision
if (place_meeting(x, y + vsp, oWalls)) {
	while(!place_meeting(x, y + sign(vsp), oWalls)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;