var tmpID = 14;
tmpID--; controllers[tmpID] = ConsoleManager;
tmpID--; controllers[tmpID] = HudManager;
tmpID--; controllers[tmpID] = TargetManager;
tmpID--; controllers[tmpID] = PlayerStats;
tmpID--; controllers[tmpID] = MapManager;
tmpID--; controllers[tmpID] = AudioCache;
tmpID--; controllers[tmpID] = ItemCache;
tmpID--; controllers[tmpID] = AbilityCache;
tmpID--; controllers[tmpID] = LootCache;
tmpID--; controllers[tmpID] = RoomCache;
tmpID--; controllers[tmpID] = ComboCache;
tmpID--; controllers[tmpID] = InputManager;
tmpID--; controllers[tmpID] = EffectsManager;
tmpID--; controllers[tmpID] = ArenaController;

event_inherited();

scr_playerCache_basicPlayerSetup();

#region Arena controller Setup
with ArenaController
{
	//initialisers
	spawnTimer = -1;

	numberOfEnemies = 6;	//CHANGE AS ENEMIES ARE REFACTORED!
	for(var i = 0; i < numberOfEnemies; i++)
	{
		switch i
		{
			case 0:
				enemyValues[i,0] = "Zombie"
				enemyValues[i,4] = objZombie
				break;
			case 1:
				enemyValues[i,0] = "Guard Servant"
				enemyValues[i,4] = objServantGuard
				break;
			case 2:
				enemyValues[i,0] = "Lantern Servant"
				enemyValues[i,4] = objServantLantern
				break;
			case 3:
				enemyValues[i,0] = "Bound Servant"
				enemyValues[i,4] = objServantBound
				break;
			case 4:
				enemyValues[i,0] = "Sanguine Connoisseur"
				enemyValues[i,4] = objSanguineConnoisseur
				break;
			case 5:
				enemyValues[i,0] = "Blood Hound"
				enemyValues[i,4] = objBloodHound
				break;
			case 6:
				enemyValues[i,0] = "Flying Skeleton"
				enemyValues[i,4] = obj_flying_skeleton
				break;
		}


	
		var temp = instance_create_depth(0,0,0,enemyValues[i,4]);
		var cache = temp.statCache;
		enemyValues[i,1] = cache.hpMax;
		enemyValues[i,2] = cache.damagePower;
	
		enemyValues[i,3] = false;
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
