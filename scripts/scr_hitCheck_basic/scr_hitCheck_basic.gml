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
			lastHitType = attack.hitType;
				//stats
			if isInvulnerable == false
			{
				taken[0] = attack.hitDamage;
				taken[1] = attack.hitStagger;
				taken[2] = attack.hitKnockback;
			}
		}
	}
}

return taken;