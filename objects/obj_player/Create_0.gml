/// @description Insert description here
// You can write your code in this editor
hp = 100;
hp_max = 100;
extra_jump = 0;
doubleJumpTime = 1200; // 20s

// timers
doubleJumpTimer = 0;
timer = 0;
dashtimer = 0;
hurt_timer = 0;

hsp = 0;
vsp = 0;
walksp = 2.5;

pmove = 0;

//states
player_hurt = false;
player_dead = false;
on_platform = false;
doubleJump = false;
dashing = false;
airdash = true;
climbing = false;
climbing_idle = false;

//timers
invincible_timer = 0;
restart_timer = 250;

if (global.checkpointR == room) {
	x = global.checkpointX;
	y = global.checkpointY;
}