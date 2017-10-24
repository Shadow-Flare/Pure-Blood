timer++;

if sign(attackDuration) == -1
{
	if timer == round(abs(attackDuration)*room_speed)
	{
		ds_list_clear(hitList);
		timer = 0;
		hasHit = 0;
		soundPlayed = 0;
	}
}
else if timer == round((attackDuration)*room_speed)
{
	instance_destroy();
}

if follow
{
	x = caster.x+facing*attackXOffset;
	y = caster.y+attackYOffset;
}

//audio (make reflective of attack)
if hasHit == 1 && !soundPlayed 
{
	audio_play_sound(snd_enemy_hit,10,0);
	soundPlayed = 1;
}