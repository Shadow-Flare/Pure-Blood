///@arg string
///@arg sprite

var str = argument0;
var sprite = argument1;

ds_list_add(HudManager.messageFeed,str);
ds_list_add(HudManager.messageImages,sprite);
ds_list_add(HudManager.messageTimers,0);