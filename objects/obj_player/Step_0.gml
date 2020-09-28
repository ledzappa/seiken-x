// input
scr_getinput();

var move = key_right - key_left;
var is_grounded =
  place_meeting(x, y + 1, oWalls) || place_meeting(x, y + 2, obj_platforms);
var is_landed = place_meeting(x, y + sign(vsp), oWalls);
hsp = move * walksp;
vsp = clamp(vsp + grv, -7, 8);
invincible_timer--;
dashtimer--;

if (dashtimer != 0) dashtimer = Approach(dashtimer, 0, 0.8);

if (dashtimer < 0 && (!airdash || onPlatform)) {
  walksp = 2.5;
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

// jump
if (is_grounded && key_jump) {
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
if (oItems.dash && key_dash && dashtimer < 0 && (!airdash || onPlatform)) {
  dashing = true;
  dashtimer = 8;
  walksp += 2.5;
}

//Land sound
if (is_landed) audio_play_sound(fxLandingSound, 1000, false);

// Animations
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
} else {
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

// flip left / right
if (move != 0) {
  pmove = move;
  image_xscale = move;
}

// if outside camera-y or out-of-hp
if (y > obj_camera.y + 500 || hp < 0) {
  room_restart();
}

if (invincible_timer > 0 && !playerHurt) {
  playerHurt = true;
  sprite_index = sprite_index;
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
