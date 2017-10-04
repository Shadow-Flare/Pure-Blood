with objAttackEffectParent
{
	var attack = id;
	var enemy = caster;
	if caster.actorType = actorTypes.enemy && place_meeting(x,y,other)
	{
		with other
		{
			var dirNum = sign(x-enemy.x);
			if hitPhase == hitState.blocking && dirNum == -facing
			{
				hasBlocked = 1;
			}
			else if hitPhase == hitState.normal
			{
				//audio (make reflective of damage type and other variables)
				audio_play_sound(snd_enemy_hit,10,0);
				//stats
				if PlayerStats.isInvulnerable == false scr_hit_player(attack,attack.hitType,attack.hitDamage,attack.statusType,attack.statusValue,enemy);
				//determine reaction
				if attack.hitStagger <= PlayerStats.toughness var reaction = 0;										//nothing
				else if attack.hitStagger <= PlayerStats.toughness*2 || attack.hitKnockback == 0 reaction = 1;		//stagger
				else reaction = 2;																		//fling
				//react
				switch reaction
				{
					case 0:						//nothing
						//do nothing
						break;
					case 1:						//stagger
						//state change
						phase = state.hitReaction;
						phaseTimer = 0;
						subPhase = subState.staggered;
						subPhaseTimer = 0;
						//movement
						xSpd = attack.hitKnockback*dirNum;
						break;
					case 2:						
						//state change
						phase = state.hitReaction;
						phaseTimer = 0;
						subPhase = subState.flung;
						subPhaseTimer = 0;
						//movement
						xSpd = attack.hitKnockback*dirNum;
						var reactDir = 35+random_range(-5,5);
						xSpd = dirNum*attack.hitKnockback*dcos(reactDir);
						ySpd = -attack.hitKnockback*dsin(reactDir);
						break
				}
			}
		}
	}
}