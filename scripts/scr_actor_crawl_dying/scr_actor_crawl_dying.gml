phaseTimer++;
subPhaseTimer++;

	//Sub states
#region states

switch subPhase
{
	case subState.none:
	case subState.aerialStagger:
		if subPhaseTimer >= round(room_speed*deathDuration)
		{
			isDead = true;
		}
			//xSpd
		xSpd -= xSpd/8;
			//Sprite
		update_sprite_enemy(sprBASEBodyDying,-deathDuration);
		break;
}
		
#endregion