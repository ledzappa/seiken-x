// Load Audiogroups
if (!audio_group_is_loaded(audiogroup_default)) {
  audio_group_load(audiogroup_default);
}

if (!audio_group_is_loaded(audiogroup_soundtrack)) {
  audio_group_load(audiogroup_soundtrack);
}

// 0 = main
// 1 = sfx
activeSoundGroup = 0;
volumes = [1, 1];

// Set Show only soundgroup name boolean
soundGroupOnly = false;	

// Show Soundgroup loading progress Boolean
load = true;

// Text Alpha
alpha = 0;

// Display soundgroup name
showText = "";

// Start the soundtrack
alarm[0] = 10;