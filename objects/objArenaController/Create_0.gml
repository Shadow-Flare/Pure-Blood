player = instance_find(obj_player,0)

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
	enemyValues[i,1] = temp.maxHp
	enemyValues[i,2] = temp.physicalPower
	
	enemyValues[i,3] = "Off"
	enemyList[i] = enemyValues[i,0];
	instance_destroy(temp);
}

//stats
enemyID = 0;
arenaStats[0] = enemyValues[0,0];			//Enemy Name
arenaStats[1] = 1;							//Enemy Number
arenaStats[2] = enemyValues[0,1];			//Enemy Maximum Hp
arenaStats[3] = enemyValues[0,2];			//Enemy Physical Strength
arenaStats[4] = enemyValues[0,3];			//Enemy Invulnerability
arenaStats[5] = global.hpMax;				//Player Maximum Hp
arenaStats[6] = player.physicalPower;		//Player Physical Strength
arenaStats[7] = player.isInvulnerable;		//Player Invulnerability
arenaStats[8] = "Manor: Small";				//Arena Name
arenaStats[9] = "off";						//hook points
arenaStats[10] = "off";						//platforms