controllers[5] = RoomCache;
controllers[4] = ComboCache;
controllers[3] = InputManager;
controllers[2] = EffectsManager;
controllers[1] = PlayerStats;
controllers[0] = ArenaController;

event_inherited();

#region Player Stats setup
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
	toughness = 0+0.75*constitution;

	hp = hpMax;
	mp = mpMax;
	isInvulnerable = false;

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
	scr_set_aerialCombo(0,8);	//slice
	scr_set_aerialCombo(1,8);	//slice
	scr_set_aerialCombo(2,8);	//slice
	scr_set_aerialCombo(3,9);	//smash

	scr_set_class("Sword");
	
	scr_set_offhand(0);			//crossbow
	scr_set_offhand_sub(0);		//normal
	scr_set_offhand_active(0);	//ropeshot
}
#endregion

#region Arena controller Setup
with ArenaController
{
	//initialisers
	spawnTimer = -1;

	numberOfEnemies = 5;
	for(var i = 0; i < numberOfEnemies; i++)
	{
		if i == 0
		{
			enemyValues[i,0] = "Zombie"
			enemyValues[i,4] = obj_zombie
		}
		else if i == 1
		{
			enemyValues[i,0] = "Flying Skeleton"
			enemyValues[i,4] = obj_flying_skeleton
		}
		else if i == 2
		{
			enemyValues[i,0] = "Guard Servant"
			enemyValues[i,4] = obj_servant_guard
		}
		else if i == 3
		{
			enemyValues[i,0] = "Lanterns Servant"
			enemyValues[i,4] = obj_servant_lantern
		}
		else if i == 4
		{
			enemyValues[i,0] = "Blood Hound"
			enemyValues[i,4] = obj_bloodHound
		}
	
		temp = instance_create_depth(0,0,0,enemyValues[i,4]);
		enemyValues[i,1] = temp.hpMax
		enemyValues[i,2] = temp.physicalPower
	
		enemyValues[i,3] = "Off"
		enemyList[i] = enemyValues[i,0];
		instance_destroy(temp);
	}

	//stats
	enemyID = 0;
	arenaStats[0] = enemyValues[0,0];			//Enemy Name
	arenaStats[1] = 0;							//Enemy Number
	arenaStats[2] = enemyValues[0,1];			//Enemy Maximum Hp
	arenaStats[3] = enemyValues[0,2];			//Enemy Physical Strength
	arenaStats[4] = enemyValues[0,3];			//Enemy Invulnerability
	arenaStats[5] = PlayerStats.hpMax;				//Player Maximum Hp
	arenaStats[6] = PlayerStats.physicalPower;		//Player Physical Strength
	arenaStats[7] = PlayerStats.isInvulnerable;		//Player Invulnerability
	arenaStats[8] = "Manor: Small";				//Arena Name
	arenaStats[9] = "off";						//hook points
	arenaStats[10] = "off";						//platforms
}
#endregion
