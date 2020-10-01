/// @description Insert description here
// You can write your code in this editor
if (invincible_timer < 0) {
	hurt_timer = 25;
	invincible_timer = 100;
	player_hurt = true;
	audio_play_sound(fxEnemyDamage, 100, false);
}
