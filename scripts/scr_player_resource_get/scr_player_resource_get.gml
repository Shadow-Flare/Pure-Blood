///@arg resourceType.ENUM
var type = argument0;

with ItemCache 
{
	var amount = ResourceCache[? type];
	return amount;
}

/* in item cache:

ResourceCache = ds_map_create();
ResourceCache[? resourceType.gold] = 200;
ResourceCache[? resourceType.crystals] = 10;

*/
/* in another script

var gold = player_resource_get(resourceType.gold);
var crystals = player_resource_get(resourceType.crystals);

draw_text(12123,12121,string(gold);

*/
