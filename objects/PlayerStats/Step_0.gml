//level up
if xp >= xpNeeded
{
	message_feed_add("Level Up");
	scr_levelUp_effect();
	xp -= xpNeeded;
	level += 1;
	xpNeeded = 10*power(level+1,2);
	//newLevels += 1;				//add later
	statPoints += 3;
	hp = hpMax;
	mp = mpMax;
}

//update stats
hpMax = 20+4*constitution;
mpMax = 20+4*willpower;
physicalPower = 0+0.25*strength+0.25*dexterity;
physicalStagger = 0.5+0.05*strength;
magicalPower = 0+1*intelligence;
magicalStagger = 2+0.25*intelligence+0.25*willpower;
physicalToughness = 2+0.30*constitution;
magicalToughness = 2+0.30*willpower;