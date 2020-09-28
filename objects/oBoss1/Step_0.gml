/// @description Insert description here
// You can write your code in this editor
vsp += grv;

if (place_meeting(x, y, obj_player)) {
	if (obj_player.invincible_timer < 0) {
		obj_player.hp -= dmg;
		obj_player.invincible_timer = 100;
	}	
}

// horizontal collision
if (place_meeting(x + hsp, y, oWalls)) {
  while (!place_meeting(x + sign(hsp), y, oWalls)) {
    x = x + sign(hsp);
  }
  hsp = -hsp;
}
x = x + hsp;

// vertical collision
if (place_meeting(x, y + vsp, oWalls)) {
  while (!place_meeting(x, y + sign(vsp), oWalls)) {
    y = y + sign(vsp);
  }
  airdash = false;
  vsp = 0;
}
y = y + vsp;

if (hp < 30 && !phase2) {
	phase2 = true;
	hsp = hsp * 2;
}
