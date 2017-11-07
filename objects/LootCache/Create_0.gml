lootTable = ds_map_create()

var tmpId = objZombie
lootTable[? tmpId] = ds_map_create();
var enemyTable = lootTable[? tmpId] 
enemyTable[? objGold] = 0.25;