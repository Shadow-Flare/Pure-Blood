event_inherited();

enum hordeModeState {waiting, wave};

//find an enemy spawner
instance_number(objEnemySpawner)
spawnerNum = irandom_range(0,instance_number(objEnemySpawner)-1)
spawner = instance_find(objEnemySpawner,spawnerNum);

//data
phase = hordeModeState.waiting;

currentWave = 0;
phaseTimer = 0;

waitDuration = 3;
spawnInterval = 2;