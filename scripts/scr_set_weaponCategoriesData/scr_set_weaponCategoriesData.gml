///@arg weaponCategory(ENUM)
var weaponCategory = argument0;
weaponClassData[? weaponCategory] = ds_map_create();
var weaponCache = weaponClassData[? weaponCategory];

weaponCache[? weaponClassStats.name] = ComboCache.classNames[? weaponCategory];
weaponCache[? weaponClassStats.groundComboLength] = ComboCache.groundComboLengths[? weaponCategory];
weaponCache[? weaponClassStats.groundComboDefault] = ComboCache.groundComboDefault[? weaponCategory];
weaponCache[? weaponClassStats.groundFinisherLength] = ComboCache.groundFinisherLengths[? weaponCategory];
weaponCache[? weaponClassStats.groundFinisherDefault] = ComboCache.groundFinisherDefault[? weaponCategory];
weaponCache[? weaponClassStats.aerialComboLength] = ComboCache.aerialComboLengths[? weaponCategory];
weaponCache[? weaponClassStats.aerialComboDefault] = ComboCache.aerialComboDefault[? weaponCategory];
weaponCache[? weaponClassStats.aerialFinisherLength] = ComboCache.aerialFinisherLengths[? weaponCategory];
weaponCache[? weaponClassStats.aerialFinisherDefault] = ComboCache.aerialFinisherDefault[? weaponCategory];
weaponCache[? weaponClassStats.counter] = ComboCache.counterIDs[? weaponCategory];
weaponCache[? weaponClassStats.downwards] = ComboCache.downwardsIDs[? weaponCategory];
weaponCache[? weaponClassStats.forwards] = ComboCache.forwardsIDs[? weaponCategory];
weaponCache[? weaponClassStats.backwards] = ComboCache.backwardsIDs[? weaponCategory];