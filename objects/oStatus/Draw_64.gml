/// @description Insert description here
// You can write your code in this editor
draw_text(40, 40, hp);

if (hp > 100) {
	hp = 100;
}

if (hp < 0) {
	room_restart();
}