/// @description Insert description here
// You can write your code in this editor
if (attack != 2) {
	vsp += grv;
}

jump_timer--;
attack_timer--;

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
  vsp = attack == 2 ? -vsp : 0;
}
y = y + vsp;

// phase 1 - go from left to right and jump
if (attack_timer == 0) {
	attack = attack == 1 ? 2 : 1;

	if (attack == 1) {
		attack_timer = 300;
	} 

	if (attack == 2) {
		vsp = -2;
		attack_timer = 400;
	}
}


// phase 2 - fly to middle of screen and shoot around


if (hp < 50 && phase != 2) {
	phase = 2;
	hsp = hsp * 1.5;
}


if (attack == 1 && jump_timer < 0) {
	vsp = -8;
	jump_timer = 100;
}
