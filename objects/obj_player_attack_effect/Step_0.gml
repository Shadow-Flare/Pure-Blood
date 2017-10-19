timer++;

if timer == floor((attackDuration+attackCooldown)*room_speed)
{
	instance_destroy();
}

for (var i = 0; i < array_length_1d(attackHitStarts); i++)
{
	if timer == floor(attackHitStarts[i]*room_speed)
	{
		effectOn = 1;
		hasHit = 0;
		hitType = attackDamageType[i];
		hitDamage = attackDamageModifier[i] * PlayerStats.physicalPower;
		statusType = attackStatusType[i];
		statusValue = attackStatusValue[i];									 // make factor of player stats
		hitStagger = attackStaggerModifier[i] * PlayerStats.physicalStagger;		 // make factor of player stats
		hitKnockback = attackKnockback[i];
		hitOn = 1;
		image_blend = c_blue;
	}
}

for (var i = 0; i < array_length_1d(attackHitStarts); i++)
{
	if timer == floor((attackHitStarts[i]+attackHitDurations[i])*room_speed)
	{
		hitOn = 0;
		effectOn = 0;
		image_blend = c_white;
		if attackName == "Gut" && !hasHit instance_destroy();
	}
}

x = objPlayer.x+facing*attackXOffset;
y = objPlayer.y+attackYOffset;

//audio (make reflective of attack)
if hasHit == 1 && !soundPlayed 
{
	audio_play_sound(snd_sword_hit,10,0);
	soundPlayed = 1;
}