with objAttackEffectParent
{
	var attack = id;
	var enemy = caster;
	var stats = other.statCache
	if hitOn && is_enemy(other,caster) && place_meeting(x,y,other) && ds_list_find_index(hitList,other) == -1
	{
		ds_list_add(hitList,other);
		with other
		{
			var dirNum = sign(x-enemy.x);
			if hitPhase == hitState.blocking && dirNum == -facing
			{
				hasBlocked = 1;
			}
			else if hitPhase == hitState.normal
			{
				//audio (make reflective of damage type and other variables and remove from attack objects)
				//audio_play_sound(snd_enemy_hit,10,0);
				//stats
				if stats.isInvulnerable == false scr_hit(attack,attack.hitType,attack.hitDamage,attack.statusType,attack.statusValue,enemy);
				//determine reaction: Damage Type (-1:None|0:Slash|1:Blunt|2:Pierce|3:Fire|4:Ice|5:Lightning|6:Arcane|7:Light|8:Dark)
				switch attack.hitType
				{
					case 0: case 1: case 2:
						var toughness = stats.physicalToughness;
						break;
					case 3: case 4: case 5: case 6: case 7: case 8:
						var toughness = stats.magicalToughness;
						break;
				}
				if attack.hitStagger <= toughness var reaction = 0;										//nothing
				else if attack.hitStagger <= toughness*2 || attack.hitKnockback == 0 reaction = 1;		//stagger
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
						phased = 1;
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