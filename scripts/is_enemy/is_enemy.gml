///@arg firstActorType
///@arg secondActorType

var actor1Type = argument0;
var actor2Type = argument1;

	//only implement code for enemies
switch actor1Type
{
	case actorTypes.player:
		switch actor2Type
		{
			case actorTypes.enemy:
			case actorTypes.wild:
				return true;
				break;
		}
		break;
	case actorTypes.ally:
		switch actor2Type
		{
			case actorTypes.enemy:
			case actorTypes.wild:
				return true;
				break;
		}
		break;
	case actorTypes.enemy:
		switch actor2Type
		{
			case actorTypes.player:
			case actorTypes.ally:
			case actorTypes.wild:
				return true;
				break;
		}
		break;
	case actorTypes.wild:
		switch actor2Type
		{
			case actorTypes.player:
			case actorTypes.ally:
			case actorTypes.enemy:
			case actorTypes.wild:
				return true;
				break;
		}
		break;
	case actorTypes.corpse:
		// all false
		break;
}
return false;