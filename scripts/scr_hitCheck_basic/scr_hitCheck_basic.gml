for (var i = 0; i < 10; i++) lastHitTypes[| i] = false;

with objAttackEffectParent
{
	var attack = id;
	var enemy = caster;
	if hitOn && other != caster && is_enemy(other.actorType,casterType) && place_meeting(x,y,other) && ds_list_find_index(hitList,other) == -1
	{
		ds_list_add(hitList,other);
		enemy.lastAttackHasHit = true;
		with other
		{
				//stats
			if isInvulnerable == false
			{
					//last/has-been hit data
				lastHitTypes[| damageType.none] = true;		//this is the general hit checker
				if attack.hitData[? damageData.slash] > 0			lastHitTypes[| damageType.slash] = true;
				if attack.hitData[? damageData.pierce] > 0			lastHitTypes[| damageType.pierce] = true;
				if attack.hitData[? damageData.blunt] > 0			lastHitTypes[| damageType.blunt] = true;
				if attack.hitData[? damageData.fire] > 0			lastHitTypes[| damageType.fire] = true;
				if attack.hitData[? damageData.ice] > 0				lastHitTypes[| damageType.ice] = true;
				if attack.hitData[? damageData.lightning] > 0		lastHitTypes[| damageType.lightning] = true;
				if attack.hitData[? damageData.arcane] > 0			lastHitTypes[| damageType.arcane] = true;
				if attack.hitData[? damageData.light] > 0			lastHitTypes[| damageType.light] = true;
				if attack.hitData[? damageData.dark] > 0			lastHitTypes[| damageType.dark] = true;
				
				return attack.hitData;
			}
		}
	}
}

return noone;