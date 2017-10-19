timer++;

if timer == floor((attackDuration)*room_speed)
{
	instance_destroy();
}

x = caster.x+facing*attackXOffset;
y = caster.y+attackYOffset;

//audio (make reflective of attack)
if hasHit == 1 && !soundPlayed 
{
	audio_play_sound(snd_enemy_hit,10,0);
	soundPlayed = 1;
}