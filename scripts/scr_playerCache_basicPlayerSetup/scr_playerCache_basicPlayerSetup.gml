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
	
	jumpHeightVarInitial = 3.3;											//total jump height in blocks (16x16px or 128x128)
	jumpHeightVar = jumpHeightVarInitial
	jumpPow = sqrt(2*(jumpHeightVar*16)*GameManager.grav);		//jumpHeightVar*<blockSize>

	hitEffectType = "blood";
	hitEffectColour = "dark red";

	//Damage type resistances (as percentage; 1 = 100% of damage is recieved)
	damageResistances[damageType.slash] = 1;
	damageResistances[damageType.blunt] = 1;
	damageResistances[damageType.pierce] = 1;
	damageResistances[damageType.fire] = 1;
	damageResistances[damageType.ice] = 1;
	damageResistances[damageType.lightning] = 1;
	damageResistances[damageType.arcane] = 1;
	damageResistances[damageType.light] = 1;
	damageResistances[damageType.dark] = 1;
	damageResistances[damageType.pure] = 1;			//should allways be 1

	//Special activation check, all initially false
	specialHasActivated[specialType.bleed] = false	

	//Special Cooldowns (seconds)
	specialCooldowns[specialType.bleed] = 6	

	//Special Damage initializers
	specialDamages[0] = 0;						//Bleed

	//Special resistances (100 is considered normal)
	specialResistances[0] = 100;				//Bleed

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
	GCSMod = 0;
	GFSMod = 0;
	ACSMod = 0;
	AFSMod = 0;
		
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