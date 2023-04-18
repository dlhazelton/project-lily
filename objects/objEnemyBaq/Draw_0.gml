/// @description Hitflash
draw_self();

if (hitFlash > 0) // When enemy is hit
{
	hitFlash--;
	shader_set(shdHitflash);
	draw_self();
	shader_reset();
}
