	//weapons enumerators
enum weaponClass {sword, spear}
enum weaponClassStats {name, groundComboLength, groundFinisherLength, aerialComboLength, aerialFinisherLength, groundComboDefault, groundFinisherDefault, aerialComboDefault, aerialFinisherDefault, counter, downwards, forwards, backwards};
enum weaponStats {name, type, damage, strMod, dexMod, stagger, range, specialType, specialValue, uniqueAttack, misc};
enum weaponComboTypes {groundCombo, groundFinisher, aerialCombo, aerialFinisher, extra};
enum extraComboTypes {upwards};

	//items enumerators
enum itemType {item, weapon, equipment, accessory, key, alchemy};
enum itemStats {name, usable};
enum itemItem {};
enum weaponItem
{
/* Swords */		gladius,
/* Spears */		hastam
};
enum equipmentItem {};
enum accessoryItem {};
enum keyItem
{
/* Usable */		summon_stone
/* Non-Usable*/		
};
enum alchemyItem {};

//weapon class initializer	(will have to add clauses for initialization of DSs later on if we implement base combo tweaking)
weaponClassData = ds_map_create();
scr_set_weaponCategoriesData(weaponClass.sword);
scr_set_weaponCategoriesData(weaponClass.spear);

//type subCache initializer
	//enum itemType {item, weapon, equipment, accessory, key, alchemy};
item = ds_map_create();
item[? itemType.item] = ds_map_create();
item[? itemType.weapon] = ds_map_create();
item[? itemType.equipment] = ds_map_create();
item[? itemType.accessory] = ds_map_create();
item[? itemType.key] = ds_map_create();
item[? itemType.alchemy] = ds_map_create();

#region all items
	#region items - not done
var itemCache = item[? itemType.item];
	#endregion
	#region weapons
var weaponCache = item[? itemType.weapon]
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
	#region equipments - not done
var equipmentCache = item[? itemType.equipment];
	#endregion
	#region accessories - not done
var accessoryCache = item[? itemType.accessory];
	#endregion
	#region keys
var keyCache = item[? itemType.key];
		#region Summon Stone
keyCache[? keyItem.summon_stone] = ds_map_create();
var cache = keyCache[? keyItem.summon_stone];
cache[? itemStats.name] = "Summon Stone";
cache[? itemStats.usable] = true;
		#endregion
	#endregion
	#region alchemy items - not done
var alchemyCache = item[? itemType.alchemy];
	#endregion
#endregion

#region Player inventory
	#region initialize
inventory = ds_map_create();
inventory[? itemType.item] = ds_map_create();
inventory[? itemType.weapon] = ds_map_create();
inventory[? itemType.equipment] = ds_map_create();
inventory[? itemType.accessory] = ds_map_create();
inventory[? itemType.key] = ds_map_create();
inventory[? itemType.alchemy] = ds_map_create();
	#endregion

#endregion