// collision with walls
var inst;
inst = instance_place(x, y, oWallBreakable);
if (inst != noone) {
  inst.hp -= dmg;
  IsHit = true;
  if (inst.hp == 0) {
    with (inst) {
      IsDead = true;
    }
  }
  instance_destroy();
}

if (place_meeting(x, y, oWall)) {
  instance_destroy();
}

// collision with enemies
enemy = instance_place(x, y, oEnemies);
if (enemy != noone && scr_objectinview(enemy.x, enemy.y)) {
	audio_play_sound(fxEnemyDamage, 100, false);
  enemy.hp -= dmg;
	enemy.flash = 3;
  if (enemy.hp == 0) {
    with (enemy) {
      instance_destroy();
      audio_play_sound(fxBrake, 1000, false);
    }
  }
  instance_destroy();
}
