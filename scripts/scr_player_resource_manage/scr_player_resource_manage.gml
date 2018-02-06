///@arg resourceType.ENUM
///@arg mod
var type = argument0;
var modifier = argument1;

with ItemCache
{
	ResourceCache[? type] += modifier;
}


//player_resource_get(resourceType.gold);

/* in item cache:

enum resourceType{gold,exp,crystals}

ResourceCache = ds_map_create();
ResourceCache[? resourceType.gold] = 200;
ResourceCache[? resourceType.crystals] = 10;

*/
/* in another script

var gold = player_resource_get(resourceType.gold);
var crystals = player_resource_get(resourceType.crystals);

draw_text(12123,12121,string(gold);

*/