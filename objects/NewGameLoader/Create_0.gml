controllers[4] = RoomCache;
controllers[3] = ComboCache;
controllers[2] = InputManager;
controllers[1] = EffectsManager;
controllers[0] = PlayerStats;

event_inherited();

#region Player Stats setup: new game
with PlayerStats
{
	xp = 0;
	gold = 0;

	strength = 5;
	constitution = 5;
	dexterity = 5;
	cunning = 5;				//now unused
	intelligence = 5;
	willpower = 5;

	hpMax = 20+4*constitution;
	mpMax = 20+4*willpower;
	physicalPower = 0+0.5*strength+0.5*dexterity;
	physicalStagger = 0+0.25*strength;
	magicalPower = 0+1*intelligence;
	magicalStagger = 2+0.25*intelligence+0.25*willpower;
	physicalToughness = 0+0.75*constitution;
	magicalToughness = 0+0.75*willpower;

	hp = hpMax;
	mp = mpMax;

	moveSpeed = 2;
	defaultMoveSpeed = moveSpeed;
	var jumpHeightVar = 2.5;								//total jump height in blocks (16x16px or 128x128)
	jumpPow = sqrt(2*(jumpHeightVar*16)*GameManager.grav);		//jumpHeightVar*<blockSize>

	comboSize = 4;
	aerialComboSize = 4;

	hitEffectType = "blood";
	hitEffectColour = "dark red";

	//Damage type resistances
	damageResistances[0] = 1;			//Slash
	damageResistances[1] = 1;			//Blunt
	damageResistances[2] = 1;			//Pierce
	damageResistances[3] = 1;			//Fire
	damageResistances[4] = 1;			//Ice
	damageResistances[5] = 1;			//Lightning
	damageResistances[6] = 1;			//Arcane
	damageResistances[7] = 1;			//Light
	damageResistances[8] = 1;			//Dark
	damageResistances[9] = 1;			//X damage

	//Special Damage initializers
	specialDamage[0] = 0;				//Bleed

	//Special resistances
	specialResist[0] = 100;				//Bleed

	//owned stuff
	upgradeHasDoubleJump = 0;
	upgradeHasHover = 0;
	upgradeHasAerialDodge = 0;

	ownedOffhands[0] = 0;
		ownedSubtypes[0,0] = 0;
		ownedSubtypes[0,1] = 1;
		ownedSubtypes[0,2] = 2;
		ownedSubtypes[0,3] = 3;
		ownedSubtypes[0,4] = 4;
		ownedActivatables[0,0] = 0;
	ownedOffhands[1] = 1;
		ownedSubtypes[1,0] = 5;
		ownedSubtypes[1,1] = 6;
		ownedSubtypes[1,2] = 7;
		ownedSubtypes[1,3] = 8;
		ownedSubtypes[1,4] = 9;
		ownedActivatables[1,0] = 2;
		ownedActivatables[1,1] = 3;

		//active combo properties
	scr_set_combo(0,5);			//slice
	scr_set_combo(1,5);			//slice
	scr_set_combo(2,5);			//slice
	scr_set_combo(3,6);			//smash

		//active combo properties
	scr_set_aerialCombo(0,16);	//slice
	scr_set_aerialCombo(1,16);	//slice
	scr_set_aerialCombo(2,16);	//slice
	scr_set_aerialCombo(3,17);	//smash

	scr_set_class("Sword");
	
	scr_set_offhand(0);			//crossbow
	scr_set_offhand_sub(0);		//normal
	scr_set_offhand_active(0);	//ropeshot
	
		//misc
	isInvulnerable = false;
}
#endregion
