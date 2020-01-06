// Increase & Decrease Soundtrack volume by 10 %
if (switchGroup == 0) {
if(keyboard_check_pressed(vk_up)) {sfxVol += 0.05; alpha = 1; audio_play_sound(fxSwitch2,1000,false);}
if(keyboard_check_pressed(vk_down)) {sfxVol -= 0.05; alpha = 1; audio_play_sound(fxSwitch2,1000,false);}
}
// Increase & Decrease Soundtrack volume by 10 %
if (switchGroup == 1) {
if(keyboard_check_pressed(vk_up)) {mainVol += 0.05; alpha = 1; audio_play_sound(fxSwitch2,1000,false);}
if(keyboard_check_pressed(vk_down)) {mainVol -= 0.05; alpha = 1; audio_play_sound(fxSwitch2,1000,false);}
}

// Toggle between groups
if(keyboard_check_pressed(vk_add)) {switchGroup++; alpha = 1; soundGroupOnly = true; audio_play_sound(fxSwitch1,1000,false);}
if(keyboard_check_pressed(vk_subtract)) {switchGroup--; alpha = 1;soundGroupOnly = true;audio_play_sound(fxSwitch1,1000,false);}

// Switch only between 2 groups
if(switchGroup > 1) switchGroup = 0;
if(switchGroup < 0) switchGroup = 1;
// Give Audiogroup names
if(switchGroup == 0) showText = "SFX";
if(switchGroup == 1) showText = "Soundtrack";

// Clamp the main volume percent between 0 & 100 %
mainVol = clamp(mainVol,0,1);
// Clamp the SFX volume percent between 0 & 100 %
sfxVol = clamp(sfxVol,0,1);

// Set Soundtrack audiogroup volume to mainVol
if (switchGroup == 0) {
	audio_group_set_gain(switchGroup,sfxVol,0);
}

// Set Soundtrack audiogroup volume to mainVol
if (switchGroup == 1) {
	audio_group_set_gain(switchGroup,mainVol,0);
}



// Always approach Alpha to value 0
alpha = Approach(alpha,0,0.05);
if (alpha == 0) {
	soundGroupOnly = false;	
}