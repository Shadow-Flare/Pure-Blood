///obtain item script for player
///@arg itemType.ENUM
///@arg ENUM_TYPE.ENUM
	//^Specific item id
///@arg number
var type = argument0;
var itemID = argument1;
var numberToAdd = argument2;
	
var inventoryCache = ItemCache.inventory;
var typeCache = inventoryCache[? type];

if typeCache[? itemID] == undefined typeCache[? itemID] = numberToAdd;
else typeCache[? itemID] += numberToAdd;