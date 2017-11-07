//weapon class initializer	(will have to add clauses for initialization of DSs later on if we implement base combo tweaking)
weaponClassData = ds_map_create();
scr_set_weaponCategoriesData(weaponClass.sword);
scr_set_weaponCategoriesData(weaponClass.spear);

//type subCache initializer
items = ds_map_create();
items[? itemType.weapon] = ds_map_create();

#region all items
	#region weapons
var weaponCache = items[? itemType.weapon]
		#region swords
			#region gladius
weaponCache[? weaponItem.gladius] = ds_map_create();
var gladiusCache = weaponCache[? weaponItem.gladius];
gladiusCache[? weaponStats.name] = "Gladius";
gladiusCache[? weaponStats.type] = weaponClass.sword;
gladiusCache[? weaponStats.damage] = 3;
gladiusCache[? weaponStats.strMod] = 0.10;
gladiusCache[? weaponStats.dexMod] = 0.05;
gladiusCache[? weaponStats.stagger] = 1;
gladiusCache[? weaponStats.range] = 1;
gladiusCache[? weaponStats.specialType] = -1;
gladiusCache[? weaponStats.specialValue] = 0;
gladiusCache[? weaponStats.uniqueAttack] = 7;
gladiusCache[? weaponStats.misc] = noone;
			#endregion
		#endregion
		#region spears
			#region hastam
weaponCache[? weaponItem.hastam] = ds_map_create();
var hastamCache = weaponCache[? weaponItem.hastam];
hastamCache[? weaponStats.name] = "Hastam";
hastamCache[? weaponStats.type] = weaponClass.spear;
hastamCache[? weaponStats.damage] = 4;
hastamCache[? weaponStats.strMod] = 0.05;
hastamCache[? weaponStats.dexMod] = 0.15;
hastamCache[? weaponStats.stagger] = 1.1;
hastamCache[? weaponStats.range] = 1;
hastamCache[? weaponStats.specialType] = -1;
hastamCache[? weaponStats.specialValue] = 0;
hastamCache[? weaponStats.uniqueAttack] = 15;
hastamCache[? weaponStats.misc] = noone;
			#endregion
		#endregion
	#endregion
#endregion