///@arg room
///@arg x
///@arg y
var rm = argument0;
var xx = argument1;
var yy = argument2;
var envID = argument3;

ds_list_add(rmExits[?rm],[xx,yy]);

var cache = rmRevealData[? rm];
var rmDest = asset_get_index("rmRoomX"+string(xx)+"Y"+string(yy));

cache[? rmDest] = envID;