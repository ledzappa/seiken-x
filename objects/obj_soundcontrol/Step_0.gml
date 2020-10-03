// Toggle between groups
add = keyboard_check_pressed(vk_add);
subtract = keyboard_check_pressed(vk_subtract);
vUp = keyboard_check_pressed(vk_up);
vDown = keyboard_check_pressed(vk_down);

// change group
if (add || subtract) {
	activeSoundGroup = add ? 0 : 1; 
	alpha = 1; 
	soundGroupOnly = true; 
	audio_play_sound(fxSwitch1,1000,false);
}

// change volume
if (vUp || vDown) {
	volumes[activeSoundGroup] += vUp ? 0.05 : -0.05;
	alpha = 1;
	audio_play_sound(fxSwitch2,1000,false);
}

// change text
showText = activeSoundGroup == 0 ? "SFX" : "Soundtrack";

// Clamp the SFX volume percent between 0 & 100 %
volumes[activeSoundGroup] = clamp(volumes[activeSoundGroup],0,1);

// Set Soundtrack audiogroup volume
audio_group_set_gain(activeSoundGroup, volumes[activeSoundGroup], 0);

// Lower soundtrack if paused
audio_group_set_gain(1, global.paused ? 0.2 : volumes[1], 0);

// Always approach Alpha to value 0
alpha = Approach(alpha,0,0.05);
if (alpha == 0) {
	soundGroupOnly = false;	
}