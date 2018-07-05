///@arg abilityType.ENUM
///@arg abilityID
///@arg x
///@arg y
///@arg strReq
///@arg conReq
///@arg dexReq
///@arg cunReq
///@arg intReq
///@arg wilReq
///@arg xConnections[...]
///@arg yConnections[...]
var type = argument0;
var ID = argument1;
var xCoord = argument2;
var yCoord = argument3;
var strReq = argument4;
var conReq = argument5;
var dexReq = argument6;
var cunReq = argument7;
var intReq = argument8;
var wilReq = argument9;
var xConnections = argument10;
var yConnections = argument11;

with AbilityCache
{
	var cache = ds_map_create();
	ds_list_add(talents,cache);
	cache[? talentStats.type] = type;
	cache[? talentStats.ID] = ID;
	cache[? talentStats.xCoord] = xCoord;
	cache[? talentStats.yCoord] = yCoord;
	cache[? talentStats.strReq] = strReq;
	cache[? talentStats.conReq] = conReq;
	cache[? talentStats.dexReq] = dexReq;
	cache[? talentStats.cunReq] = cunReq;
	cache[? talentStats.intReq] = intReq;
	cache[? talentStats.wilReq] = wilReq;
	cache[? talentStats.xConnections] = xConnections;
	cache[? talentStats.yConnections] = yConnections;
}