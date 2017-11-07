//find an enemy spawner
var num = instance_number(objEnemySpawner)
spawnerNum = irandom_range(0,num-1)
spawner = instance_find(objEnemySpawner,spawnerNum);

//data
phase = hordeModeState.waiting;

currentWave = 0;
phaseTimer = 0;

waitDuration = 3;
spawnInterval = 2;