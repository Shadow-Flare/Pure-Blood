#region enum initializers
	//weapons enumerators
enum weaponClass {sword, spear}
enum weaponClassStats {name, groundComboLength, groundFinisherLength, aerialComboLength, aerialFinisherLength, groundComboDefault, groundFinisherDefault, aerialComboDefault, aerialFinisherDefault, counter, downwards, forwards, backwards};
enum weaponStats {name, type, damage, strMod, dexMod, stagger, range, specialType, specialValue, uniqueAttack, misc};
enum weaponComboTypes {groundCombo, groundFinisher, aerialCombo, aerialFinisher, extra};
enum extraComboTypes {upwards};

	//items enumerators
enum itemType {item, weapon, equipment, accessory, key, alchemy};
enum itemStats {icon, name, usable, description};
enum itemItem 
{
	
};
enum weaponItem
{
/* Swords */		gladius,
/* Spears */		hastam
};
enum equipmentItem 
{
	bomb, arrow, grappling_hook, shovel
};
enum accessoryItem
{
	
};
enum keyItem
{
	summon_stone, wooden_key, hearthstone
};
enum alchemyItem
{
	
};
#endregion

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
	#region equipments
var equipmentCache = item[? itemType.equipment];
			#region Bomb
equipmentCache[? equipmentItem.bomb] = ds_map_create();
var cache = equipmentCache[? equipmentItem.bomb];
cache[? itemStats.name] = "Bomb";
cache[? itemStats.icon] = spr_icon_item_equipment_bomb;
cache[? itemStats.description] = "i go BOOOOOOOOOM";
			#endregion
			#region Arrow
equipmentCache[? equipmentItem.arrow] = ds_map_create();
var cache = equipmentCache[? equipmentItem.arrow];
cache[? itemStats.name] = "Arrow";
cache[? itemStats.icon] = spr_icon_item_equipment_arrow;
cache[? itemStats.description] = "if used right, im sharp and pointy";
			#endregion
			#region Grappling Hook
equipmentCache[? equipmentItem.grappling_hook] = ds_map_create();
var cache = equipmentCache[? equipmentItem.grappling_hook];
cache[? itemStats.name] = "Grappling Hook";
cache[? itemStats.icon] = spr_icon_item_equipment_grappling_hook;
//cache[? itemStats.description] = "when using me don't go weeeeeeeeeeee";
			#endregion
			#region Shovel
equipmentCache[? equipmentItem.shovel] = ds_map_create();
var cache = equipmentCache[? equipmentItem.shovel];
cache[? itemStats.name] = "Shovel";
cache[? itemStats.icon] = spr_icon_item_equipment_shovel;
cache[? itemStats.description] = "i'm pretty much useless... sorry. ajsdlka jhsdklJH SADLKWJBE FKA W NDBCLSK XJGHCLIASDJHGM. abns dkAJSHD; Kajhd;kJDS HK;D FBN.bsd LK.ASJ GHDLKasjhd.";
			#endregion
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
cache[? itemStats.icon] = spr_icon_item_key_summon_stone;
cache[? itemStats.description] = "A stone that does some summoning or something.";
		#endregion
		#region Wooden Key
keyCache[? keyItem.wooden_key] = ds_map_create();
var cache = keyCache[? keyItem.wooden_key];
cache[? itemStats.name] = "Wooden Key";
cache[? itemStats.usable] = false;
cache[? itemStats.icon] = spr_icon_item_key_wooden_key;
cache[? itemStats.description] = "might be a simple key but it unlocks a world of wonders";
		#endregion
		#region Hearthstone
keyCache[? keyItem.hearthstone] = ds_map_create();
var cache = keyCache[? keyItem.hearthstone];
cache[? itemStats.name] = "Hearthstone";
cache[? itemStats.usable] = true;
cache[? itemStats.icon] = spr_icon_item_key_hearthstone;
cache[? itemStats.description] = "copy righted from WoW. I have no originality";
		#endregion
	#endregion
	#region alchemy items - not done
var alchemyCache = item[? itemType.alchemy];
	#endregion
#endregion

#region Player inventory
inventory = ds_map_create();
inventory[? itemType.item] = ds_map_create();
inventory[? itemType.weapon] = ds_map_create();
inventory[? itemType.equipment] = ds_map_create();
inventory[? itemType.accessory] = ds_map_create();
inventory[? itemType.key] = ds_map_create();
inventory[? itemType.alchemy] = ds_map_create();
#endregion