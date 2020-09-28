draw_self();

if (flash > 0) {
	flash--;
	shader_set(shWhiteSprite);
	draw_self();
	shader_reset();
}