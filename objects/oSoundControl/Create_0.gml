// Load Audiogroups
if !audio_group_is_loaded(audiogroup_default) {
   audio_group_load(audiogroup_default);
}
if !audio_group_is_loaded(audiogroup_soundtrack) {
   audio_group_load(audiogroup_soundtrack);
}
// Switch group
switchGroup[0] = audiogroup_default;
switchGroup[1] = audiogroup_soundtrack;

// Set Show only soundgroup name boolean
soundGroupOnly = false;	
// Show Soundgroup loading progress Boolean
load = true;
// Text Alpha
alpha = 0;
// Display soundgroup name
showText = "";
// The soundtrack volume
mainVol = 0.2;
// SFX volume
sfxVol = 1;

// Start the soundtrack
alarm[0] = 10;