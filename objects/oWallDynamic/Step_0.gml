/// @description Insert description here
// You can write your code in this editor
timer++;

if (timer > duration) {
	is_solid = !is_solid;
	timer = 0;
}

image_alpha = is_solid ? 1 : 0.3; 