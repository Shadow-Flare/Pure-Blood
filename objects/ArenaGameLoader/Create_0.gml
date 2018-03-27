var tmpID = 17;
tmpID--; controllers[tmpID] = ConsoleManager;
tmpID--; controllers[tmpID] = HudManager;
tmpID--; controllers[tmpID] = TargetManager;
tmpID--; controllers[tmpID] = PlayerStats;
tmpID--; controllers[tmpID] = MapManager;
tmpID--; controllers[tmpID] = DialogCache;
tmpID--; controllers[tmpID] = AudioCache;
tmpID--; controllers[tmpID] = ItemCache;
tmpID--; controllers[tmpID] = AbilityCache;
tmpID--; controllers[tmpID] = LootCache;
tmpID--; controllers[tmpID] = RoomCache;
tmpID--; controllers[tmpID] = ComboCache;
tmpID--; controllers[tmpID] = WorldCache;
tmpID--; controllers[tmpID] = InputManager;
tmpID--; controllers[tmpID] = EffectsManager;
tmpID--; controllers[tmpID] = ArenaController;
tmpID--; controllers[tmpID] = CutsceneManager;

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
				enemyValues[i,4] = objFlyingSkeleton
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
	arenaStats[0] = enemyValues[enemyID,0];			//Enemy Name
	arenaStats[1] = enemyID;							//Enemy Number
	arenaStats[2] = enemyValues[enemyID,1];			//Enemy Maximum Hp
	arenaStats[3] = enemyValues[enemyID,2];			//Enemy Physical Power
	arenaStats[4] = enemyValues[enemyID,3];			//Enemy Invulnerability
	arenaStats[5] = PlayerStats.isInvulnerable;		//Player Invulnerability
	arenaStats[6] = "Manor: Small";				//Arena Name
	arenaStats[7] = "off";						//hook points
	arenaStats[8] = "off";						//platforms
}
#endregion
