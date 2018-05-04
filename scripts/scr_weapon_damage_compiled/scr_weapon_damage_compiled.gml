///@arg cache
var cache = argument0;

var totalDamage = 0;
totalDamage += cache[? weaponDamageDetails.physical];
totalDamage += cache[? weaponDamageDetails.fire];
totalDamage += cache[? weaponDamageDetails.ice];
totalDamage += cache[? weaponDamageDetails.lightning];
totalDamage += cache[? weaponDamageDetails.arcane];
totalDamage += cache[? weaponDamageDetails.light];
totalDamage += cache[? weaponDamageDetails.dark];

return totalDamage;