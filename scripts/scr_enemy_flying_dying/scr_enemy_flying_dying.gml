phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.none:
	case subState.aerialStagger:
		switch vPhase
		{
			case vState.grounded:
				if subPhaseTimer >= round(room_speed*deathDuration)
				{
					isDead = true;
				}
					//xSpd
				xSpd -= xSpd/8;
					//Sprite
				update_sprite_enemy(sprBASEBodyDying,-deathDuration);
				break;
			case vState.jumping:
			case vState.midAir:
				subPhaseTimer = 0;
					//apply gravity (done in Vstate)
				//ySpd += GameManager.grav;
					//Sprite
				update_sprite_enemy(sprBASEBodyStagger,-staggeredDuration);
				if image_index == sprite_get_number(image_index)-1 image_speed = 0;
				break;
		}
		break;
}
		
#endregion

if isDead
{
	image_speed = 0;
	image_alpha -= 1/(60*deathFadeDuration);
	if image_alpha <= 0
	{
		instance_destroy();
	}
}