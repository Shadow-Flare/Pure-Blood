#region enum initializers
enum itemType {item, weapon, equipment, rune, key, alchemy};
enum itemStats {icon, name, pluralName, maxOwned, usable, description, equipSlot, effectsCache, weaponData, useAnimation, useDuration};
enum itemEffects {hp, mp, ap, str, con, dex, cun, int, wil, toughness, alacrity, memory, slashDef, bluntDef, pierceDef, fireRes, iceRes, lightningRes, arcaneRes, lightRes, darkRes, bleedRes, LENGTH};	//length just for checking enum amount, needed for other areas.
enum itemItem 
{
/* Ammo */				crossbow_bolt,
/* Misc */				summon_stone, hearthstone
};
enum weaponItem
{
/* offhands */		
	/* Crossbows */		crossbow,
	/* Grimoires */		spell_book,
/* mainHands */
	/* Swords */		gladius,
	/* Spears */		hastam,
	/* Great Hammers */	crucifix
};
enum equipmentItem 
{
/* Head  */				iron_helmet, bassinet, red_bandanna,
/* Chest */				iron_chestplate,
/* Hands */				rusted_gauntlets,
/* Legs  */				chainmail_leggings
};
enum runeItem
{
	dagaz, lagaz, kaunan
};
enum keyItem
{
/* Literal Keys */		wooden_key,
};
enum alchemyItem
{
	
};
#endregion

#region all items
//type subCache initializer
item = ds_map_create();
item[? itemType.item] = ds_map_create();
item[? itemType.weapon] = ds_map_create();
item[? itemType.equipment] = ds_map_create();
item[? itemType.rune] = ds_map_create();
item[? itemType.key] = ds_map_create();
item[? itemType.alchemy] = ds_map_create();

	#region items
var itemCache = item[? itemType.item];
		#region crossbow_bolt
	itemCache[? itemItem.crossbow_bolt] = ds_map_create();
	var cache = itemCache[? itemItem.crossbow_bolt];
	cache[? itemStats.name] = "Crossbow Bolt";
	cache[? itemStats.pluralName] = "Crossbow Bolts";
	cache[? itemStats.description] = "A typical crossbow bolt.";
	cache[? itemStats.icon] = spr_icon_item_item_crossbow_bolt;
	cache[? itemStats.usable] = false;
		#endregion
		#region Summon Stone
itemCache[? itemItem.summon_stone] = ds_map_create();
var cache = itemCache[? itemItem.summon_stone];
cache[? itemStats.name] = "Summon Stone";
cache[? itemStats.pluralName] = "Summon Stones";
cache[? itemStats.icon] = spr_icon_item_key_summon_stone;
cache[? itemStats.description] = "(TEST) Summons a shop.";
cache[? itemStats.usable] = true;
		#endregion
		#region Hearthstone
itemCache[? itemItem.hearthstone] = ds_map_create();
var cache = itemCache[? itemItem.hearthstone];
cache[? itemStats.name] = "Hearthstone";
cache[? itemStats.pluralName] = "Hearthstones";
cache[? itemStats.icon] = spr_icon_item_key_hearthstone;
cache[? itemStats.description] = "(TEST) Return to last checkpoint.";
cache[? itemStats.usable] = true;
		#endregion
	#endregion
	#region weapons
var weaponCache = item[? itemType.weapon];
			//main
		#region swords
			#region gladius
weaponCache[? weaponItem.gladius] = ds_map_create();
var cache = weaponCache[? weaponItem.gladius];
cache[? itemStats.name] = "Gladius";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_weapon_gladius;
cache[? itemStats.description] = "A basic long sword. The very standard of melee combat, the long sword is one of the easier weapons to train in.";
cache[? itemStats.equipSlot] = equipmentSlot.main1;
cache[? itemStats.effectsCache] = ds_map_create();
var eCache = cache[? itemStats.effectsCache];
cache[? itemStats.weaponData] = ds_map_create();
var wepData = cache[? itemStats.weaponData];
	wepData[? weaponStats.particleVolume] = 6;
	wepData[? weaponStats.type] = weaponClass.sword;
	wepData[? weaponStats.uniqueAttack] = comboID.sword_skyward_slice;
	wepData[? weaponStats.range] = 1;
	wepData[? weaponStats.weight] = 1.6;
	wepData[? weaponStats.strMod] = 0.10;
	wepData[? weaponStats.dexMod] = 0.05;
	wepData[? weaponStats.physicalDam] = 2;

			#endregion
		#endregion
		#region spears
			#region hastam
weaponCache[? weaponItem.hastam] = ds_map_create();
var cache = weaponCache[? weaponItem.hastam];
cache[? itemStats.name] = "Hastam";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_weapon_hastam;
cache[? itemStats.description] = "A basic Spear. Often handed to militias, designed for basic hunting and untrained combat. But with training it is capeable of much more. Excels particularly in aerial combat.";
cache[? itemStats.equipSlot] = equipmentSlot.main1;
cache[? itemStats.effectsCache] = ds_map_create();
var eCache = cache[? itemStats.effectsCache];
cache[? itemStats.weaponData] = ds_map_create();
var wepData = cache[? itemStats.weaponData]
	wepData[? weaponStats.type] = weaponClass.spear;
	wepData[? weaponStats.particleVolume] = 12;
	wepData[? weaponStats.uniqueAttack] = comboID.spear_drive;
	wepData[? weaponStats.range] = 1;
	wepData[? weaponStats.weight] = 1.8;
	wepData[? weaponStats.strMod] = 0.05;
	wepData[? weaponStats.dexMod] = 0.15;
	wepData[? weaponStats.physicalDam] = 2;
			#endregion
		#endregion
		#region great hammers
			#region crucifix
weaponCache[? weaponItem.crucifix] = ds_map_create();
var cache = weaponCache[? weaponItem.crucifix];
cache[? itemStats.name] = "Crucifix";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_weapon_crucifix;
cache[? itemStats.description] = "A sanctified wallpiece used as an improvised hammer. <LORE>";
cache[? itemStats.equipSlot] = equipmentSlot.main1;
cache[? itemStats.effectsCache] = ds_map_create();
var eCache = cache[? itemStats.effectsCache];
cache[? itemStats.weaponData] = ds_map_create();
var wepData = cache[? itemStats.weaponData]
	wepData[? weaponStats.type] = weaponClass.greatHammer;
	wepData[? weaponStats.particleVolume] = 18;
	wepData[? weaponStats.uniqueAttack] = comboID.greatHammer_divineJudgement;
	wepData[? weaponStats.range] = 1.1;
	wepData[? weaponStats.weight] = 1.8;
	wepData[? weaponStats.strMod] = 0.25;
	wepData[? weaponStats.dexMod] = 0.0;
	wepData[? weaponStats.intMod] = 0.3;
	wepData[? weaponStats.physicalDam] = 2.5;
	wepData[? weaponStats.lightDam] = 1;
			#endregion
		#endregion
			//off
		#region crossbows
			#region crossbow
weaponCache[? weaponItem.crossbow] = ds_map_create();
var cache = weaponCache[? weaponItem.crossbow];
cache[? itemStats.name] = "Crossbow";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_weapon_crossbow;
cache[? itemStats.description] = "A basic one-handed crossbow. Hunters often lack the time to properly handle a bow or even a crossbow in the middle of a fight, as such an easier to wield, one-handed variant of the crossbow was developed.";
cache[? itemStats.equipSlot] = equipmentSlot.off1;
cache[? itemStats.effectsCache] = ds_map_create();
var eCache = cache[? itemStats.effectsCache];
cache[? itemStats.weaponData] = ds_map_create();
var wepData = cache[? itemStats.weaponData]
	wepData[? weaponStats.type] = weaponClass.crossbow;
	wepData[? weaponStats.weight] = 0.6;
	wepData[? weaponStats.strMod] = 0.05;
	wepData[? weaponStats.dexMod] = 0.3;
	wepData[? weaponStats.physicalDam] = 1;
				#endregion
		#endregion
		#region grimoires
			#region spell_book
weaponCache[? weaponItem.spell_book] = ds_map_create();
var cache = weaponCache[? weaponItem.spell_book];
cache[? itemStats.name] = "Spell Book";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_weapon_spell_book;
cache[? itemStats.description] = "A basic grimoire. The mages college has long studied the ways of magic, this magical tome is one of the fruits of those labours.";
cache[? itemStats.equipSlot] = equipmentSlot.off1;
cache[? itemStats.effectsCache] = ds_map_create();
var eCache = cache[? itemStats.effectsCache];
cache[? itemStats.weaponData] = ds_map_create();
var wepData = cache[? itemStats.weaponData]
	wepData[? weaponStats.type] = weaponClass.grimoire;
	wepData[? weaponStats.weight] = 1.4;
	wepData[? weaponStats.intMod] = 0.2;
	wepData[? weaponStats.arcaneDam] = 3.5;
				#endregion
		#endregion
	#endregion
	#region equipments
var equipmentCache = item[? itemType.equipment];
		#region Head
			#region Iron Helmet
equipmentCache[? equipmentItem.iron_helmet] = ds_map_create();
var cache = equipmentCache[? equipmentItem.iron_helmet];
cache[? itemStats.name] = "Iron Helmet";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_equipment_iron_helmet;
cache[? itemStats.description] = "Protective headgear, a crude design of forged iron.";
cache[? itemStats.equipSlot] = equipmentSlot.head;
cache[? itemStats.effectsCache] = ds_map_create();
	var effCache = cache[? itemStats.effectsCache];
	effCache[? itemEffects.slashDef] = 2;
	effCache[? itemEffects.bluntDef] = 1;
	effCache[? itemEffects.pierceDef] = 1;
			#endregion
			#region Bassinet
equipmentCache[? equipmentItem.bassinet] = ds_map_create();
var cache = equipmentCache[? equipmentItem.bassinet];
cache[? itemStats.name] = "Bassinet";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_equipment_bassinet;
cache[? itemStats.description] = "Ancient medieval headwear. Made of a complex weave of plate and chainmail.";
cache[? itemStats.equipSlot] = equipmentSlot.head;
cache[? itemStats.effectsCache] = ds_map_create();
	var effCache = cache[? itemStats.effectsCache];
	effCache[? itemEffects.slashDef] = 5;
	effCache[? itemEffects.bluntDef] = 2;
	effCache[? itemEffects.pierceDef] = 2;
			#endregion
			#region Red Bandanna
equipmentCache[? equipmentItem.red_bandanna] = ds_map_create();
var cache = equipmentCache[? equipmentItem.red_bandanna];
cache[? itemStats.name] = "Red Bandanna";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_equipment_red_bandanna;
cache[? itemStats.description] = "A red-dyed cloth wrapped about the head. Offers minimal defensive protection, but it has been said to make the wearer feel bolder.";
cache[? itemStats.equipSlot] = equipmentSlot.head;
cache[? itemStats.effectsCache] = ds_map_create();
	var effCache = cache[? itemStats.effectsCache];
	effCache[? itemEffects.slashDef] = 1;
	effCache[? itemEffects.str] = 2;
			#endregion
		#endregion
		#region Chest
			#region Iron Chestplate
equipmentCache[? equipmentItem.iron_chestplate] = ds_map_create();
var cache = equipmentCache[? equipmentItem.iron_chestplate];
cache[? itemStats.name] = "Iron Chestplate";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_equipment_iron_chestplate;
cache[? itemStats.description] = "A crude, battered chestplate of old. Once used in a great battle no doubt, but its ornate decoration has long lost its lustor.";
cache[? itemStats.equipSlot] = equipmentSlot.chest;
cache[? itemStats.effectsCache] = ds_map_create();
	var effCache = cache[? itemStats.effectsCache];
	effCache[? itemEffects.slashDef] = 5;
	effCache[? itemEffects.bluntDef] = 1;
	effCache[? itemEffects.pierceDef] = 3;
			#endregion
		#endregion
		#region Hands
			#region Rusted Gauntlets
equipmentCache[? equipmentItem.rusted_gauntlets] = ds_map_create();
var cache = equipmentCache[? equipmentItem.rusted_gauntlets];
cache[? itemStats.name] = "Rusted Gauntlets";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_equipment_rusted_gauntlets;
cache[? itemStats.description] = "Heavy metal gauntlets, designed for hand protection. Metal plates bound around a tattered leather glove, time has left both the metal and the leather's quality wanting.";
cache[? itemStats.equipSlot] = equipmentSlot.hands;
cache[? itemStats.effectsCache] = ds_map_create();
	var effCache = cache[? itemStats.effectsCache];
	effCache[? itemEffects.slashDef] = 1;
	effCache[? itemEffects.bluntDef] = 0;
	effCache[? itemEffects.pierceDef] = 2;
			#endregion
		#endregion
		#region Legs
			#region Chainmail Leggings
equipmentCache[? equipmentItem.chainmail_leggings] = ds_map_create();
var cache = equipmentCache[? equipmentItem.chainmail_leggings];
cache[? itemStats.name] = "Chainmail Leggings";
cache[? itemStats.maxOwned] = noone;
cache[? itemStats.icon] = spr_icon_item_equipment_chainmail_leggings;
cache[? itemStats.description] = "Chailmail chausses designed to mitigate the slashing and stabbing impacts of a sword. These however are old and rusted, with a large section missing. Still, one could do worse.";
cache[? itemStats.equipSlot] = equipmentSlot.legs;
cache[? itemStats.effectsCache] = ds_map_create();
	var effCache = cache[? itemStats.effectsCache];
	effCache[? itemEffects.slashDef] = 3;
	effCache[? itemEffects.bluntDef] = 3;
	effCache[? itemEffects.pierceDef] = 2;
			#endregion
		#endregion
	#endregion
	#region runes
var runeCache = item[? itemType.rune];
		#region Dagaz
		runeCache[? runeItem.dagaz] = ds_map_create();
		var cache = runeCache[? runeItem.dagaz];
		cache[? itemStats.name] = "Dagaz";
		cache[? itemStats.maxOwned] = 1;
		cache[? itemStats.icon] = spr_icon_item_rune_dagaz;
		cache[? itemStats.description] = "Boosts Constitution";
		cache[? itemStats.effectsCache] = ds_map_create();
		var effCache = cache[? itemStats.effectsCache];
		effCache[? itemEffects.con] = 2;
		#endregion
		#region Lagaz
		runeCache[? runeItem.lagaz] = ds_map_create();
		var cache = runeCache[? runeItem.lagaz];
		cache[? itemStats.name] = "Lagaz";
		cache[? itemStats.maxOwned] = 1;
		cache[? itemStats.icon] = spr_icon_item_rune_lagaz;
		cache[? itemStats.description] = "Boosts Willpower";
		cache[? itemStats.effectsCache] = ds_map_create();
		var effCache = cache[? itemStats.effectsCache];
		effCache[? itemEffects.wil] = 2;
		#endregion
		#region Kaunan
		runeCache[? runeItem.kaunan] = ds_map_create();
		var cache = runeCache[? runeItem.kaunan];
		cache[? itemStats.name] = "Kaunan";
		cache[? itemStats.maxOwned] = 1;
		cache[? itemStats.icon] = spr_icon_item_rune_kaunan;
		cache[? itemStats.description] = "Boosts Strength";
		cache[? itemStats.effectsCache] = ds_map_create();
		var effCache = cache[? itemStats.effectsCache];
		effCache[? itemEffects.str] = 2;
		#endregion
	#endregion
	#region keys
var keyCache = item[? itemType.key];
		#region Wooden Key
keyCache[? keyItem.wooden_key] = ds_map_create();
var cache = keyCache[? keyItem.wooden_key];
cache[? itemStats.name] = "Wooden Key";
cache[? itemStats.maxOwned] = 99;
cache[? itemStats.usable] = false;
cache[? itemStats.icon] = spr_icon_item_key_wooden_key;
cache[? itemStats.description] = "might be a simple key but it unlocks a world of wonders";
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
inventory[? itemType.rune] = ds_map_create();
inventory[? itemType.key] = ds_map_create();
inventory[? itemType.alchemy] = ds_map_create();
#endregion
#region Player equipment
equipment = ds_map_create();
equipment[? equipmentSlot.rune] = ds_list_create();
equipment[? equipmentSlot.item] = ds_list_create();
ds_list_add(equipment[? equipmentSlot.item],noone,noone,noone,noone);
#endregion