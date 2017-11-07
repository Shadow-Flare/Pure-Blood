var lootTable = LootCache.lootTable[? object_index];
if lootTable != undefined
{
	var lootItem = -4;
	var lootProb = -4;

	for (var i = 0; i < ds_map_size(lootTable); ++i) 
	{
		if lootItem = -4 lootItem = ds_map_find_first(lootTable);
		else lootItem = ds_map_find_next(lootTable,lootItem);
		lootProb = lootTable[? lootItem];
	
		if random(1) < lootProb
		{
			with instance_create_depth(x,y,depth+1,lootItem)
			{
				var ang = random_range(30,150);
				var spd = random_range(2,3);
				xSpd = spd*dcos(ang);
				ySpd = -spd*dsin(ang);		
			}
		}
	}
	
	if variable_instance_exists(statCache,"killExp")
	{
		PlayerStats.xp += statCache.killExp;
	}
	if variable_instance_exists(statCache,"killGold")
	{
		if random(1) <= statCache.killGold[0]
		{
			PlayerStats.gold += irandom_range(statCache.killGold[1],statCache.killGold[2]);
		}
	}
}