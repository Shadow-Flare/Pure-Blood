phaseTimer++;
subPhaseTimer++;

switch subPhase
{
	case subState.actionSub1:
			//Ticks
		if subPhaseTimer == round(action4TickTime*room_speed)
		{
			var spawnNum = irandom_range(action4TickMin,action4TickMax)
			repeat(spawnNum)
			{
				with instance_create_depth(x+facing*action4TickXOffset,y+action4TickYOffset,depth,objBloodHoundTick)
				{
					var spd = random_range(2,3);
					var ang = random_range(40,55);
					if other.facing == -1 ang = 180-ang;
					facing = irandom(1);
					if facing == 0 facing = -1;
					xSpd = dcos(ang)*spd;
					ySpd = -dsin(ang)*spd;
				}
			}
			if action4SoundID != noone audio_play_sound(action4AttackSoundID,10,0);
		}
			//reset
		if subPhaseTimer == round(action4Duration*room_speed)
		{
			phase = state.base;
			scr_enemy_ground_base_subPhaseDeterminer();
			phaseTimer = 0;
			subPhaseTimer = 0;
		}
			//xSpd
		xSpd -= xSpd/4;
			//sprite
		update_sprite_enemy(action4Animation,-action4Duration)
		break;
}