///@arg effectID
var effectID = argument0;

//enum itemEffects {hp, mp, ap, str, con, dex, cun, int, wis, physPow, physFor, physTough, magPow, magFor, magTough, slashDef, bluntDef, pierceDef, fireRes, iceRes, lightningRes, arcaneRes, lightRes, darkRes, bleedRes};


switch effectID
{
	case itemEffects.hp: return "Health" break;
	case itemEffects.mp: return "Mana" break;
	case itemEffects.ap: return "Ability" break;
	
	case itemEffects.str: return "Strength" break;
	case itemEffects.con: return "Constitution" break;
	case itemEffects.dex: return "Dexterity" break;
	case itemEffects.cun: return "Cunning" break;
	case itemEffects.int: return "Intelligence" break;
	case itemEffects.wil: return "Willpower" break;
	
	case itemEffects.physPow: return "Power" break;
	case itemEffects.physFor: return "Force" break;
	case itemEffects.physTough: return "Toughness" break;
	case itemEffects.magPow: return "Magic" break;
	case itemEffects.magFor: return "Kinesis" break;
	case itemEffects.magTough: return "Spirit" break;
	
	case itemEffects.slashDef: return "Slash Defence" break;
	case itemEffects.bluntDef: return "Blunt Defence" break;
	case itemEffects.pierceDef: return "Pierce Defence" break;
	
	case itemEffects.fireRes: return "Fire Resist" break;
	case itemEffects.iceRes: return "Ice Resist" break;
	case itemEffects.lightningRes: return "Lightning Resist" break;
	case itemEffects.arcaneRes: return "Arcane Resist" break;
	case itemEffects.lightRes: return "Light Resist" break;
	case itemEffects.darkRes: return "Dark Resist" break;
	
	case itemEffects.bleedRes: return "Bleed Resist" break;
}

return undefined;