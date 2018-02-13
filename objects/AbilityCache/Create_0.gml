//ability enumerators
enum abilityType {combat, movement, support};
enum combatAbility {combo_plus, finisher_plus, aerial_plus, devastator_plus, aerial_defense, critical_boost};
enum movementAbility {double_jump, high_jump, glide};
enum supportAbility{exp_plus, hp_scan, mp_scan};

enum abilityStats {name, description, icon, cost, maxNum};
enum playerAbilityStats {numberOwned, numberActivated};

#region all abilities
	#region Initializer
ability = ds_map_create();
ability[? abilityType.combat] = ds_map_create();
ability[? abilityType.movement] = ds_map_create();
ability[? abilityType.support] = ds_map_create();
	#endregion
	#region combat
var combatCache = ability[? abilityType.combat];
		#region Combo Plus
combatCache[? combatAbility.combo_plus] = ds_map_create();
var cache = combatCache[? combatAbility.combo_plus];
cache[? abilityStats.name] = "Combo Plus";
cache[? abilityStats.description] = "Boosts ground combo length by 1. Extra copies of this ability further increase the ground combo length by 1.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 1;
cache[? abilityStats.maxNum] = 3;
		#endregion
		#region Finisher Plus
combatCache[? combatAbility.finisher_plus] = ds_map_create();
var cache = combatCache[? combatAbility.finisher_plus];
cache[? abilityStats.name] = "Finisher Plus";
cache[? abilityStats.description] = "Boosts ground finisher combo length by one. Extra copies of this ability further increase the ground finisher length by 1.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 4;
cache[? abilityStats.maxNum] = 2;
		#endregion
		#region Aerial Plus
combatCache[? combatAbility.aerial_plus] = ds_map_create();
var cache = combatCache[? combatAbility.aerial_plus];
cache[? abilityStats.name] = "Aerial Plus";
cache[? abilityStats.description] = "Boosts aerial combo length by 1. Extra copies of this ability further increase the aerial combo length by 1.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 1;
cache[? abilityStats.maxNum] = 3;
		#endregion
		#region Devastator Plus
combatCache[? combatAbility.devastator_plus] = ds_map_create();
var cache = combatCache[? combatAbility.devastator_plus];
cache[? abilityStats.name] = "Devastator Plus";
cache[? abilityStats.description] = "Boosts aerial finisher combo length by one. Extra copies of this ability further increase the aerial finisher length by 1.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 5;
cache[? abilityStats.maxNum] = 2;
		#endregion
		#region Aerial Defense
combatCache[? combatAbility.aerial_defense] = ds_map_create();
var cache = combatCache[? combatAbility.aerial_defense];
cache[? abilityStats.name] = "Aerial Defense";
cache[? abilityStats.description] = "Enables a mid-air version of your defense action. Press @B while mid-air to perform it. Defensive action whilst mid-air typically have a cooldown.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 2;
cache[? abilityStats.maxNum] = 1;
		#endregion
		#region Critical Boost
combatCache[? combatAbility.critical_boost] = ds_map_create();
var cache = combatCache[? combatAbility.critical_boost];
cache[? abilityStats.name] = "Critical Boost";
cache[? abilityStats.description] = "Boosts damage on a critical hit by 50%.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 3;
cache[? abilityStats.maxNum] = 2;
		#endregion
	#endregion
	#region movement
var movementCache = ability[? abilityType.movement];
		#region Double Jump
movementCache[? movementAbility.double_jump] = ds_map_create();
var cache = movementCache[? movementAbility.double_jump];
cache[? abilityStats.name] = "Double Jump";
cache[? abilityStats.description] = "Enables a second jump while mid-air. Tap @A a second time to jump again.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 4;
cache[? abilityStats.maxNum] = 1;
		#endregion
		#region High Jump
movementCache[? movementAbility.high_jump] = ds_map_create();
var cache = movementCache[? movementAbility.high_jump];
cache[? abilityStats.name] = "High Jump";
cache[? abilityStats.description] = "Boosts the height of your jump. Extra copies of this ability further increase the height.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 3;
cache[? abilityStats.maxNum] = 2;
		#endregion
		#region Glide
movementCache[? movementAbility.glide] = ds_map_create();
var cache = movementCache[? movementAbility.glide];
cache[? abilityStats.name] = "Glide";
cache[? abilityStats.description] = "Enables gliding while mid air. Hold @A to greatly slow your fall.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 3;
cache[? abilityStats.maxNum] = 1;
		#endregion
	#endregion
	#region support
var supportCache = ability[? abilityType.support];
		#region Exp Plus
supportCache[? supportAbility.exp_plus] = ds_map_create();
var cache = supportCache[? supportAbility.exp_plus];
cache[? abilityStats.name] = "Exp Plus";
cache[? abilityStats.description] = "Boosts experience gains by 25% from all sources. Extra copies of this ability stack multiplicatively.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 5;
cache[? abilityStats.maxNum] = 3;
		#endregion
		#region HP Scan
supportCache[? supportAbility.hp_scan] = ds_map_create();
var cache = supportCache[? supportAbility.hp_scan];
cache[? abilityStats.name] = "HP Scan";
cache[? abilityStats.description] = "Displays details on the locked-on enemies health when enabled.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 2;
cache[? abilityStats.maxNum] = 1;
		#endregion
		#region MP Scan
supportCache[? supportAbility.mp_scan] = ds_map_create();
var cache = supportCache[? supportAbility.mp_scan];
cache[? abilityStats.name] = "MP Scan";
cache[? abilityStats.description] = "Displays details on the locked-on enemies mana when enabled.";
cache[? abilityStats.icon] = undefined;
cache[? abilityStats.cost] = 2;
cache[? abilityStats.maxNum] = 1;
		#endregion
	#endregion
#endregion

#region Player abilities cache
playerAbilities = ds_map_create();
playerAbilities[? abilityType.combat] = ds_map_create();
playerAbilities[? abilityType.movement] = ds_map_create();
playerAbilities[? abilityType.support] = ds_map_create();
#endregion