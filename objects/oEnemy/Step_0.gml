/// @description Insert description here
// You can write your code in this editor
vsp += oPlayer.grv;

if (place_meeting(x, y, oPlayer)) {
	if (oPlayer.invincibleTimer < 0) {
		oPlayer.hp -= dmg;
		oPlayer.invincibleTimer = 100;
	}	
}

// horizontal collision
if (place_meeting(x + hsp, y, oWalls)) {
	while(!place_meeting(x + sign(hsp), y, oWalls)) {
		x = x + sign(hsp);
	}
	hsp = -hsp;
}
x = x + hsp;

// vertical collision
if (place_meeting(x, y + vsp, oWalls)) {
	while(!place_meeting(x, y + sign(vsp), oWalls)) {
		y = y + sign(vsp);
	}
	airdash = false;
	vsp = 0;
}
y = y + vsp;