// input
scr_getinput();

if (key_debug) {
  global.enable_debug = !global.enable_debug;
}

// standStill is set to true when shooting upwards
if (!standStill) {
  var move = key_right - key_left;
} else {
  var move = 0;
}

var isGrounded =
  place_meeting(x, y + 1, oWalls) || place_meeting(x, y + 2, obj_platforms);
var isLanded = place_meeting(x, y + sign(vsp), oWalls);
hsp = move * walksp;
vsp = clamp(vsp + grv, -7, 8);

timer++;
if (timer > 500) timer = 0;

invincibleTimer--;
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

// reset gravity if not on platform
if (!place_meeting(x, y + 10, obj_platforms)) {
  grv = 0.4;
  onPlatform = false;
}

// jump!

if (isGrounded) {
  if (vsp == 0 || onPlatform) {
    if (key_jump) {
		show_debug_message("jump!");
	    vsp = -7;
	    extra_jump = 1;
    }
  }
}

// jump again!
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
if (isLanded) audio_play_sound(fxLandingSound, 1000, false);

/*##########################  ANIMATIONS /*##########################*/

// Run Animation
if (isGrounded) {
  if (move > 0 || move < 0) {
    if (sprite_index != sPlayerRun) {
      sprite_index = sPlayerRun;
      image_index = 0;
      image_speed = 1;
    }
  }
}

// Idle
if (isGrounded) {
  if (move == 0) {
    if (sprite_index != sPlayer) {
      sprite_index = sPlayer;
      image_index = 0;
      image_speed = 1;
    }
  }
}

// Jump Animation
if (!isGrounded) {
  if (vsp < 0) {
    if (dashing) {
      airdash = true;
    }
    if (sprite_index != sPlayerJump) {
      sprite_index = sPlayerJump;
      image_index = 0;
      image_speed = 1;
    }
	//Loop last frames of jumping animation
	if(sprite_index == sPlayerJump)
	{
		if(round(image_index) > sprite_get_number(sprite_index))
		{
			image_index = 2;
			image_index = clamp(image_index,2,sprite_get_number(sprite_index));
		}
	}
  }
}

// Fall Animation
if (!isGrounded) {
  if (vsp > 0) {
    if (sprite_index != sPlayerFall) {
      sprite_index = sPlayerFall;
      image_index = 0;
      image_speed = 1;
    }
	//Loop last frames of jumping animation
	if(sprite_index == sPlayerFall)
	{
		if(round(image_index) > sprite_get_number(sprite_index))
		{
			image_index = 2;
			image_index = clamp(image_index,2,sprite_get_number(sprite_index));
		}
	}
  }
}

/* ########################## ANIMATIONS ########################## */

// flip left / right
if (move != 0) {
  pmove = move;
  if (move == -1) {
    image_xscale = -1;
  } else if (move == 1) {
    image_xscale = 1;
  }
}

// if outside camera-y or out-of-hp
if (y > obj_camera.y + 500 || hp < 0) {
  room_restart();
}

if (invincibleTimer > 0 && !playerHurt) {
  playerHurt = true;
  sprite_index = sprite_index;
} else if (invincibleTimer < 0 && playerHurt) {
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
