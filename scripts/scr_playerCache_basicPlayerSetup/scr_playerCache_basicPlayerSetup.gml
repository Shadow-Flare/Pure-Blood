with PlayerStats
{
	level = 1;
	newLevels = 0;
	statPoints = 0;
	
	xp = 0;
	xpNeeded = 10*power(level+1,2);
	gold = 0;

	strength = 5;
	constitution = 5;
	dexterity = 5;
	cunning = 5;				//now unused
	intelligence = 5;
	willpower = 5;

	hpMax = 20+4*constitution;
	mpMax = 20+4*willpower;
	apMax = 10+1*cunning;
	physicalPower = 0+0.5*strength+0.5*dexterity;
	physicalStagger = 0+0.25*strength;
	physicalToughness = 2+0.30*constitution;
	magicalPower = 0+1*intelligence;
	magicalStagger = 2+0.25*intelligence+0.25*willpower;
	magicalToughness = 2+0.30*willpower;
	
	physicalBreakHp = 0;
	magicalBreakHp = 0;
	breakCooldownDuration = 1;

	ap = 0;
	hp = hpMax;
	mp = mpMax;

	moveSpeed = 1.5;
	defaultMoveSpeed = moveSpeed;
	var jumpHeightVar = 3.3;										//total jump height in blocks (16x16px or 128x128)
	jumpPow = sqrt(2*(jumpHeightVar*16)*GameManager.grav);		//jumpHeightVar*<blockSize>

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
	specialResistances[0] = 100;		//Bleed

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
	
	//inventory data
		//items
		
		//weapons
		
		//equipments
		scr_player_inventory_manage(itemType.equipment,equipmentItem.arrow,20);
		scr_player_inventory_manage(itemType.equipment,equipmentItem.bomb,3);
		scr_player_inventory_manage(itemType.equipment,equipmentItem.grappling_hook,1);
		scr_player_inventory_manage(itemType.equipment,equipmentItem.shovel,1);
		//Accessories

		//keys
		scr_player_inventory_manage(itemType.key,keyItem.summon_stone,1);
		scr_player_inventory_manage(itemType.key,keyItem.hearthstone,1);
		scr_player_inventory_manage(itemType.key,keyItem.wooden_key,1);
		//alchemy
	
	//ability data
		scr_player_giveallabilities();
		//combat
		//movement
		//support
	
	//weapon data
		//main weapons
	classComboCache = ds_map_create();
	GCS = noone;
	GFS = noone;
	ACS = noone;
	AFS = noone;
	scr_resetComboData(weaponClass.sword);
	scr_resetComboData(weaponClass.spear);
	
	heldWeapons[0] = weaponItem.gladius;			//start with gladius equipped in slot 1
	heldWeapons[1] = weaponItem.hastam;				//start with hastam equipped in slot 2
	currentWeaponID = heldWeapons[0];				//start with slot 1 weapon held
	
		//offhands
	scr_set_offhand(0);			//crossbow
	scr_set_offhand_sub(0);		//normal
	scr_set_offhand_active(0);	//ropeshot
	
	//misc
	isInvulnerable = false;
}

GameManager.currentCheckpointID = 0;