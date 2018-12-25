// get input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_dash = keyboard_check_pressed(ord("Z"));

//Kimmo Get input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(ord("K"));
key_dash = keyboard_check_pressed(ord("L"));

var move = key_right - key_left;
var isGrounded = place_meeting(x, y + 1, oWalls);
hsp = move * walksp;
vsp = vsp + grv;

Grounded = place_meeting(x,y+1,oWall);
//show_debug_message("IsGrounded?: "+"Grounded")
//Timer
timer++;
if(timer > 500) timer  = 0;

invincibleTimer--;
//dashtimer--;
if(dashtimer != 0) dashtimer = Approach(dashtimer,0,0.8);

if ( (dashtimer == 0) && (!airdash) ) {
	walksp = 3;
}







// horizontal collision
if (place_meeting(x + hsp, y, oWalls)) {
	while(!place_meeting(x + sign(hsp), y, oWalls)) {
		x = x + sign(hsp);
	}
	hsp = 0;
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






// jump!
if (key_jump && vsp == 0 && isGrounded) {
	vsp = -7;
	extra_jump = 1;
}
	if(key_jump && extra_jump == 1 && vsp >= -1)
	
// Doublejump
if (oItems.doubleJump)
{
	if(extra_jump != 0)
	{
		if (vsp > -1)
		{
			if(key_jump)
			{
				vsp = -7;
				extra_jump = 0;
			}
		}
	}
}


// dash
if (oItems.dash && key_dash && dashtimer == 0 && !airdash) {
	dashing = true;
	dashtimer = 8;
	walksp += 3;	
}

// ANIMATION:
// jump
if(!Grounded)
{
	if (vsp < 0) {
		if (dashing) {
			airdash = true;
		}
		if (!playerHurt) sprite_index = sPlayerJump;
		image_speed = 0;
}
} else {
	if (!playerHurt) sprite_index = sPlayer;
	image_speed = 0;
}


// flip left / right
if (move != 0) {
	pmove = move;
	if (move == -1) {
	image_xscale = -1;
	} else {
		image_xscale = 1;
	}
}

// if outside camera-y
if (y > oCamera.y + 500 || hp < 0) {
	room_restart();
}

if (invincibleTimer > 0 && !playerHurt) {
	playerHurt = true;
	sprite_index = sPlayerHurt;
} else if (invincibleTimer < 0 && playerHurt) {
	playerHurt = false;
	sprite_index = sPlayer;
}


show_debug_overlay(true);
// show_debug_message(oCamera.y);


//Restart the game
if (keyboard_check_pressed(vk_enter)) game_end();
//Quit the game
if (keyboard_check_pressed(vk_escape)) game_restart();