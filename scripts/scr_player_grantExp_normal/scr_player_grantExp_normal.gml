///@arg xp
var xpToGrant = argument0;

with PlayerStats
{
	xp += xpToGrant;

	if xp >= xpNeeded
	{
		message_feed_add("Level Up",noone);
		scr_levelUp_effect();
		xp -= xpNeeded;
		level += 1;
		xpNeeded = 10*power(1.5,level);
		//newLevels += 1;				//add later
		statPoints += 3;
		hp = hpMax;
		mp = mpMax;
	}
}