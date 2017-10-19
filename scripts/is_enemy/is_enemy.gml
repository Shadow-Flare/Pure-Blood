///@arg firstActor
///@arg secondActor

var actor1Type = argument0.actorType;
var actor2Type = argument1.actorType;

	//only implement code for enemies
switch actor1Type
{
	case actorTypes.player:
		switch actor2Type
		{
			case actorTypes.enemy:
				return true;
				break;
		}
		break;
	case actorTypes.ally:
		switch actor2Type
		{
			case actorTypes.enemy:
				return true;
				break;
		}
		break;
	case actorTypes.enemy:
		switch actor2Type
		{
			case actorTypes.player:
			case actorTypes.ally:
				return true;
				break;
		}
		break;
	case actorTypes.corpse:
		// all false
		break;
}
return false;