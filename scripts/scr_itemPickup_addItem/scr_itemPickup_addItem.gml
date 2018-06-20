///@arg itemType.ENUM
///@arg index
///@arg amount
var type = argument0;
var index = argument1;
var amount = max(1,argument2);

var newID = ds_list_size(itemList);
ds_list_add(itemList,ds_list_create());
var newSubList = itemList[| newID];

ds_list_add(newSubList,type,index,amount);