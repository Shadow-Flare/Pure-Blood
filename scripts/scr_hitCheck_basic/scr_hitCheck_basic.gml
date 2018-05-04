var taken = [];
taken[0] = 0;
taken[1] = 0;
taken[2] = 0;

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
			hasBeenHit = true;
			//lastHitType = attack.hitType;
				//stats
			if isInvulnerable == false
			{
				var damTotal = attack.hitData[? damageData.slash]+attack.hitData[? damageData.pierce]+attack.hitData[? damageData.blunt]+attack.hitData[? damageData.fire]+attack.hitData[? damageData.ice]+attack.hitData[? damageData.lightning]+attack.hitData[? damageData.arcane]+attack.hitData[? damageData.light]+attack.hitData[? damageData.dark];
				taken[0] = damTotal;
				taken[1] = attack.hitData[? damageData.stagger];
				taken[2] = attack.hitData[? damageData.knockback];;
			}
		}
	}
}

return taken;