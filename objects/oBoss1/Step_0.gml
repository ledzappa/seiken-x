/// @description Insert description here
// You can write your code in this editor
if (attack != 2) {
	vsp += grv;
}

jump_timer--;
attack_timer--;
if (attack == 2) {
	shoot_timer--;
}

/*
if (place_meeting(x, y, obj_player)) {
	show_debug_message(obj_player.invincible_timer);
	if (obj_player.invincible_timer < 0) {
		show_debug_message("Boss hit player");
		obj_player.hp -= dmg;
	}	
}
*/

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

if (attack == 2 && shoot_timer < 0) {
	shoot_timer = 30;
	shoot_direction_toggle = !shoot_direction_toggle;
	with (instance_create_layer(x, y, "bullets", obj_enemybullet)) {
		speed = 2;
		direction = oBoss1.shoot_direction_toggle ? 45 : 0;
	}
	with (instance_create_layer(x, y, "bullets", obj_enemybullet)) {
		speed = 2;
		direction = oBoss1.shoot_direction_toggle ? 135 : 90;
	}
	with (instance_create_layer(x, y, "bullets", obj_enemybullet)) {
		speed = 2;
		direction = oBoss1.shoot_direction_toggle ? 225 : 180;
	}
	with (instance_create_layer(x, y, "bullets", obj_enemybullet)) {
		speed = 2;
		direction = oBoss1.shoot_direction_toggle ? 315 : 270;
	}
}


// phase 2 - fly to middle of screen and shoot around


if (hp < 30 && phase != 2) {
  sprite_index = sBoss1phase2;
	phase = 2;
	hsp = hsp * 1.5;
}


if (attack == 1 && jump_timer < 0) {
	vsp = -8;
	jump_timer = 100;
}
