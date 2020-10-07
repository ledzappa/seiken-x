if (global.paused) exit;
// input
scr_getinput();
var move = 0;

if (!freeze_inputs) {
	move = key_right - key_left;
}

var is_grounded =
  place_meeting(x - (10*move), y + 1, oWalls) || place_meeting(x, y + 2, obj_platforms);
var is_landed = place_meeting(x, y + sign(vsp), oWalls);
hsp = move * walksp;
vsp = clamp(vsp + grv, -7, 8);
invincible_timer--;
dashtimer--;
hurt_timer--;

if (player_hurt) {
	if (hurt_timer > 15) {
		hsp = -pmove * 1;
	} else {
		hsp = 0;
	}
}

if (hurt_timer == 0) {
	player_hurt = false;
}

if (dashtimer != 0) dashtimer = Approach(dashtimer, 0, 0.8);

if (dashtimer < 0 && (!airdash || onPlatform)) {
  walksp = 2.5;
}

// ladder
ladder = instance_place(x, y, oLadder);
if (ladder != noone) {    
	if (key_up || (key_down && !is_grounded)) {
		climbing = true;
		x  = obj_player.x < ladder.x ? x + 1 : x - 1;
		vsp = key_up ? -2 : 2;
		hsp = 0;
	}
	
	if (climbing && !key_up && !key_down && !is_grounded) {
		hsp = 0;
		vsp = 0;
	}
}

if (is_grounded || key_jump) {
	climbing = false;
}

// horizontal collision
if (place_meeting(x + hsp, y, oWalls)) {
  while (!place_meeting(x + sign(hsp), y, oWalls)) {
    x = x + sign(hsp);
  }
  hsp = 0;
}
x += hsp;

// vertical collision
if (place_meeting(x, y + vsp, oWalls)) {
  while (!place_meeting(x, y + sign(vsp), oWalls)) {
    y = y + sign(vsp);
  }
  airdash = false;
  vsp = 0;
}
y += vsp;

// reset gravity if not on platform
if (!place_meeting(x, y + 10, obj_platforms)) {
  grv = 0.4;
  onPlatform = false;
}

inst = instance_place(x, y, oEnemies);
if (inst != noone && invincible_timer < 0) {    
	hp -= inst.dmg;
}

if (place_meeting(x, y, oEnemies) || 
		place_meeting(x, y, obj_enemygrenadeexplosion) || 
		place_meeting(x, y, obj_enemybullet)) {
	if (invincible_timer < 0) {
		hurt_timer = 25;
		invincible_timer = 100;
		if (hp > 0) {
			player_hurt = true;
			audio_play_sound(fxEnemyDamage, 100, false);
		} else {
			player_dead = true;
			freeze_inputs = true;
		}
	}
}


// jump
if (!player_hurt && is_grounded && key_jump) {
	vsp = -7;
	extra_jump = 1;
	airdash = dashing;
}

// double jump
if (doubleJump && key_jump && extra_jump == 1 && vsp >= 0) {
  vsp = -7;
  extra_jump = 0;
}

// dash
/*
if (oItems.dash && key_dash && dashtimer < 0 && (!airdash || onPlatform)) {
  dashing = true;
  dashtimer = 8;
  walksp += 2.5;
}
*/

//Land sound
//if (is_landed) audio_play_sound(fxLandingSound, 1000, false);

// Animations
if (!player_dead) {
	if (is_grounded) {
	  if (move == 0) {
			if (sprite_index != sPlayer) {
				// idle
				sprite_index = sPlayer;
				image_index = 0;
				image_speed = 1;
			}
	  } else {
			if (sprite_index != sPlayerRun) {
				// running
				sprite_index = sPlayerRun;
				image_index = 0;
				image_speed = 1;
			}
	  }
	} else if (!climbing){
		var s_index = vsp < 0 ? sPlayerJump : sPlayerFall;
	  if (sprite_index != s_index) {
			// jumping or falling
	    sprite_index = s_index;
	    image_index = 0;
	    image_speed = 1;
	  } else if (round(image_index) > sprite_get_number(sprite_index)) {
			image_index = 2;
			image_index = clamp(image_index, 2, sprite_get_number(sprite_index));
		}
	}

	if (player_hurt) {
		if (sprite_index != sPlayerHurt) {
			sprite_index = sPlayerHurt;
	    image_index = 0;
	    image_speed = 1;
		}
	}

	if (climbing) {
		if (sprite_index != sPlayerClimb) {
			sprite_index = sPlayerClimb;
		}
	}
} else {
	restart_timer--;
	if (sprite_index != sPlayerDeath) {
		audio_play_sound(wBulletChargeShot1, 100, true);
		sprite_index = sPlayerDeath;
		image_index = 0;
		image_speed = 1;
	}
	
	if (image_index == 20) {
		audio_stop_sound(wBulletChargeShot1);
		audio_play_sound(fxPlayerDeath, 100, false);
	}
	
	if (image_index > 24) {
		image_speed = 0;
	}
}

// flip left / right
if (move != 0) {
  pmove = move;
  image_xscale = move;
}

// if outside camera-y or out-of-hp
if (y > obj_camera.y + 500) {
  room_restart();
}

if (invincible_timer > 0 && !playerHurt) {
  playerHurt = true;
  //sprite_index = sprite_index;
} else if (invincible_timer < 0 && playerHurt) {
  playerHurt = false;
  //sprite_index = sPlayer;
}


if (doubleJump && doubleJumpTimer < doubleJumpTime) {
  doubleJumpTimer++;
} else {
  doubleJumpTimer = 0;
  doubleJump = false;
}

hp = clamp(hp, 0, 100);

if (restart_timer < 0) {
	game_restart();
}